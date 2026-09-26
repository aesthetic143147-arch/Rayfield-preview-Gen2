--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A live chat room backed by a Discord channel. Players read and write the channel from inside
-- the script; people in the Discord server see the same conversation and can answer from there.
--
-- The element never talks to Discord directly. A bot token in a script anyone can read would
-- hand the whole server to the first person who opens it, and a webhook URL would let anyone
-- spam or delete it. Instead it talks to a small relay the developer runs (relay/ in this
-- repo), which holds the token, rate-limits, filters and posts through a webhook. The wire
-- format is plain JSON over HTTP, so any backend that speaks it works:
--
--   GET  {endpoint}/v1/chat/{channel}?since={version}
--        -> { version, messages = { {id, content, time, author = {name, roblox?, discord?}} } }
--        -> { version, unchanged = true }      when nothing moved since `since`
--   POST {endpoint}/v1/chat/{channel}   body { content, user = {id, name, displayName} }
--        -> { ok = true, message = {...} }  or  { error = "...", retryAfter? }
--
-- The server returns the whole recent window rather than a diff, so edits and deletions made on
-- Discord (moderation) show up here without any extra protocol.

local Chat = {}
Chat.__index = Chat
Chat.__type = "Chat"

-- Utility
local utility = script.Parent.Parent.utility

-- Variables
local variables = require(utility.variables)
local moveable = require(utility.moveable)
local locale = require(utility.locale)
local network = require(utility.network)
local hapticEngine = require(utility.HapticEngine)

local defaultHeight = 260
local minHeight = 140
local padding = 14
local headerHeight = 18
local gap = 10
local inputHeight = 34
local avatarSize = 28
local rowGap = 10
local panelPadding = 10

local defaultPoll = 3
local minPoll = 1.5
local idlePoll = 12 -- window hidden or the chat's tab not open: check in rarely
local maxBackoff = 60
local sendCooldown = 1.5
local maxLength = 300
local defaultMaxMessages = 60

local emojiColumns = 8
local emojiCell = 30

-- A picker's worth of the emoji people actually use in chat. Discord renders them natively, and
-- Roblox draws them in any TextLabel, so they need no images.
local defaultEmojis = {
    "😀",
    "😂",
    "🤣",
    "😊",
    "😍",
    "😎",
    "🤔",
    "😅",
    "😭",
    "😡",
    "🥲",
    "😴",
    "👍",
    "👎",
    "👏",
    "🙏",
    "🤝",
    "💪",
    "🔥",
    "💯",
    "❤️",
    "💀",
    "✨",
    "🎉",
    "👀",
    "🎮",
    "🚀",
    "✅",
    "❌",
    "⭐",
    "💎",
    "👋",
}

local invitePatterns = {
    "discord%.gg/[%w%-]+",
    "discord%.com/invite/[%w%-]+",
    "discordapp%.com/invite/[%w%-]+",
}

local statusText = {
    connecting = "Connecting…",
    live = "● Live",
    offline = "● Offline",
    unconfigured = "Not connected",
}

-- Custom Discord emoji arrive as <:name:id>; a picture needs an asset Roblox can't fetch, so
-- they read as :name: the way Discord shows them to anyone without access.
local function tidy(content: string): string
    content = content:gsub("<a?(:[%w_]+:)%d+>", "%1")
    return content
end

local function findInvite(content: string): string?
    for _, pattern in invitePatterns do
        local found = content:match(pattern)
        if found then
            return "https://" .. found
        end
    end
    return nil
end

local function clock(time: number?): string
    if type(time) ~= "number" then
        return ""
    end
    -- Roblox's os.date only takes "*t", so the clock is formatted by hand (player's local time)
    local parts = os.date("*t", math.floor(time))
    if type(parts) ~= "table" then
        return ""
    end
    return string.format("%02d:%02d", parts.hour, parts.min)
end

