import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { test } from 'node:test';
import { cleanContent, createCore, readableContent, webhookName } from '../src/core.js';
import { createHandler } from '../src/http.js';

const CHANNEL = '111111111111111111';
const player = { id: 12345, name: 'SpecUser', displayName: 'Spec User' };

function makeCore(options = {}) {
    let clock = 1_000_000;
    const core = createCore({ channels: { general: CHANNEL }, now: () => clock, ...options });
    return { core, tick: (ms) => (clock += ms) };
}

test('polls get the window, then "unchanged" until something moves', () => {
    const { core } = makeCore();
    core.ingest(CHANNEL, { id: '10', content: 'hi', time: 1, author: { name: 'Mod', discord: true } });

    const first = core.snapshot('general');
    assert.equal(first.status, 200);
    assert.equal(first.body.messages.length, 1);

    const again = core.snapshot('general', String(first.body.version));
    assert.deepEqual(again.body, { version: first.body.version, unchanged: true });

    core.edit(CHANNEL, '10', 'hi (edited)');
    const edited = core.snapshot('general', String(first.body.version));
    assert.equal(edited.body.messages[0].content, 'hi (edited)');

    core.remove(CHANNEL, ['10']);
    assert.equal(core.snapshot('general').body.messages.length, 0);
    assert.equal(core.snapshot('nope').status, 404);
});

test('keeps messages in Discord order and only the newest 100', () => {
    const { core } = makeCore();
    for (let i = 150; i >= 1; i--) core.ingest(CHANNEL, { id: String(1000 + i), content: `m${i}`, author: { name: 'P' } });
    const { messages } = core.snapshot('general').body;
    assert.equal(messages.length, 100);
    assert.equal(messages[0].content, 'm51');
    assert.equal(messages.at(-1).content, 'm150');
});

test('checks a player message: cleaned, limited, and rate limited per player', () => {
    const { core, tick } = makeCore({ allowInvites: false });

    const ok = core.prepareSend('general', { content: '  hey @everyone ​\n\n\n\nbye ', user: player }, '1.1.1.1');
    assert.equal(ok.ok, true);
    assert.equal(ok.content, 'hey @​everyone \n\nbye');
    assert.deepEqual(ok.author, { name: 'Spec User', roblox: 12345 });
    assert.equal(ok.username, 'Spec User (@SpecUser)');
    ok.commit();

    const tooSoon = core.prepareSend('general', { content: 'again', user: player }, '1.1.1.1');
    assert.equal(tooSoon.status, 429);
    tick(2000);
    const repeat = core.prepareSend('general', { content: 'hey @everyone \n\nbye', user: player }, '2.2.2.2');
    assert.equal(repeat.error, 'You just said that.');

    assert.equal(core.prepareSend('general', { content: 'x'.repeat(301), user: player }).status, 400);
    assert.equal(core.prepareSend('general', { content: '   ', user: player }).status, 400);
    assert.equal(core.prepareSend('general', { content: 'join discord.gg/abc', user: player }).status, 400);

    core.bans.add('12345');
    assert.equal(core.prepareSend('general', { content: 'let me in', user: player }).status, 403);
});

test('a new name does not reset the per-connection budget', () => {
    const { core } = makeCore();
    core.prepareSend('general', { content: 'one', user: player }, '9.9.9.9').commit();
    const other = core.prepareSend('general', { content: 'two', user: { ...player, id: 999 } }, '9.9.9.9');
    assert.equal(other.status, 429);
});

test('invites are allowed by default, and webhook names avoid words Discord rejects', () => {
    const { core } = makeCore();
    assert.equal(core.prepareSend('general', { content: 'discord.gg/omnity', user: player }).ok, true);
    assert.equal(webhookName('DiscordFan', 'DiscordFan', 42), 'Player 42');
    assert.equal(webhookName('Sam', 'sam_123', 7), 'Sam (@sam_123)');
    assert.equal(cleanContent(42), '');
});

test('a message posted through the webhook keeps its player even if Discord reports it first', () => {
    const { core } = makeCore();
    core.ingest(CHANNEL, { id: '77', content: 'from game', author: { name: 'Rayfield Chat', discord: true } });
    core.claim(CHANNEL, '77', { name: 'Spec User', roblox: 12345 });
    const [message] = core.snapshot('general').body.messages;
    assert.deepEqual(message.author, { name: 'Spec User', roblox: 12345 });
});

