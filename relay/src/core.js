// The relay's logic, with no Discord or network in it, so it can be tested on its own.
//
// It keeps a window of recent messages per channel and a version number that moves on every
// change. Players poll with the version they last saw; if nothing moved they get a one-line
// "unchanged", otherwise the whole window. Returning the whole window (not a diff) is what lets
// edits and deletions made on Discord reach every player without extra protocol.

const WINDOW = 100; // messages kept per channel
const INVITE = /(discord\.gg|discord(app)?\.com\/invite)\/[\w-]+/i;
const ZERO_WIDTH = /[​-‍⁠﻿]/g;

export function createCore({
    channels, // { name: channelId }
    maxLength = 300,
    allowInvites = true,
    sendInterval = 1500, // ms between one player's messages
    perMinute = 12, // messages per player per minute
    pollPerMinute = 120, // polls per IP per minute
    now = () => Date.now(),
} = {}) {
    const rooms = new Map(); // channel name -> { id, version, messages }
    const byChannelId = new Map();
    for (const [name, id] of Object.entries(channels)) {
        const room = { name, id, version: 1, messages: [] };
        rooms.set(name, room);
        byChannelId.set(id, room);
    }

    const bans = new Set();
    const senders = new Map(); // key -> { last, recent: [times], lastContent, lastContentAt }
    const pollers = new Map(); // ip -> [times]
    const authors = new Map(); // message id -> { name, roblox } for messages sent through the relay

    const touch = (room) => {
        room.version += 1;
    };

    function trimWindow(room) {
        if (room.messages.length > WINDOW) room.messages.splice(0, room.messages.length - WINDOW);
    }

    return {
        rooms,
        bans,
        authors,
        roomFor: (name) => rooms.get(name),
        roomForChannel: (id) => byChannelId.get(id),
        defaultRoom: () => rooms.values().next().value,

        // A message seen on Discord (or just sent through the webhook).
        ingest(channelId, message) {
            const room = byChannelId.get(channelId);
            if (!room || !message?.id) return false;
            const existing = room.messages.find((m) => m.id === message.id);
            if (existing) return false;
            const known = authors.get(message.id);
            const entry = {
                id: message.id,
                content: message.content,
                time: message.time,
                author: known ? { name: known.name, roblox: known.roblox } : message.author,
            };
            room.messages.push(entry);
            room.messages.sort((a, b) => (BigInt(a.id) < BigInt(b.id) ? -1 : 1));
            trimWindow(room);
            touch(room);
            return true;
        },

        // Mark a message as sent by a player. Discord can deliver the webhook's message before
        // the send call returns, in which case it was filed as a Discord author; this fixes it.
        claim(channelId, id, author) {
            authors.set(id, author);
            const room = byChannelId.get(channelId);
            const message = room?.messages.find((m) => m.id === id);
            if (!message) return false;
            message.author = { name: author.name, roblox: author.roblox };
            touch(room);
            return true;
        },

        edit(channelId, id, content) {
            const room = byChannelId.get(channelId);
            const message = room?.messages.find((m) => m.id === id);
            if (!message || message.content === content) return false;
            message.content = content;
            touch(room);
            return true;
        },

        remove(channelId, ids) {
            const room = byChannelId.get(channelId);
            if (!room) return false;
            const gone = new Set(ids);
            const before = room.messages.length;
            room.messages = room.messages.filter((m) => !gone.has(m.id));
            if (room.messages.length === before) return false;
            touch(room);
            return true;
        },

        // What a poll gets back.
        snapshot(name, since, ip) {
            const room = rooms.get(name);
            if (!room) return { status: 404, body: { error: 'No such chat channel.' } };
            if (ip && !allow(pollers, ip, pollPerMinute)) {
                return { status: 429, body: { error: 'Too many requests.', retryAfter: 10 } };
            }
            if (since !== undefined && Number(since) === room.version) {
                return { status: 200, body: { version: room.version, unchanged: true } };
            }
            return { status: 200, body: { version: room.version, messages: room.messages } };
        },

        // Checks a player's message. Returns { error, status, retryAfter } or the cleaned message
        // and how it should look on Discord.
        prepareSend(name, body, ip) {
            const room = rooms.get(name);
            if (!room) return { status: 404, error: 'No such chat channel.' };
            if (!body || typeof body !== 'object') return { status: 400, error: 'Bad request.' };

            const user = body.user ?? {};
            const roblox = Number.isSafeInteger(user.id) && user.id > 0 ? user.id : null;
            const name_ = cleanName(user.name) || 'Player';
            const display = cleanName(user.displayName) || name_;
            if (roblox && bans.has(String(roblox))) return { status: 403, error: 'You can’t send messages here.' };

            const content = cleanContent(body.content);
            if (!content) return { status: 400, error: 'Message is empty.' };
            if ([...content].length > maxLength) {
                return { status: 400, error: `Messages can be up to ${maxLength} characters.` };
            }
            if (!allowInvites && INVITE.test(content)) {
                return { status: 400, error: 'Invite links aren’t allowed in this chat.' };
            }

            // one budget per player and one per connection, so a new name doesn't reset it
            for (const key of [roblox ? `u:${roblox}` : null, ip ? `ip:${ip}` : null].filter(Boolean)) {
                const state = senders.get(key) ?? { last: -Infinity, recent: [] };
                const t = now();
                if (t - state.last < sendInterval) {
                    return { status: 429, error: 'Slow down a little.', retryAfter: Math.ceil((sendInterval - (t - state.last)) / 1000) };
                }
                state.recent = state.recent.filter((at) => t - at < 60_000);
                if (state.recent.length >= perMinute) {
                    return { status: 429, error: 'You’re sending too fast. Wait a minute.', retryAfter: 30 };
                }
                if (state.lastContent === content && t - state.lastContentAt < 30_000) {
                    return { status: 429, error: 'You just said that.', retryAfter: 5 };
                }
            }
            return {
                ok: true,
                room,
                roblox,
                content,
                author: { name: display, roblox },
                // Discord refuses webhook names containing "discord" or "clyde"
                username: webhookName(display, name_, roblox),
                commit() {
                    const t = now();
                    for (const key of [roblox ? `u:${roblox}` : null, ip ? `ip:${ip}` : null].filter(Boolean)) {
                        const state = senders.get(key) ?? { last: -Infinity, recent: [] };
                        state.last = t;
                        state.recent.push(t);
                        state.lastContent = content;
                        state.lastContentAt = t;
                        senders.set(key, state);
                    }
                },
            };
        },
    };

    function allow(map, key, limit) {
        const t = now();
        const recent = (map.get(key) ?? []).filter((at) => t - at < 60_000);
        if (recent.length >= limit) {
            map.set(key, recent);
            return false;
        }
        recent.push(t);
        map.set(key, recent);
        return true;
    }
}