function Chat.new(tab, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        name = properties.name or properties.Name or "Chat",
        description = properties.description or properties.Description,

        endpoint = properties.endpoint or properties.Endpoint,
        channel = properties.channel or properties.Channel or "general",
        key = properties.key or properties.Key,
        transport = properties.transport or properties.Transport,

        height = math.max(tonumber(properties.height or properties.Height) or defaultHeight, minHeight),
        pollInterval = math.max(tonumber(properties.pollInterval or properties.PollInterval) or defaultPoll, minPoll),
        autoPoll = properties.poll ~= false and properties.Poll ~= false,
        maxMessages = math.max(tonumber(properties.maxMessages or properties.MaxMessages) or defaultMaxMessages, 1),
        placeholder = properties.placeholder or properties.Placeholder or "Message…",
        emojis = properties.emojis or properties.Emojis or defaultEmojis,
        onMessage = properties.onMessage or properties.OnMessage,

        messages = {},
        rows = {}, -- message id -> row
        version = nil,
        failures = 0,
        lastSent = -math.huge,
        status = "connecting",
        _textTransparency = 1,
        _alive = true,
    }, Chat)

    if type(self.endpoint) == "string" then
        self.endpoint = self.endpoint:gsub("/+$", "")
    end
    if not self.endpoint and not self.transport then
        self.status = "unconfigured"
    end

    self:_build()
    self:_setStatus(self.status)

    if self.description then
        self.descriptor = require(script.Parent.descriptor).new(self.tab, { description = self.description })
    end

    if self.autoPoll and self.status ~= "unconfigured" then
        self:_startPolling()
    end

    return self
end

-- Transport --------------------------------------------------------------------------------------

-- One HTTP round trip. Returns ok, decoded body. A custom transport (for a backend that isn't a
-- plain HTTP relay, or for tests) takes (method, path, body) and returns the same pair.
function Chat:_request(method: string, path: string, body: any?)
    if self.transport then
        local ok, result, data = pcall(self.transport, method, path, body)
        if not ok then
            return false, { error = tostring(result) }
        end
        return result, data
    end

    local requestFn = network.getRequestFn()
    if not requestFn then
        return false, { error = "This executor can't make web requests." }
    end

    local headers = { ["Content-Type"] = "application/json" }
    if self.key then
        headers["X-Chat-Key"] = tostring(self.key)
    end
    local ok, response = pcall(requestFn, {
        Url = self.endpoint .. path,
        Method = method,
        Headers = headers,
        Body = if body ~= nil then variables.httpService:JSONEncode(body) else nil,
    })
    if not ok or type(response) ~= "table" then
        return false, { error = "No response from the chat server." }
    end

    local decoded = nil
    if type(response.Body) == "string" and response.Body ~= "" then
        local parsed, value = pcall(variables.httpService.JSONDecode, variables.httpService, response.Body)
        decoded = if parsed then value else nil
    end
    local code = tonumber(response.StatusCode) or 0
    return code >= 200 and code < 300, decoded or {}
end

local function channelPath(self)
    local encoded = tostring(self.channel):gsub("[^%w%-_%.~]", function(char)
        return string.format("%%%02X", string.byte(char))
    end)
    return "/v1/chat/" .. encoded
end

-- Fetch the recent window. Public so a script (or a test) can refresh on its own schedule.
function Chat:Refresh(): boolean
    if not self._alive or self.status == "unconfigured" then
        return false
    end
    local path = channelPath(self)
    if self.version ~= nil then
        path ..= "?since=" .. tostring(self.version)
    end

    local ok, data = self:_request("GET", path)
    if not ok or type(data) ~= "table" then
        self.failures += 1
        self:_setStatus("offline")
        return false
    end

    self.failures = 0
    self:_setStatus("live")
    if data.unchanged then
        return true
    end
    self.version = data.version
    if type(data.messages) == "table" then
        self:_apply(data.messages)
    end
    return true
end

-- Send a message as the local player. Returns ok and, on failure, why.
function Chat:Send(text): (boolean, string?)
    if not self._alive then
        return false, "removed"
    end
    text = if type(text) == "string" then text else tostring(text or "")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    if text == "" then
        return false, "empty"
    end
    if utf8.len(text) and utf8.len(text) > maxLength then
        return false, locale.resolve("Messages can be up to " .. maxLength .. " characters.")
    end
    local now = os.clock()
    if now - self.lastSent < sendCooldown then
        return false, locale.resolve("Slow down a little.")
    end
    self.lastSent = now

    local player = variables.localPlayer
    local user = {
        id = if player then player.UserId else 0,
        name = if player then player.Name else "Player",
        displayName = if player then player.DisplayName else "Player",
    }
    local ok, data = self:_request("POST", channelPath(self), { content = text, user = user })
    if not ok then
        local reason = if type(data) == "table" and type(data.error) == "string"
            then data.error
            else "Couldn't send that message."
        return false, reason
    end

    -- show it straight away rather than waiting for the next poll to bring it back
    if type(data) == "table" and type(data.message) == "table" then
        local merged = table.clone(self.messages)
        table.insert(merged, data.message)
        self:_apply(merged)
    end
    return true
