import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { test } from 'node:test';
import sharp from 'sharp';
import { createCore } from '../src/core.js';
import { createHandler } from '../src/http.js';
import { createMediaStore, fetchImage, toSheet } from '../src/media.js';

// An animated GIF made on the spot: `count` solid frames, 100ms each.
async function makeGif(count, width = 64, height = 32) {
    const frames = await Promise.all(
        Array.from({ length: count }, (_, i) =>
            sharp({ create: { width, height, channels: 3, background: { r: (i * 40) % 255, g: 80, b: 200 } } })
                .raw()
                .toBuffer(),
        ),
    );
    return sharp(Buffer.concat(frames), { raw: { width, height: height * count, channels: 3, pageHeight: height } })
        .gif({ delay: Array(count).fill(100), loop: 0 })
        .toBuffer();
}

// A fetch stand-in serving fixed responses by URL.
function fakeFetch(routes) {
    return async (url) => {
        const route = routes[url];
        if (!route) return new Response('nope', { status: 404 });
        if (route.redirect) return new Response(null, { status: 302, headers: { location: route.redirect } });
        return new Response(route.body, { status: 200, headers: { 'content-type': route.type ?? 'image/gif' } });
    };
}

test('a GIF becomes a sprite sheet: every frame, in a grid within 1024px, at its speed', async () => {
    const { png, meta } = await toSheet(await makeGif(5), 'banner');
    assert.deepEqual(meta, { frames: 5, columns: 3, frameWidth: 320, frameHeight: 80, fps: 10, fit: 'banner' });
    const sheet = await sharp(png).metadata();
    assert.equal(sheet.width, 960);
    assert.equal(sheet.height, 160); // 3 + 2 frames in two rows
});

test('a long GIF keeps an even selection of frames that fits, and a still image is one frame', async () => {
    const { meta } = await toSheet(await makeGif(50, 32, 32), 'square');
    assert.equal(meta.frames, 36); // 6 x 6 squares of 160px fit in 1024
    assert.ok(meta.fps < 10, 'slower, so it still takes the GIF’s full length');

    const still = await sharp({ create: { width: 50, height: 50, channels: 3, background: '#fff' } }).png().toBuffer();
    const one = await toSheet(still, 'square');
    assert.equal(one.meta.frames, 1);
    assert.equal(one.meta.fps, 0);
});

test('downloads only from allowed hosts, over https, following only allowed redirects', async () => {
    const gif = await makeGif(2);
    const fetcher = fakeFetch({
        'https://media.tenor.com/a.gif': { body: gif },
        'https://i.imgur.com/r': { redirect: 'https://evil.example.com/x.gif' },
        'https://i.imgur.com/page': { body: '<html>', type: 'text/html' },
    });
    assert.equal((await fetchImage('https://media.tenor.com/a.gif', { fetcher })).length, gif.length);
    await assert.rejects(fetchImage('http://media.tenor.com/a.gif', { fetcher }), /https/);
    await assert.rejects(fetchImage('https://evil.example.com/x.gif', { fetcher }), /can come from/);
    await assert.rejects(fetchImage('https://i.imgur.com/r', { fetcher }), /can come from/);
    await assert.rejects(fetchImage('https://i.imgur.com/page', { fetcher }), /isn’t an image/);
});

test('HTTP: a player sets their own GIF, others see it with them, and nobody else can change it', async () => {
    const gif = await makeGif(3);
    const core = createCore({ channels: { general: '1' } });
    const media = createMediaStore({ fetcher: fakeFetch({ 'https://media.tenor.com/me.gif': { body: gif } }) });
    const server = createServer(createHandler({ core, media, send: async () => ({}) }));
    await new Promise((resolve) => server.listen(0, resolve));
    const base = `http://127.0.0.1:${server.address().port}`;
    const call = (path, method, body) =>
        fetch(base + path, { method, body: body && JSON.stringify(body) }).then(async (res) => ({
            status: res.status,
            type: res.headers.get('content-type'),
            body: res.headers.get('content-type')?.includes('json') ? await res.json() : await res.arrayBuffer(),
        }));

    try {
        const me = { id: 42, name: 'me' };
        const set = await call('/v1/profile', 'PUT', { user: me, media: { url: 'https://media.tenor.com/me.gif', slot: 'backdrop' } });
        assert.equal(set.status, 200);
        assert.ok(set.body.token);
        assert.equal(set.body.media.frames, 3);
        assert.equal(set.body.media.slot, 'backdrop');

        // someone else in the server sees it on my plate, and can download the sheet
        await call('/v1/presence', 'POST', { user: me, jobId: 'job' });
        const seen = await call('/v1/presence', 'POST', { user: { id: 7 }, jobId: 'job' });
        const mine = seen.body.users.find((u) => u.id === 42);
        assert.equal(mine.media.id, set.body.media.id);
        const png = await call(`/v1/media/${mine.media.id}.png`, 'GET');
        assert.equal(png.type, 'image/png');

        // no token (or the wrong one): refused
        const hijack = await call('/v1/profile', 'PUT', { user: me, media: { url: 'https://media.tenor.com/me.gif' } });
        assert.equal(hijack.status, 403);
        // the right token can clear it
        const cleared = await call('/v1/profile', 'DELETE', { user: me, token: set.body.token });
        assert.equal(cleared.status, 200);
        const after = await call('/v1/presence', 'POST', { user: { id: 7 }, jobId: 'job' });
        assert.equal(after.body.users.find((u) => u.id === 42).media, undefined);

        const bad = await call('/v1/media', 'POST', { url: 'https://evil.example.com/x.gif' });
        assert.equal(bad.status, 400);
    } finally {
        server.close();
    }
});
