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

test('HTTP: a player shares their GIF link, others see it with them, and nobody else can change it', async () => {
    const core = createCore({ channels: { general: '1' } });
    const media = createMediaStore({ fetcher: fakeFetch({}) });
    const server = createServer(createHandler({ core, media, send: async () => ({}) }));
    await new Promise((resolve) => server.listen(0, resolve));
    const base = `http://127.0.0.1:${server.address().port}`;
    const call = (path, method, body) =>
        fetch(base + path, { method, body: body && JSON.stringify(body) }).then(async (res) => ({
            status: res.status,
            body: await res.json(),
        }));

    try {
        const me = { id: 42, name: 'me' };
        const link = 'https://tenor.com/view/cat-dance-gif-123';
        const set = await call('/v1/profile', 'PUT', { user: me, media: { url: link, slot: 'logo' } });
        assert.equal(set.status, 200);
        assert.ok(set.body.token);
        assert.equal(set.body.media.url, link);
        assert.equal(set.body.media.slot, 'logo');

        // someone else in the server sees my link on my plate
        await call('/v1/presence', 'POST', { user: me, jobId: 'job' });
        const seen = await call('/v1/presence', 'POST', { user: { id: 7 }, jobId: 'job' });
        assert.equal(seen.body.users.find((u) => u.id === 42).media.url, link);

        // no token (or the wrong one): refused
        const hijack = await call('/v1/profile', 'PUT', { user: me, media: { url: link } });
        assert.equal(hijack.status, 403);
        const cleared = await call('/v1/profile', 'DELETE', { user: me, token: set.body.token });
        assert.equal(cleared.status, 200);
        const after = await call('/v1/presence', 'POST', { user: { id: 7 }, jobId: 'job' });
        assert.equal(after.body.users.find((u) => u.id === 42).media, undefined);

        // links are checked before they're shared
        const bad = await call('/v1/profile', 'PUT', { user: { id: 43 }, media: { url: 'https://evil.example.com/x.gif' } });
        assert.equal(bad.status, 400);
        const plain = await call('/v1/profile', 'PUT', { user: { id: 44 }, media: { url: 'http://i.imgur.com/a.gif' } });
        assert.equal(plain.status, 400);
    } finally {
        server.close();
    }
});

test('the sheet route still converts links for formats a script can’t decode', async () => {
    const gif = await makeGif(3);
    const media = createMediaStore({ fetcher: fakeFetch({ 'https://media.tenor.com/me.gif': { body: gif } }) });
    const meta = await media.add('https://media.tenor.com/me.gif', 'banner');
    assert.equal(meta.frames, 3);
    assert.ok(media.read(meta.id).length > 0);
});