end

function Chat:_startPolling()
    task.spawn(function()
        while self._alive and not self.window.unloaded do
            self:Refresh()
            local delay = self.pollInterval
            if self.window.hidden or not self:_onScreen() then
                delay = math.max(delay, idlePoll)
            end
            if self.failures > 0 then
                delay = math.min(delay * 2 ^ math.min(self.failures, 5), maxBackoff)
            end
            task.wait(delay)
        end
    end)
end

-- whether the tab this chat lives on is the one showing
function Chat:_onScreen(): boolean
    local host = self.tab
    local tab = host.tab or host -- a column's owner is the tab
    return self.window.selectedTab == nil or self.window.selectedTab == tab
end

-- Rendering --------------------------------------------------------------------------------------

function Chat:_build()
    local w = self.window
    local total = padding + headerHeight + gap + self.height + gap + inputHeight + padding

    self.main = w:Create("Frame", {
        Size = UDim2.new(1, -20, 0, total),
        BorderSizePixel = 0,
        Name = self.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1, -- In = ElementTransparency

        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })

    self.stroke = w:StyleElementBody(self.main)

    self.title = w:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.new(0.6, 0, 0, headerHeight),
        Position = UDim2.fromOffset(padding + 2, padding),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = 1, -- In = 0

        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    self.statusLabel = w:Create("TextLabel", {
        Text = "",
        AnchorPoint = Vector2.new(1, 0),
        Size = UDim2.new(0.4, 0, 0, headerHeight),
        Position = UDim2.new(1, -padding - 2, 0, padding),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextTransparency = 1, -- In = 0.4

        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    -- the inset panel messages scroll inside, same surface as the console's
    local panelTop = padding + headerHeight + gap
    self.panel = w:Create("Frame", {
        Position = UDim2.fromOffset(padding, panelTop),
        Size = UDim2.new(1, -padding * 2, 0, self.height),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundTransparency = 1, -- In = 0

        Parent = self.main,
    }, { BackgroundColor3 = "StatBackground" })
    w:Create("UICorner", { Parent = self.panel }, { CornerRadius = "ElementCornerRadius" })
    self.panelStroke = w:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Transparency = 1, -- In = 0.9
        Parent = self.panel,
    }, { Color = "SurfaceStroke" })

    self.scroll = w:Create("ScrollingFrame", {
        Size = UDim2.new(1, -panelPadding * 2, 1, -panelPadding * 2),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 2,
        ScrollBarImageTransparency = 0.6,
        ScrollingDirection = Enum.ScrollingDirection.Y,

        Parent = self.panel,
    }, { ScrollBarImageColor3 = "ContentColor" })

    self.scrollLayout = w:Create("UIListLayout", {
        Padding = UDim.new(0, rowGap),
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.scroll,
    })

    -- shown while there's nothing to read yet
    self.emptyLabel = w:Create("TextLabel", {
        Text = locale.t("No messages yet. Say hi!"),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        TextSize = 13,
        TextTransparency = 1, -- In = 0.6

        Parent = self.panel,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    -- stay pinned to the newest message unless the player has scrolled up to read back
    self.window:ConnectFor(self, self.scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        if self._pinned ~= false then
            self:_pin()
        end
    end)
    self.window:ConnectFor(self, self.scroll:GetPropertyChangedSignal("CanvasPosition"), function()
        local bottom = self.scroll.AbsoluteCanvasSize.Y - self.scroll.AbsoluteWindowSize.Y
        self._pinned = self.scroll.CanvasPosition.Y >= bottom - 24
    end)

    self:_buildInput(panelTop + self.height + gap)
    self:_buildEmojiPicker()
end

function Chat:_buildInput(top)
    local w = self.window
    local sendWidth = 64

    self.box = w:Create("Frame", {
        Position = UDim2.fromOffset(padding, top),
        Size = UDim2.new(1, -(padding * 2 + inputHeight + sendWidth + 16), 0, inputHeight),
        BorderSizePixel = 0,
        BackgroundTransparency = 1, -- In = FieldTransparency

        Parent = self.main,
    }, { BackgroundColor3 = "FieldBackground" })
    w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.box })
    self.boxStroke = w:Create("UIStroke", {
        Transparency = 1, -- In = 0.85
        Parent = self.box,
    }, { Color = "SurfaceStroke" })

    self.input = w:Create("TextBox", {
        Text = "",
        PlaceholderText = locale.t(self.placeholder),
        Size = UDim2.new(1, -28, 1, 0),
        Position = UDim2.fromOffset(14, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ClearTextOnFocus = false,
        TextTransparency = 1, -- In = 0

        Parent = self.box,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })

    -- a typed message can't run past the limit the relay enforces anyway
    self.window:ConnectFor(self, self.input:GetPropertyChangedSignal("Text"), function()
        local text = self.input.Text
        local length = utf8.len(text)
        local cut = if length and length > maxLength then utf8.offset(text, maxLength + 1) else nil
        if cut then
            self.input.Text = text:sub(1, cut - 1)
        end
    end)
    self.window:ConnectFor(self, self.input.FocusLost, function(enterPressed)
        if enterPressed then
            self:_submit()
        end
    end)

    self.emojiButton = w:Create("TextButton", {
        Text = "😊",
        Size = UDim2.fromOffset(inputHeight, inputHeight),
        Position = UDim2.new(1, -(padding + sendWidth + 8 + inputHeight), 0, top),
        BorderSizePixel = 0,
        TextSize = 16,
        AutoButtonColor = false,
        BackgroundTransparency = 1, -- In = FieldTransparency
        TextTransparency = 1, -- In = 0

        Parent = self.main,
    }, { BackgroundColor3 = "FieldBackground" })
    w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.emojiButton })
    self.window:ConnectFor(self, self.emojiButton.MouseButton1Click, function()
        hapticEngine.click()
        self:_toggleEmojiPicker()
    end)

    self.sendButton = w:Create("TextButton", {
        Text = locale.t("Send"),
        Size = UDim2.fromOffset(sendWidth, inputHeight),
        Position = UDim2.new(1, -(padding + sendWidth), 0, top),
        BorderSizePixel = 0,
        TextSize = 14,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AutoButtonColor = false,
        BackgroundTransparency = 1, -- In = 0
        TextTransparency = 1, -- In = 0

        Parent = self.main,
    }, { BackgroundColor3 = "AccentColor", FontFace = "Font" })
    w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.sendButton })
    self.window:ConnectFor(self, self.sendButton.MouseButton1Click, function()
        hapticEngine.click()
        self:_submit()
    end)
