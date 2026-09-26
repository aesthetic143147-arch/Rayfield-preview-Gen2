// The HTTP side: two routes the Chat element calls, plus a health check. `send` posts a checked
// message to Discord and resolves to the stored message; it's passed in so this can be tested
// without Discord.

const MAX_BODY = 4096;

import { checkLink, MediaError, mediaId } from './media.js';

export function createHandler({ core, send, key, media }) {
    return async function handle(req, res) {
        const reply = (status, body) => {
            res.writeHead(status, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
            res.end(JSON.stringify(body));
        };
        const readJson = async () => {
            const raw = await readBody(req);
            if (raw === null) return { error: reply(413, { error: 'Request too large.' }) };
            try {
                return { body: JSON.parse(raw || '{}') };
            } catch {
                return { error: reply(400, { error: 'Bad request.' }) };
            }
        };
        try {
            const url = new URL(req.url, 'http://relay');
            if (url.pathname === '/health') return reply(200, { ok: true });

            // sprite sheets are plain downloads (the script's image loader can't send headers)
            const isSheet = /^\/v1\/media\/[a-f0-9]{16}\.png$/.test(url.pathname);
            if (key && url.pathname.startsWith('/v1/') && !isSheet && req.headers['x-chat-key'] !== key) {
                return reply(401, { error: 'Wrong chat key.' });
            }

            // custom nameplate images: the converted sprite sheets, and turning a link into one
            const sheet = url.pathname.match(/^\/v1\/media\/([a-f0-9]{16})\.png$/);
            if (sheet) {
                const png = media?.read(sheet[1]);
                if (!png) return reply(404, { error: 'Not found.' });
                res.writeHead(200, { 'Content-Type': 'image/png', 'Cache-Control': 'public, max-age=86400' });
                return res.end(png);
            }
            if (url.pathname === '/v1/media' || url.pathname === '/v1/profile') {
                if (!media) return reply(404, { error: 'Custom images are turned off on this relay.' });
                const { body, error } = await readJson();
                if (error) return error;
                if (req.method !== 'DELETE' && !core.uploadAllowed(clientIp(req))) {
                    return reply(429, { error: 'Too many changes. Wait a minute.', retryAfter: 30 });
                }
                try {
                    if (url.pathname === '/v1/media' && req.method === 'POST') {
                        return reply(200, await media.add(String(body.url ?? ''), body.fit));
                    }
                    if (url.pathname === '/v1/profile' && (req.method === 'PUT' || req.method === 'DELETE')) {
                        const claim = core.claimProfile(body);
                        if (!claim.ok) return reply(claim.status, { error: claim.error });
                        if (req.method === 'DELETE' || !body.media?.url) {
                            claim.clear();
                            return reply(200, { ok: true, token: claim.token });
                        }
                        // just the link: every player's script converts it itself, so nothing here can
                        // fail on an odd GIF, and the relay never has to fetch it
                        const slot = body.media.slot === 'logo' ? 'logo' : 'backdrop';
                        const link = checkLink(String(body.media.url), media.hosts);
                        const saved = { url: link, slot, id: mediaId(link, slot) };
                        claim.save(saved);
                        return reply(200, { ok: true, token: claim.token, media: saved });
                    }
                    return reply(405, { error: 'Method not allowed.' });
                } catch (failure) {
                    if (failure instanceof MediaError) return reply(400, { error: failure.message });
                    throw failure;
                }
            }

            // nameplates: POST to check in (and get who else is here), DELETE to leave
            if (url.pathname === '/v1/presence') {
                if (req.method !== 'POST' && req.method !== 'DELETE') return reply(405, { error: 'Method not allowed.' });
                const raw = await readBody(req);
                let body;
                try {
                    body = JSON.parse(raw ?? '');
                } catch {
                    return reply(400, { error: 'Bad request.' });
                }
                const result = req.method === 'POST' ? core.checkIn(body, clientIp(req)) : core.checkOut(body);
                return reply(result.status, result.body);
            }

            const match = url.pathname.match(/^\/v1\/chat\/([^/]+)\/?$/);
            if (!match) return reply(404, { error: 'Not found.' });

            const channel = decodeURIComponent(match[1]);
            const ip = clientIp(req);

            if (req.method === 'GET') {
                const since = url.searchParams.get('since') ?? undefined;
                const { status, body } = core.snapshot(channel, since, ip);
                return reply(status, body);
            }
            if (req.method === 'POST') {
                const raw = await readBody(req);
                if (raw === null) return reply(413, { error: 'Message too large.' });
                let body;
                try {
                    body = JSON.parse(raw);
                } catch {
                    return reply(400, { error: 'Bad request.' });
                }
                const checked = core.prepareSend(channel, body, ip);
                if (!checked.ok) {
                    return reply(checked.status, { error: checked.error, retryAfter: checked.retryAfter });
                }
                checked.commit();
                const message = await send(checked);
                return reply(200, { ok: true, message });
            }
            return reply(405, { error: 'Method not allowed.' });
        } catch (error) {
            console.error('[relay]', error);
            return reply(502, { error: 'Couldn’t reach Discord. Try again.' });
        }
    };
}

// Behind a tunnel or proxy the real address is in a header; directly, it's the socket's.
function clientIp(req) {
    const forwarded = req.headers['cf-connecting-ip'] ?? req.headers['x-forwarded-for'];
    if (typeof forwarded === 'string' && forwarded) return forwarded.split(',')[0].trim();
    return req.socket?.remoteAddress ?? 'unknown';
}

function readBody(req) {
    return new Promise((resolve, reject) => {
        let size = 0;
        const chunks = [];
        // past the limit, keep draining (and discarding) so the 413 can still be answered
        req.on('data', (chunk) => {
            size += chunk.length;
            if (size <= MAX_BODY) chunks.push(chunk);
        });
        req.on('end', () => resolve(size > MAX_BODY ? null : Buffer.concat(chunks).toString('utf8')));
        req.on('error', reject);
    });
}