export function cleanName(value) {
    if (typeof value !== 'string') return '';
    return value.replace(ZERO_WIDTH, '').replace(/[@#:`*_~|>\\]/g, '').trim().slice(0, 32);
}

// Trim, drop invisible characters, keep at most two blank lines in a row, and defuse mass
// pings (the webhook also sends with mentions switched off).
export function cleanContent(value) {
    if (typeof value !== 'string') return '';
    return value
        .replace(ZERO_WIDTH, '')
        .replace(/\r\n?/g, '\n')
        .replace(/\n{3,}/g, '\n\n')
        .replace(/@(everyone|here)/gi, '@​$1')
        .trim();
}

export function webhookName(display, name, roblox) {
    const full = display === name ? display : `${display} (@${name})`;
    const safe = (text) => text && !/discord|clyde/i.test(text) && text.length >= 1;
    if (safe(full) && full.length <= 80) return full;
    if (safe(display)) return display.slice(0, 80);
    return roblox ? `Player ${roblox}` : 'Player';
}

// Turns a Discord message's content into what players see: mentions become names, attachments
// and stickers become short markers. Custom emoji stay as <:name:id>; the element shows :name:.
export function readableContent(message) {
    let content = message.content ?? '';
    content = content.replace(/<@!?(\d+)>/g, (_, id) => {
        const member = message.mentions?.members?.get?.(id) ?? message.mentions?.users?.get?.(id);
        return `@${member?.displayName ?? member?.username ?? 'someone'}`;
    });
    content = content.replace(/<@&(\d+)>/g, (_, id) => `@${message.guild?.roles?.cache?.get?.(id)?.name ?? 'role'}`);
    content = content.replace(/<#(\d+)>/g, (_, id) => `#${message.guild?.channels?.cache?.get?.(id)?.name ?? 'channel'}`);
    const extras = [];
    for (const attachment of message.attachments?.values?.() ?? []) {
        extras.push(attachment.contentType?.startsWith('image/') ? '[image]' : `[file: ${attachment.name}]`);
    }
    if (message.stickers?.size) extras.push('[sticker]');
    return [content.trim(), ...extras].filter(Boolean).join(' ');
}
