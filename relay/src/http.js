// The HTTP side: two routes the Chat element calls, plus a health check. `send` posts a checked
// message to Discord and resolves to the stored message; it's passed in so this can be tested
// without Discord.

const MAX_BODY = 4096;

export function createHandler({ core, send, key }) {
    return async function handle(req, res) {
        const reply = (status, body) => {
            res.writeHead(status, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
            res.end(JSON.stringify(body));
        };
        try {
            const url = new URL(req.url, 'http://relay');
            if (url.pathname === '/health') return reply(200, { ok: true });

            if (key && url.pathname.startsWith('/v1/') && req.headers['x-chat-key'] !== key) {
                return reply(401, { error: 'Wrong chat key.' });
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