test('Discord content becomes readable: mentions, attachments, stickers', () => {
    const members = new Map([['5', { displayName: 'Nova' }]]);
    const roles = new Map([['6', { name: 'Staff' }]]);
    const text = readableContent({
        content: 'hey <@5> and <@&6> <:omnity:99>',
        mentions: { members },
        guild: { roles: { cache: roles }, channels: { cache: new Map() } },
        attachments: new Map([['a', { contentType: 'image/png', name: 'x.png' }]]),
        stickers: { size: 1 },
    });
    assert.equal(text, 'hey @Nova and @Staff <:omnity:99> [image] [sticker]');
});

test('HTTP: the element’s GET and POST, the key, and errors', async () => {
    const { core } = makeCore();
    const sent = [];
    const handler = createHandler({
        core,
        key: 'k',
        send: async (checked) => {
            sent.push(checked);
            core.ingest(CHANNEL, { id: '500', content: checked.content, time: 1, author: checked.author });
            return core.snapshot('general').body.messages.at(-1);
        },
    });
    const server = createServer(handler);
    await new Promise((resolve) => server.listen(0, resolve));
    const base = `http://127.0.0.1:${server.address().port}`;
    const call = (path, options = {}) =>
        fetch(base + path, { ...options, headers: { 'x-chat-key': 'k', 'content-type': 'application/json', ...options.headers } }).then(
            async (res) => ({ status: res.status, body: await res.json() }),
        );

    try {
        assert.equal((await call('/health')).status, 200);
        assert.equal((await call('/v1/chat/general', { headers: { 'x-chat-key': 'wrong' } })).status, 401);

        const empty = await call('/v1/chat/general');
        assert.equal(empty.status, 200);
        assert.deepEqual(empty.body.messages, []);

        const posted = await call('/v1/chat/general', {
            method: 'POST',
            body: JSON.stringify({ content: 'hello relay', user: player }),
        });
        assert.equal(posted.status, 200);
        assert.equal(posted.body.ok, true);
        assert.equal(posted.body.message.content, 'hello relay');
        assert.equal(sent[0].username, 'Spec User (@SpecUser)');

        const tooFast = await call('/v1/chat/general', {
            method: 'POST',
            body: JSON.stringify({ content: 'again', user: player }),
        });
        assert.equal(tooFast.status, 429);
        assert.ok(tooFast.body.retryAfter >= 1);

        assert.equal((await call('/v1/chat/general', { method: 'POST', body: '{nope' })).status, 400);
        assert.equal((await call('/v1/chat/general', { method: 'POST', body: 'x'.repeat(5000) })).status, 413);
        assert.equal((await call('/v1/chat/missing')).status, 404);
        assert.equal((await call('/elsewhere')).status, 404);
    } finally {
        server.close();
    }
});

test('nameplates: players in the same server see each other, and drop off when they stop', () => {
    const { core, tick } = makeCore({ badges: { 12345: 'Developer' } });
    const me = { user: { id: 12345 }, jobId: 'job-a' };
    const friend = { user: { id: 777 }, jobId: 'job-a' };
    const elsewhere = { user: { id: 888 }, jobId: 'job-b' };

    assert.deepEqual(core.checkIn(me).body.users, [{ id: 12345, badge: 'Developer' }]);
    core.checkIn(elsewhere);
    const seen = core.checkIn(friend).body.users.map((u) => u.id).sort((a, b) => a - b);
    assert.deepEqual(seen, [777, 12345], "only this server");

    tick(61_000);
    core.checkIn(me);
    assert.deepEqual(core.checkIn(me).body.users.map((u) => u.id), [12345], 'the friend timed out');

    core.checkOut(me);
    assert.equal(core.checkIn(friend).body.users.length, 1);

    assert.equal(core.checkIn({ user: { id: 1 }, jobId: 'bad job id!' }).status, 400);
    assert.equal(core.checkIn({ user: {}, jobId: 'job-a' }).status, 400);
});

test('nameplates over HTTP', async () => {
    const { core } = makeCore();
    const server = createServer(createHandler({ core, send: async () => ({}) }));
    await new Promise((resolve) => server.listen(0, resolve));
    const base = `http://127.0.0.1:${server.address().port}`;
    try {
        const res = await fetch(`${base}/v1/presence`, {
            method: 'POST',
            body: JSON.stringify({ user: { id: 5, name: 'a' }, jobId: 'abc' }),
        });
        assert.equal(res.status, 200);
        assert.deepEqual((await res.json()).users, [{ id: 5 }]);
        assert.equal((await fetch(`${base}/v1/presence`)).status, 405);
        const left = await fetch(`${base}/v1/presence`, { method: 'DELETE', body: JSON.stringify({ user: { id: 5 }, jobId: 'abc' }) });
        assert.equal(left.status, 200);
    } finally {
        server.close();
    }
});