end

function Chat:_buildEmojiPicker()
    local w = self.window
    local rows = math.ceil(#self.emojis / emojiColumns)

    self.picker = w:Create("Frame", {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -6, 1, -6),
        Size = UDim2.fromOffset(emojiColumns * emojiCell + 12, rows * emojiCell + 12),
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 20,

        Parent = self.panel,
    }, { BackgroundColor3 = "WindowColor" })
    w:Create("UICorner", { Parent = self.picker }, { CornerRadius = "ElementCornerRadius" })
    w:Create("UIStroke", { Transparency = 0.85, Parent = self.picker }, { Color = "SurfaceStroke" })
    w:Create("UIPadding", {
        PaddingTop = UDim.new(0, 6),
        PaddingBottom = UDim.new(0, 6),
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 6),
        Parent = self.picker,
    })
    w:Create("UIGridLayout", {
        CellSize = UDim2.fromOffset(emojiCell, emojiCell),
        CellPadding = UDim2.fromOffset(0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.picker,
    })

    for index, emoji in self.emojis do
        local button = w:Create("TextButton", {
            Text = emoji,
            TextSize = 18,
            LayoutOrder = index,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            ZIndex = 21,

            Parent = self.picker,
        })
        self.window:ConnectFor(self, button.MouseButton1Click, function()
            hapticEngine.click()
            self:_insert(emoji)
        end)
    end
end

function Chat:_toggleEmojiPicker(open)
    if open == nil then
        open = not self.picker.Visible
    end
    self.picker.Visible = open
end

-- Add text at the end of what's being typed (emoji from the picker land here).
function Chat:_insert(text)
    local current = self.input.Text
    self.input.Text = current .. (if current ~= "" and not current:match("%s$") then " " else "") .. text
end

function Chat:_submit()
    local text = self.input.Text
    if text:match("^%s*$") then
        return
    end
    self:_toggleEmojiPicker(false)
    task.spawn(function()
        local ok, reason = self:Send(text)
        if ok then
            if self.input.Text == text then
                self.input.Text = ""
            end
        elseif reason ~= "empty" and reason ~= "removed" then
            self.window:Toast({ title = locale.resolve("Message not sent"), subtitle = reason })
        end
    end)
end

function Chat:_setStatus(status)
    self.status = status
    if self.statusLabel then
        self.statusLabel.Text = locale.resolve(statusText[status] or status)
    end
end

function Chat:_pin()
    local scroll = self.scroll
    if not scroll or not scroll.Parent then
        return
    end
    scroll.CanvasPosition = Vector2.new(0, scroll.AbsoluteCanvasSize.Y)
end

-- Make the rows match a fresh window of messages: add new ones, update edited ones, drop the
-- ones that are gone (deleted on Discord). Keeps only the newest maxMessages.
function Chat:_apply(list)
    local keep = {}
    local start = math.max(1, #list - self.maxMessages + 1)
    local fresh = {}
    for index = start, #list do
        local message = list[index]
        if type(message) == "table" and message.id ~= nil then
            local id = tostring(message.id)
            if not keep[id] then
                keep[id] = true
                table.insert(fresh, message)
            end
        end
    end

    for id, row in self.rows do
        if not keep[id] then
            row.frame:Destroy()
            self.rows[id] = nil
        end
    end

    for order, message in fresh do
        local id = tostring(message.id)
        local row = self.rows[id]
        local content = tidy(tostring(message.content or ""))
        if not row then
            row = self:_makeRow(message, content)
            self.rows[id] = row
            if self.version ~= nil and self._primed and self.onMessage then
                self.window:_runGuarded(self, self.onMessage, message)
            end
        elseif row.content ~= content then
            row.contentLabel.Text = content
            row.content = content
        end
        row.frame.LayoutOrder = order
    end

    self.messages = fresh
    self._primed = true -- the first window is history, not news: onMessage fires from here on
    self.emptyLabel.Visible = #fresh == 0
end

function Chat:_makeRow(message, content)
    local w = self.window
    local author = if type(message.author) == "table" then message.author else {}
    local name = tostring(author.name or "Unknown")
    local fromDiscord = author.discord == true
    local shown = self._textTransparency

    local frame = w:Create("Frame", {
        Size = UDim2.new(1, -4, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = self.scroll,
    })

    -- avatar: the player's headshot, or a lettered disc for someone writing from Discord
    local avatar = w:Create("ImageLabel", {
        Size = UDim2.fromOffset(avatarSize, avatarSize),
        BackgroundTransparency = if shown < 1 then 0.2 else 1,
        BorderSizePixel = 0,
        ImageTransparency = shown,
        Image = if tonumber(author.roblox)
            then `rbxthumb://type=AvatarHeadShot&id={tonumber(author.roblox)}&w=48&h=48`
            else "",

        Parent = frame,
    }, { BackgroundColor3 = if fromDiscord then "AccentColor" else "FieldBackground" })
    w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = avatar })
    local initial = nil
    if not tonumber(author.roblox) then
        initial = w:Create("TextLabel", {
            Text = string.upper(name:sub(1, 1)),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            TextSize = 13,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = shown,

            Parent = avatar,
        }, { FontFace = "Font" })
    end

    local body = w:Create("Frame", {
        Position = UDim2.fromOffset(avatarSize + 10, 0),
        Size = UDim2.new(1, -(avatarSize + 10), 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = frame,
    })
    w:Create("UIListLayout", {
        Padding = UDim.new(0, 3),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = body,
    })

    local meta = clock(message.time)
    local nameLabel = w:Create("TextLabel", {
        Text = name .. (if fromDiscord then "  ·  Discord" else "") .. (if meta ~= "" then "  ·  " .. meta else ""),
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        RichText = false,
        LayoutOrder = 1,
        TextTransparency = if shown < 1 then 0.45 else 1,

        Parent = body,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    local contentLabel = w:Create("TextLabel", {
        Text = content,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        RichText = false, -- other people's text: angle brackets are text, not markup
        LayoutOrder = 2,
        TextTransparency = shown,

        Parent = body,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    local row = {
        frame = frame,
        avatar = avatar,
        initial = initial,
        nameLabel = nameLabel,
        contentLabel = contentLabel,
        content = content,
    }

    -- a shared server invite gets a button that puts it on the clipboard
    local invite = findInvite(content)
    if invite then
        local button = w:Create("TextButton", {
            Text = locale.t("Copy invite"),
            Size = UDim2.fromOffset(92, 24),
            BorderSizePixel = 0,
            TextSize = 12,
            AutoButtonColor = false,
            LayoutOrder = 3,
            BackgroundTransparency = if shown < 1 then 0 else 1,
            TextTransparency = shown,

            Parent = body,
        }, { BackgroundColor3 = "NeutralButton", TextColor3 = "ContentColor", FontFace = "Font" })
        w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = button })
        self.window:ConnectFor(self, button.MouseButton1Click, function()
            hapticEngine.click()
            self:_copy(invite)
        end)
        row.inviteButton = button
        row.invite = invite
    end

    return row
end

function Chat:_copy(text)
    local clipboard = (getgenv and getgenv().setclipboard) or setclipboard
    local ok = typeof(clipboard) == "function" and (pcall(clipboard, text))
    self.window:Toast({
        title = locale.resolve(if ok then "Invite copied" else "Couldn't copy"),
        subtitle = text,
    })
    return ok
end

-- Reveal ----------------------------------------------------------------------------------------

function Chat:_setShown(shown, animate)
    local w = self.window
    local theme = w.theme
    w:_reveal(self.main, { BackgroundTransparency = if shown then theme.ElementTransparency or 0 else 1 }, animate)
    w:_reveal(self.stroke, { Transparency = if shown then theme.ElementStrokeTransparency else 1 }, animate)
    w:_reveal(self.title, { TextTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.statusLabel, { TextTransparency = if shown then 0.4 else 1 }, animate)
    w:_reveal(self.panel, { BackgroundTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.panelStroke, { Transparency = if shown then 0.9 else 1 }, animate)
    w:_reveal(self.emptyLabel, { TextTransparency = if shown then 0.6 else 1 }, animate)
    w:_reveal(self.box, { BackgroundTransparency = if shown then theme.FieldTransparency else 1 }, animate)
    w:_reveal(self.boxStroke, { Transparency = if shown then 0.85 else 1 }, animate)
    w:_reveal(self.input, { TextTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.emojiButton, {
        BackgroundTransparency = if shown then theme.FieldTransparency else 1,
        TextTransparency = if shown then 0 else 1,
    }, animate)
    w:_reveal(self.sendButton, {
        BackgroundTransparency = if shown then 0 else 1,
        TextTransparency = if shown then 0 else 1,
    }, animate)

    self._textTransparency = if shown then 0 else 1
    for _, row in self.rows do
        w:_reveal(row.avatar, {
            ImageTransparency = self._textTransparency,
            BackgroundTransparency = if shown then 0.2 else 1,
        }, animate)
        if row.initial then
            w:_reveal(row.initial, { TextTransparency = self._textTransparency }, animate)
        end
        w:_reveal(row.nameLabel, { TextTransparency = if shown then 0.45 else 1 }, animate)
        w:_reveal(row.contentLabel, { TextTransparency = self._textTransparency }, animate)
        if row.inviteButton then
            w:_reveal(row.inviteButton, {
                BackgroundTransparency = if shown then 0 else 1,
                TextTransparency = self._textTransparency,
            }, animate)
        end
    end
    if not shown then
        self:_toggleEmojiPicker(false)
    end

    if self.descriptor then
        w:_reveal(self.descriptor.titleLabel, { TextTransparency = if shown then 0.7 else 1 }, animate)
    end
end

-- Point the chat at another channel (or relay) and start over.
function Chat:SetChannel(channel, endpoint)
    self.channel = channel or self.channel
    if endpoint then
        self.endpoint = tostring(endpoint):gsub("/+$", "")
    end
    self.version = nil
    self._primed = false
    self:_apply({})
    local wasUnconfigured = self.status == "unconfigured"
    self:_setStatus("connecting")
    if wasUnconfigured and self.autoPoll then
        self:_startPolling()
    end
    task.spawn(function()
        self:Refresh()
    end)
end

function Chat:Clear()
    self:_apply({})
end

function Chat:Remove()
    self._alive = false
    if self.descriptor then
        self.descriptor:Remove()
    end
    if self.tab._forget then
        self.tab:_forget(self)
    end
    self.window:DestroySubtree(self.main)
end

moveable(Chat)

return Chat
