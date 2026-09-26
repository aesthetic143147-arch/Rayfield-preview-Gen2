// Rayfield chat relay: `npm start`. Connects the Chat element to Discord channels.
//
// Players never see the bot token. They talk to this relay over HTTP; it posts their messages
// into Discord through a webhook (with their Roblox name and headshot) and hands everyone the
// recent messages, including replies written on Discord.
import { createServer } from 'node:http';
import { mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import dotenv from 'dotenv';
import { Client, Events, GatewayIntentBits, Partials, PermissionFlagsBits } from 'discord.js';
import { createCore, readableContent } from './core.js';
import { createHandler } from './http.js';

dotenv.config({ quiet: true });

const env = process.env;
if (!env.DISCORD_TOKEN || !env.CHANNELS) {
    console.error('Set DISCORD_TOKEN and CHANNELS in .env (copy .env.example).');
    process.exit(1);
}

const channels = Object.fromEntries(
    env.CHANNELS.split(',')
        .map((pair) => pair.trim().split(':'))
        .filter(([name, id]) => name && /^\d+$/.test(id ?? ''))
        .map(([name, id]) => [name.trim(), id.trim()]),
);
if (Object.keys(channels).length === 0) {
    console.error('CHANNELS must look like general:123456789012345678');
    process.exit(1);
}

const core = createCore({
    channels,
    maxLength: Number(env.MAX_LENGTH) || 300,
    allowInvites: env.ALLOW_INVITES !== 'false',
});

// Bans and who-sent-what survive restarts in data/.
const dataDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../data');
const load = (file, fallback) => {
    try {
        return JSON.parse(readFileSync(path.join(dataDir, file), 'utf8'));
    } catch {
        return fallback;
    }
};
const save = (file, value) => {
    mkdirSync(dataDir, { recursive: true });
    writeFileSync(path.join(dataDir, file), JSON.stringify(value));
};
for (const id of load('bans.json', [])) core.bans.add(String(id));
for (const [id, author] of Object.entries(load('authors.json', {}))) core.authors.set(id, author);
const saveAuthors = () => save('authors.json', Object.fromEntries([...core.authors].slice(-2000)));

const client = new Client({
    intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent],
    partials: [Partials.Message],
});

const webhooks = new Map(); // channel id -> webhook
async function webhookFor(channel) {
    if (webhooks.has(channel.id)) return webhooks.get(channel.id);
    const existing = (await channel.fetchWebhooks()).find((w) => w.owner?.id === client.user.id);
    const webhook = existing ?? (await channel.createWebhook({ name: 'Rayfield Chat', reason: 'Rayfield chat relay' }));
    webhooks.set(channel.id, webhook);
    return webhook;
}

const headshots = new Map(); // roblox id -> { url, at }
async function headshot(robloxId) {
    if (!robloxId) return undefined;
    const cached = headshots.get(robloxId);
    if (cached && Date.now() - cached.at < 3_600_000) return cached.url;
    try {
        const res = await fetch(
            `https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=${robloxId}&size=150x150&format=Png`,
        );
        const url = (await res.json())?.data?.[0]?.imageUrl;
        headshots.set(robloxId, { url, at: Date.now() });
        return url;
    } catch {
        return undefined;
    }
}

function toEntry(message) {
    if (message.author?.bot && !message.webhookId) return null;
    if (message.webhookId && message.webhookId !== webhooks.get(message.channelId)?.id) return null;
    const content = readableContent(message);
    if (!content) return null;
    return {
        id: message.id,
        content,
        time: Math.floor(message.createdTimestamp / 1000),
        author: { name: message.member?.displayName ?? message.author?.displayName ?? message.author?.username, discord: true },
    };
}

// Posting a checked message: through the webhook, as the player.
async function send(checked) {
    const channel = await client.channels.fetch(checked.room.id);
    const webhook = await webhookFor(channel);
    const posted = await webhook.send({
        content: checked.content,
        username: checked.username,
        avatarURL: await headshot(checked.roblox),
        allowedMentions: { parse: [] },
    });
    const added = core.ingest(channel.id, {
        id: posted.id,
        content: checked.content,
        time: Math.floor(Date.now() / 1000),
        author: checked.author,
    });
    if (!added) core.claim(channel.id, posted.id, checked.author);
    core.authors.set(posted.id, checked.author);
    saveAuthors();
    return core.roomFor(checked.room.name).messages.find((m) => m.id === posted.id);
}

client.once(Events.ClientReady, async () => {
    console.log(`Relay connected to Discord as ${client.user.tag}`);
    for (const [name, id] of Object.entries(channels)) {
        try {
            const channel = await client.channels.fetch(id);
            await webhookFor(channel);
            const recent = await channel.messages.fetch({ limit: 100 });
            for (const message of [...recent.values()].reverse()) {
                const entry = toEntry(message);
                if (entry) core.ingest(id, entry);
            }
            console.log(`  #${channel.name} as "${name}" (${core.roomFor(name).messages.length} recent messages)`);
        } catch (error) {
            console.error(`  couldn't open "${name}" (${id}): ${error.message}`);
        }
    }
});

client.on(Events.MessageCreate, async (message) => {
    if (!core.roomForChannel(message.channelId)) return;
    if (await staffCommand(message)) return;
    const entry = toEntry(message);
    if (entry) core.ingest(message.channelId, entry);
});
client.on(Events.MessageUpdate, (_, after) => {
    if (!core.roomForChannel(after.channelId) || after.partial) return;
    core.edit(after.channelId, after.id, readableContent(after));
});
client.on(Events.MessageDelete, (message) => core.remove(message.channelId, [message.id]));
client.on(Events.MessageBulkDelete, (messages, channel) => core.remove(channel.id, [...messages.keys()]));

// Moderators manage the chat from Discord: !chatban <robloxId>, !chatunban <robloxId>, !chatbans.
async function staffCommand(message) {
    const [command, target] = (message.content ?? '').trim().split(/\s+/);
    if (!['!chatban', '!chatunban', '!chatbans'].includes(command)) return false;
    if (!message.member?.permissionsIn(message.channel).has(PermissionFlagsBits.ManageMessages)) return true;
    if (command === '!chatbans') {
        await message.reply(core.bans.size ? `Banned Roblox IDs: ${[...core.bans].join(', ')}` : 'Nobody is banned.');
        return true;
    }
    if (!/^\d+$/.test(target ?? '')) {
        await message.reply(`Usage: ${command} <Roblox user ID>`);
        return true;
    }
    if (command === '!chatban') core.bans.add(target);
    else core.bans.delete(target);
    save('bans.json', [...core.bans]);
    await message.reply(`${command === '!chatban' ? 'Banned' : 'Unbanned'} Roblox user ${target} from the chat.`);
    return true;
}

const port = Number(env.PORT) || 8787;
createServer(createHandler({ core, send, key: env.CHAT_KEY || undefined })).listen(port, () => {
    console.log(`Relay listening on http://localhost:${port}`);
});
client.login(env.DISCORD_TOKEN);
