# Chat relay

Connects the `CreateChat` element of Rayfield Columns to channels in your Discord server.

```
players' scripts  ⇄  this relay (holds your bot token)  ⇄  your Discord channel
```

- **Players to Discord:** a player's message is posted into the channel through a webhook, with
  their Roblox display name and headshot.
- **Discord to players:** anything written in the channel shows up in every player's chat,
  including replies, emoji and invites.
- **Moderation:** deleting or editing a message on Discord removes or updates it for everyone.
- **Protection:** each player can send one message every 1.5s and 12 a minute. It also blocks
  repeated messages, can't ping `@everyone`/`@here` or roles, strips invisible characters, and
  limits message length (300 characters by default).
- **Bans:** in the channel, anyone with Manage Messages can type `!chatban <robloxId>`,
  `!chatunban <robloxId>` or `!chatbans`. Bans are saved in `data/bans.json`.

## Setup

1. **A bot.** Use your existing bot or make one in the
   [Developer Portal](https://discord.com/developers/applications).
   - On the **Bot** page, turn on **Message Content Intent**.
   - Invite it to your server with the **Manage Webhooks**, **View Channels**, **Send Messages**
     and **Read Message History** permissions (Administrator also works).
2. **A channel.** Make a channel for the chat, for example `#hub-chat`. With Developer Mode on,
   right-click it and choose **Copy Channel ID**.
3. **Configure:**
   ```bash
   cd relay
   npm install
   cp .env.example .env
   ```
   Put the bot token in `DISCORD_TOKEN` and your channels in `CHANNELS` as `name:channelId`
   pairs:
   ```
   CHANNELS=general:123456789012345678,trading:234567890123456789
   ```
4. **Run:** `npm start`. You should see `Relay connected to Discord` and `Relay listening on
   http://localhost:8787`.

## Making it reachable

Players' executors need to reach the relay over the internet, so `localhost` isn't enough.

- **Quick test (free):** a [Cloudflare quick tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/do-more-with-tunnels/trycloudflare/).
  ```bash
  brew install cloudflared          # macOS
  cloudflared tunnel --url http://localhost:8787
  ```
  It prints an address like `https://something.trycloudflare.com`. Use that as `endpoint`. The
  address changes every time you restart it, so it's only good for testing.
- **For real:** run the relay on something that's always on, with a fixed address. For example: a
  small VPS, a Raspberry Pi behind a named Cloudflare Tunnel on your own domain, or a Node host
  like Railway or Render. Keep `data/` on persistent storage if you want bans to survive redeploys.

Then in your script:

```lua
Tab.Right:CreateChat({ name = "Community", endpoint = "https://your-relay-address", channel = "general" })
```

## Settings (`.env`)

| Variable | Default | |
| --- | --- | --- |
| `DISCORD_TOKEN` | none | Bot token. Never put it in a script |
| `CHANNELS` | none | `name:channelId` pairs, comma separated |
| `PORT` | `8787` | Port to listen on |
| `CHAT_KEY` | none | If set, scripts must send it (`key = "…"` in `CreateChat`). Keeps casual traffic off; not a secret |
| `ALLOW_INVITES` | `true` | `false` rejects Discord invite links from players |
| `MAX_LENGTH` | `300` | Longest message a player can send |

If your server uses AutoMod to block invite links, exempt the chat channel from that rule, or
invites written on Discord will be blocked there. Messages from players come through a webhook,
which AutoMod doesn't check.

## Protocol

For writing your own backend (then point `endpoint` at it, or pass a `transport` function):

```
GET  /v1/chat/{channel}?since={version}
  200 { "version": 12, "messages": [ { "id", "content", "time", "author": { "name", "roblox"?, "discord"? } } ] }
  200 { "version": 12, "unchanged": true }      nothing changed since {version}

POST /v1/chat/{channel}     { "content": "...", "user": { "id", "name", "displayName" } }
  200 { "ok": true, "message": { ... } }
  4xx { "error": "shown to the player", "retryAfter"?: seconds }
```

The GET returns the whole recent window rather than only new messages, which is how edits and
deletions reach players.

## Development

```bash
npm test   # the message store, checks and rate limits, and the HTTP routes end to end
```
