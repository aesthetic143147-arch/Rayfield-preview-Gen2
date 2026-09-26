--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Floating nameplates over the heads of everyone running your script.
--
-- Each plate is a small, quiet BillboardGui on the player's head, in the spirit of Novoline's with
-- Rayfield's finish: the hub's mark on the left in a faint halo with a few sparks orbiting it, and a
-- dark glass card over a galaxy backdrop with the title, the player's @username and an optional
-- badge, edged by a hairline.
--
-- It enters as a sequence rather than a fade: the mark swirls in out of nothing, the card unfolds
-- from behind it with a soft wipe, then the title slides in, the name follows and the badge pops.
-- At rest it breathes: a gentle bob, the halo pulsing, light running along the title, a sweep
-- across the glass now and then, and the edge gradient turning. Everything runs from one
-- per-frame loop, and every colour, image, size and motion is a style setting (see `presets`).
--
-- Images can move. The logo and backdrop settings take a still image, a GIF link (the relay turns
-- it into a sprite sheet, since Roblox can't play GIFs), a sprite sheet of your own, or a list of
-- frames. Players can also put their own image or GIF on their plate with SetMedia; the relay
-- keeps it and shows it to everyone else.
--
-- Plates are drawn locally, so only people running the script see them. Knowing who else in the
-- server runs it takes a shared list: with `endpoint` set, each player checks in with the relay
-- (relay/ in this repo) and gets back everyone else in the same server. Without it, you see your
-- own plate only.

local Nameplate = {}
Nameplate.__index = Nameplate
Nameplate.__type = "Nameplate"

-- Utility
local utility = script.Parent.Parent.utility

local variables = require(utility.variables)
local services = require(utility.services)
local relayClient = require(utility.relayClient)
local imageCache = require(utility.imageCache)
local animatedImage = require(utility.animatedImage)
local filesystem = require(utility.filesystem)
local path = require(utility.path)

local white = Color3.new(1, 1, 1)

-- Every look is a style: a full table of settings. `preset` picks a starting point and `style`
-- overrides any of its keys. Image settings take a file in this repo's assets/ ("x.png"), an
-- asset id, any image URI, or false for none.
local presets = {
    Omnity = {
        -- shape and placement (studs)
        size = Vector2.new(4.4, 1.05),
        lift = 2.4, -- above the head
        maxDistance = 100,
        cornerRadius = 0.26, -- of the card's height

        -- colour
        accent = Color3.fromRGB(125, 180, 255), -- badge, halo, sparks
        accentDeep = Color3.fromRGB(59, 130, 246), -- the edge gradient's ends
        cardColor = Color3.fromRGB(5, 7, 14),
        cardTransparency = 0.14,
        veilColor = Color3.fromRGB(3, 4, 9), -- darkens behind the text
        veilStrength = 0.8, -- 0 none, 1 solid at the left edge
        titleColor = Color3.fromRGB(250, 251, 255),
        subtitleColor = Color3.fromRGB(150, 162, 186),
        badgeTextColor = Color3.fromRGB(235, 244, 255),

        -- images
        logo = "omnity-logo.png",
        logoTint = white,
        logoScale = 0.66, -- of the card's height
        backdrop = "nameplate-galaxy.png",
        backdropTint = white,
        backdropTransparency = 0.25,
        glowImage = "nameplate-glow.png",

        -- type (nil: the library's brand font, bold title and medium name)
        titleFont = nil,
        subtitleFont = nil,
        titleTop = 0.2, -- where the title starts, of the card's height
        titleSize = 0.3, -- title height, of the card's height
        subtitleSize = 0.2, -- @username height

        -- motion
        entrance = "unfold", -- "unfold", "fade" or "none"
        logoSway = 6, -- degrees the mark rocks either way at rest
        logoSpin = 0, -- degrees a second of continuous turning (the mark is drawn in perspective,
        -- so a gentle sway reads better than a full spin)
        halo = true,
        sparkles = 4, -- how many orbit the mark; 0 for none
        sparkleColor = Color3.fromRGB(220, 235, 255),
        titleShine = true, -- light running along the title
        sweep = true, -- a band of light across the glass
        sweepEvery = 7, -- seconds
        border = true,
        borderThickness = 1,
        borderTransparency = 0.45, -- the hairline edge at rest
        borderSpeed = 40, -- degrees a second the edge gradient turns
        glow = false, -- a soft outer glow around the edge
        bob = true,
        bobHeight = 0.06,
        bobSpeed = 1.6,
    },
}

-- Midnight: the misty mountain backdrop and a deeper blue.
presets.Midnight = table.clone(presets.Omnity)
presets.Midnight.backdrop = "nameplate-mountains.png"
presets.Midnight.accent = Color3.fromRGB(96, 165, 250)
presets.Midnight.accentDeep = Color3.fromRGB(37, 99, 235)
presets.Midnight.sparkles = 3

-- Mono: silver on black, quiet motion.
presets.Mono = table.clone(presets.Omnity)
presets.Mono.backdrop = false
presets.Mono.accent = Color3.fromRGB(220, 224, 232)
presets.Mono.accentDeep = Color3.fromRGB(120, 126, 140)
presets.Mono.sparkleColor = white
presets.Mono.sparkles = 0
presets.Mono.cardColor = Color3.fromRGB(10, 10, 12)

Nameplate.presets = presets

local vanishTime = 0.35
local sweepTime = 1.1
local nearFade = 3 -- closer than this (first person) the plate gets out of the way
local defaultCheckIn = 20

local function clamp01(x)
    return math.clamp(x, 0, 1)
end

local function span(t, start, length)
    return clamp01((t - start) / length)
end

local function outCubic(p)
    return 1 - (1 - p) ^ 3
end

local function outQuint(p)
    return 1 - (1 - p) ^ 5
end

-- a touch of overshoot on the way in, the way a real object settles
local function outBack(p)
    local c1, c3 = 1.6, 2.6
    return 1 + c3 * (p - 1) ^ 3 + c1 * (p - 1) ^ 2
end

local function inOutSine(p)
    return -(math.cos(math.pi * p) - 1) / 2
end

local function escape(text: string): string
    return (text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

-- Merge a preset with overrides into one complete style.
local function resolveStyle(presetName, overrides)
    local base = presets[presetName] or presets.Omnity
    local style = table.clone(base)
    if type(overrides) == "table" then
        for key, value in overrides do
            style[key] = value
        end
    end
    return style
end

-- An image setting's shapes, for the card slot it fills: a banner for the backdrop, a square for
-- the logo. The relay cuts GIF frames to that shape.
local fits = { logo = "square", backdrop = "banner", glowImage = "square" }

function Nameplate.new(window, properties)
    properties = if typeof(properties) == "table" then properties else {}

    -- the older flat options still work, as overrides
    local overrides = table.clone(properties.style or properties.Style or {})
    for _, key in { "accent", "logo", "backdrop", "maxDistance", "lift" } do
        local value = properties[key]
        if value == nil then
            value = properties[key:sub(1, 1):upper() .. key:sub(2)]
        end
        if value ~= nil and overrides[key] == nil then
            overrides[key] = value
        end
    end

    local self = setmetatable({
        window = window,
        title = properties.title or properties.Title or string.upper(tostring(window.name or "Rayfield")),
        subtitle = properties.subtitle or properties.Subtitle,
        badge = properties.badge or properties.Badge,
        preset = properties.preset or properties.Preset or "Omnity",
        overrides = overrides,
        endpoint = relayClient.base(properties.endpoint or properties.Endpoint),
        key = properties.key or properties.Key,
        transport = properties.transport or properties.Transport,
        showSelf = properties.showSelf ~= false and properties.ShowSelf ~= false,
        hideDefaultName = properties.hideDefaultName ~= false and properties.HideDefaultName ~= false,
        checkInInterval = math.max(tonumber(properties.checkInInterval) or defaultCheckIn, 5),
        autoCheckIn = properties.autoCheckIn ~= false, -- false: call CheckIn yourself
        playerMedia = properties.playerMedia ~= false, -- false: ignore players' own images

        enabled = true,
        plates = {}, -- player -> plate
        users = {}, -- userId -> { badge }
        images = {}, -- setting name -> visual (see utility/animatedImage) once loaded
        _sheets = {}, -- relay media id -> visual, so a GIF many players use downloads once
        _dying = {},
        _alive = true,
    }, Nameplate)
    self.style = resolveStyle(self.preset, overrides)

    self.players = services.getService("Players")
    self.folder = window:Create("Folder", {
        Name = variables.httpService:GenerateGUID(false),
        Parent = variables.guiContainer,
    })

    self:_loadImages()

    local localPlayer = variables.localPlayer
    if localPlayer and self.showSelf then
        self.users[localPlayer.UserId] = { badge = self.badge }
    end

    -- players come and go; each one's character is followed so the plate survives respawns
    if self.players and self.players.PlayerAdded then
        window:Connect(self.players.PlayerAdded, function(player)
            self:_reconcile(player)
        end)
        window:Connect(self.players.PlayerRemoving, function(player)
            self:_drop(player)
        end)
    end

    self.stepConnection = window:Connect(variables.runService.RenderStepped, function()
        self:_step(os.clock())
    end)

    self:_reconcileAll()
    if (self.endpoint or self.transport) and self.autoCheckIn then
        self:_startCheckIns()
    end

    return self
end

-- Artwork ---------------------------------------------------------------------------------------

-- Downloads go through here so a test (or an unusual executor) can swap them out.
function Nameplate:_download(kind, source, fileName)
    if kind == "remote" then
        return imageCache.remote(source)
    end
    return imageCache.url(source, fileName)
end

-- A relay's converted sheet, as a visual. Cached by id: the same GIF on ten plates is one file.
function Nameplate:_sheetVisual(meta)
    if type(meta) ~= "table" or type(meta.id) ~= "string" or not meta.id:match("^%x+$") then
        return nil
    end
    local cached = self._sheets[meta.id]
    if cached then
        return cached
    end
    if not self.endpoint then
        return nil
    end
    local uri = self:_download("url", `{self.endpoint}/v1/media/{meta.id}.png`, `media_{meta.id}.png`)
    if not uri then
        return nil
    end
    local visual = {
        uri = uri,
        sheet = {
            frames = math.max(tonumber(meta.frames) or 1, 1),
            columns = math.max(tonumber(meta.columns) or 1, 1),
            frameWidth = tonumber(meta.frameWidth) or 0,
            frameHeight = tonumber(meta.frameHeight) or 0,
            fps = tonumber(meta.fps) or 0,
        },
    }
    self._sheets[meta.id] = visual
    return visual
end

-- Turn an image setting into something drawable. Yields when it has to download.
--   false / nil                      nothing
--   123456 / "rbxassetid://…" / URI  a still image
--   "file.png"                       a file in this project's assets/
--   "https://….gif"                  any image or GIF link, converted by the relay
--   { gif = "https://…" }            the same, spelled out
--   { sheet = image, frames = 12, columns = 4, frameSize = Vector2.new(w, h), fps = 12 }
--                                    your own sprite sheet
--   { images = { image, image, … }, fps = 8 }   separate frames, shown in turn
function Nameplate:_resolveVisual(spec, fit)
    if spec == nil or spec == false then
        return nil
    elseif type(spec) == "number" or (type(spec) == "string" and spec:match("^%d+$")) then
        return { uri = "rbxassetid://" .. tostring(spec) }
    elseif type(spec) == "string" then
        if spec:match("^[%w%-_]+%.png$") then
            local uri = self:_download("remote", spec)
            return if uri then { uri = uri } else nil
        elseif spec:match("^https?://") then
            return self:_relayVisual(spec, fit)
        end
        return { uri = spec }
    elseif type(spec) == "table" then
        if spec.gif or spec.url then
            return self:_relayVisual(tostring(spec.gif or spec.url), fit)
        elseif spec.sheet then
            local base = self:_resolveVisual(spec.sheet, fit)
            if not base or not base.uri then
                return nil
            end
            local size = spec.frameSize or Vector2.new(spec.frameWidth or 0, spec.frameHeight or 0)
            local frames = math.max(tonumber(spec.frames) or 1, 1)
            return {
                uri = base.uri,
                sheet = {
                    frames = frames,
                    columns = math.max(tonumber(spec.columns) or frames, 1),
                    frameWidth = size.X,
                    frameHeight = size.Y,
                    fps = tonumber(spec.fps) or 10,
                },
            }
        elseif type(spec.images) == "table" then
            local list = {}
            for _, image in spec.images do
                local visual = self:_resolveVisual(image, fit)
                if visual and visual.uri then
                    table.insert(list, visual.uri)
                end
            end
            return if #list > 0 then { list = list, fps = tonumber(spec.fps) or 8 } else nil
        end
    end
    return nil
end

-- A link converted by the relay into a sprite sheet.
function Nameplate:_relayVisual(url, fit)
    if not self.endpoint and not self.transport then
        return nil
    end
    local ok, meta = relayClient.request(self, "POST", "/v1/media", { url = url, fit = fit })
    if not ok then
        return nil
    end
    return self:_sheetVisual(meta)
end

-- Where the executor can't load custom assets, the plate still works: a lettered mark instead of
-- the logo, plain glass instead of a backdrop.
function Nameplate:_loadImages()
    table.clear(self.images)
    local generation = {}
    self._imageGeneration = generation
    for _, name in { "logo", "backdrop", "glowImage" } do
        task.spawn(function()
            local visual = self:_resolveVisual(self.style[name], fits[name])
            -- a SetStyle in the meantime makes this answer stale
            if visual and self._alive and self._imageGeneration == generation then
                self.images[name] = visual
                for _, plate in self.plates do
                    self:_applyImages(plate)
                end
            end
        end)
    end
end

function Nameplate:_applyImages(plate)
    local parts = plate.parts
    if not parts then
        return
    end
    local images = self.images
    local logo, backdrop = images.logo, images.backdrop
    -- a player's own image takes its slot on their plate
    local custom = self.playerMedia and plate.media
    if custom and custom.visual then
        if custom.slot == "logo" then
            logo = custom.visual
        else
            backdrop = custom.visual
        end
    end
    animatedImage.apply(parts.logo, logo)
    parts.logo.Visible = logo ~= nil
    parts.monogram.Visible = logo == nil
    -- a custom square picture gets rounded corners; the Omnity mark has its own shape
    parts.logoCorner.CornerRadius = UDim.new(if custom and custom.slot == "logo" then 0.22 else 0, 0)
    animatedImage.apply(parts.backdrop, backdrop)
    parts.backdrop.Visible = backdrop ~= nil
    local glow = images.glowImage
    parts.halo.Image = if glow then glow.uri or "" else ""
    parts.halo.Visible = self.style.halo and glow ~= nil
    plate.visuals = {
        { label = parts.logo, visual = logo, state = {} },
        { label = parts.backdrop, visual = backdrop, state = {} },
    }
end

-- A player's own image, from their check-in. Downloads once per image, then applies.
function Nameplate:_syncMedia(plate)
    local info = self.users[plate.player.UserId]
    local meta = info and info.media
    local id = if type(meta) == "table" then meta.id else nil
    if id == plate.mediaId then
        return
    end
    plate.mediaId = id
    if not id or not self.playerMedia then
        plate.media = nil
        self:_applyImages(plate)
        return
    end
    task.spawn(function()
        local visual = self:_sheetVisual(meta)
        if plate.mediaId ~= id then
            return -- changed again while downloading
        end
        plate.media = if visual then { visual = visual, slot = meta.slot } else nil
        self:_applyImages(plate)
    end)
end

-- Who gets a plate ------------------------------------------------------------------------------

function Nameplate:_listPlayers()
    if self.players and self.players.GetPlayers then
        return self.players:GetPlayers()
    end
    return { variables.localPlayer }
end

function Nameplate:_wants(player)
    return player ~= nil and self.users[player.UserId] ~= nil
end

function Nameplate:_reconcileAll()
    for _, player in self:_listPlayers() do
        self:_reconcile(player)
    end
    for player in self.plates do
        if not self:_wants(player) then
            self:_drop(player)
        end
    end
end

function Nameplate:_reconcile(player)
    if not self:_wants(player) then
        self:_drop(player)
        return
    end
    local entry = self.plates[player]
    if not entry then
        entry = { player = player }
        self.plates[player] = entry
        if player.CharacterAdded then
            entry.characterConnection = self.window:Connect(player.CharacterAdded, function(character)
                self:_attach(player, character)
            end)
        end
        if player.Character then
            self:_attach(player, player.Character)
        end
    elseif entry.parts then
        self:_writeText(entry)
    end
    self:_syncMedia(entry)
end

function Nameplate:_drop(player)
    local entry = self.plates[player]
    if not entry then
        return
    end
    self.plates[player] = nil
    if entry.characterConnection then
        self.window:Disconnect(entry.characterConnection)
    end
    self:_vanish(entry)
end

-- Building a plate ------------------------------------------------------------------------------

function Nameplate:_subtitleFor(player)
    if type(self.subtitle) == "function" then
        return tostring(self.subtitle(player))
    elseif type(self.subtitle) == "string" then
        return self.subtitle
    end
    return "@" .. player.Name
end

function Nameplate:_badgeFor(player)
    local info = self.users[player.UserId]
    local badge = info and info.badge
    return if type(badge) == "string" and badge ~= "" then string.upper(badge) else nil
end

-- Layout, in the plate's own coordinates: everything is a fraction of its width (x) or height (y),
-- so the plate keeps its proportions at any size.
local function layoutFor(style)
    local aspect = style.size.X / style.size.Y
    local logoLeft = 0.14 / aspect
    local logoCenter = logoLeft + style.logoScale / 2 / aspect
    return {
        aspect = aspect,
        logoCenter = logoCenter,
        -- the card starts as a tile around the mark and unfolds to full width
        closedWidth = math.min(logoCenter * 2, 1),
        textLeft = logoCenter + (style.logoScale / 2 + 0.2) / aspect,
        margin = 0.2 / aspect,
    }
end

function Nameplate:_writeText(plate)
    local parts = plate.parts
    local style = self.style
    local layout = plate.layout
    parts.title.Text = self.title
    parts.subtitle.Text = escape(self:_subtitleFor(plate.player))

    local badge = self:_badgeFor(plate.player)
    parts.badge.Visible = badge ~= nil
    local titleRight = 1 - layout.margin
    if badge then
        parts.badgeText.Text = badge
        -- the pill hugs its text: about 0.62 of the text height per character, plus padding
        local height = 0.22
        local width = (#badge * 0.62 * height * 0.6 + height * 1.1) / layout.aspect
        parts.badge.Size = UDim2.fromScale(width, height)
        titleRight -= width + 0.06 / layout.aspect
    end
    parts.title.Size = UDim2.fromScale(math.max(titleRight - layout.textLeft, 0.1), style.titleSize)
    parts.subtitle.Size = UDim2.fromScale(1 - layout.margin - layout.textLeft, style.subtitleSize)
    parts.badgeStroke.Color = style.accent
    parts.badge.BackgroundColor3 = style.accent
end

-- (Re)build the plate on a character's head. Called on spawn, so a respawn gets a fresh plate that
-- plays its entrance again.
--
-- No CanvasGroup: in a BillboardGui it doesn't clip, so every layer that fills the card carries its
-- own rounded corners, the light sweep is a gradient (it can't leave the card), and fading sets
-- each layer's transparency from its resting value.
function Nameplate:_attach(player, character)
    local entry = self.plates[player]
    if not entry or not character then
        return
    end
    entry.character = character
    if entry.gui then
        -- the old body's plate fades out on its own copy while the entry moves to the new one
        self:_vanish(table.clone(entry))
        entry.gui = nil
        entry.parts = nil
    end

    local head = character:FindFirstChild("Head")
    if not head and character.WaitForChild then
        head = character:WaitForChild("Head", 5)
    end
    if not head or self.plates[player] ~= entry then
        return
    end

    local w = self.window
    local style = self.style
    local layout = layoutFor(style)
    local light = style.accent:Lerp(white, 0.6)
    local corner = UDim.new(style.cornerRadius, 0)
    local titleFont = style.titleFont or variables.brandFont(Enum.FontWeight.Bold)
    local subtitleFont = style.subtitleFont or variables.brandFont(Enum.FontWeight.Medium)
    local rounded = function(parent)
        w:Create("UICorner", { CornerRadius = corner, Parent = parent })
    end

    local gui = w:Create("BillboardGui", {
        Name = "Nameplate",
        Adornee = head,
        Size = UDim2.fromScale(style.size.X, style.size.Y), -- studs: it lives in the world
        StudsOffset = Vector3.new(0, style.lift, 0),
        MaxDistance = style.maxDistance,
        AlwaysOnTop = false, -- walls hide it, so it belongs to the world rather than the screen
        LightInfluence = 0,
        ResetOnSpawn = false,
        ClipsDescendants = false,
        Parent = self.folder,
    })
    local shell = w:Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = gui })
    local scale = w:Create("UIScale", { Parent = shell })

    -- soft outer glow (off by default: the minimal look keeps to a hairline edge)
    local glow = w:Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = shell })
    rounded(glow)
    local glowStroke =
        w:Create("UIStroke", { Color = style.accentDeep, Thickness = 3, Transparency = 1, Parent = glow })

    -- the card grows from a tile around the mark to full width; `content` keeps the full width
    -- inside it, so nothing stretches while it unfolds
    local card = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = style.cardColor,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = shell,
    })
    rounded(card)
    local content = w:Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = card })

    local backdrop = w:Create("ImageLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Crop,
        ImageColor3 = style.backdropTint,
        ImageTransparency = 1,
        Visible = false,
        ZIndex = 1,
        Parent = content,
    })
    rounded(backdrop)
    local veil = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = style.veilColor,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = content,
    })
    rounded(veil)
    local strength = clamp01(style.veilStrength)
    w:Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1 - strength),
            NumberSequenceKeypoint.new(0.55, 1 - strength * 0.55),
            NumberSequenceKeypoint.new(1, 1 - strength * 0.12),
        }),
        Parent = veil,
    })

    -- the light sweep: a bright band in a gradient across a rounded white layer, so it stays
    -- inside the card's shape; moving the gradient's offset moves the band
    local shine = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = white,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        Visible = style.sweep,
        Parent = content,
    })
    rounded(shine)
    local sweep = w:Create("UIGradient", {
        Rotation = 20,
        Offset = Vector2.new(-1, 0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.42, 1),
            NumberSequenceKeypoint.new(0.5, 0.9),
            NumberSequenceKeypoint.new(0.58, 1),
            NumberSequenceKeypoint.new(1, 1),
        }),
        Parent = shine,
    })

    local title = w:Create("TextLabel", {
        Position = UDim2.fromScale(layout.textLeft, style.titleTop),
        BackgroundTransparency = 1,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        TextColor3 = style.titleColor,
        TextTransparency = 1,
        FontFace = titleFont,
        ZIndex = 5,
        Parent = content,
    })
    local titleShine = w:Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, white),
            ColorSequenceKeypoint.new(0.5, light),
            ColorSequenceKeypoint.new(1, white),
        }),
        Enabled = style.titleShine,
        Parent = title,
    })
    local subtitle = w:Create("TextLabel", {
        Position = UDim2.fromScale(layout.textLeft, style.titleTop + style.titleSize + 0.05),
        BackgroundTransparency = 1,
        RichText = true,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextColor3 = style.subtitleColor,
        TextTransparency = 1,
        FontFace = subtitleFont,
        ZIndex = 5,
        Parent = content,
    })

    -- the badge: a small quiet pill, top right
    local badge = w:Create("Frame", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1 - layout.margin, style.titleTop + 0.02),
        BackgroundColor3 = style.accent,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 6,
        Parent = content,
    })
    w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = badge })
    local badgeScale = w:Create("UIScale", { Scale = 0, Parent = badge })
    local badgeStroke = w:Create("UIStroke", { Color = style.accent, Thickness = 1, Transparency = 1, Parent = badge })
    local badgeText = w:Create("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.52),
        Size = UDim2.fromScale(0.76, 0.58),
        BackgroundTransparency = 1,
        TextScaled = true,
        TextColor3 = style.badgeTextColor,
        TextTransparency = 1,
        FontFace = titleFont,
        ZIndex = 7,
        Parent = badge,
    })

    -- the hairline edge, its gradient turning slowly around the card
    local border = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Visible = style.border,
        Parent = shell,
    })
    rounded(border)
    local borderStroke = w:Create("UIStroke", {
        Color = white,
        Thickness = style.borderThickness,
        Transparency = 1,
        Parent = border,
    })
    local borderGradient = w:Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, style.accentDeep),
            ColorSequenceKeypoint.new(0.5, light),
            ColorSequenceKeypoint.new(1, style.accentDeep),
        }),
        Parent = borderStroke,
    })

    -- the mark sits above the card so it can arrive first and its sparks can cross the edge
    local markSize = UDim2.fromScale(style.logoScale, style.logoScale)
    local markPosition = UDim2.fromScale(layout.logoCenter, 0.5)
    local halo = w:Create("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = markPosition,
        Size = UDim2.fromScale(style.logoScale * 1.6, style.logoScale * 1.6),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        ImageColor3 = style.accent,
        ImageTransparency = 1,
        Visible = false,
        ZIndex = 8,
        Parent = shell,
    })
    local logo = w:Create("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = markPosition,
        Size = markSize,
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        ImageColor3 = style.logoTint,
        ImageTransparency = 1,
        Visible = false,
        ZIndex = 10,
        Parent = shell,
    })
    local logoCorner = w:Create("UICorner", { CornerRadius = UDim.new(0, 0), Parent = logo })
    local monogram = w:Create("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = markPosition,
        Size = markSize,
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        Text = string.sub(self.title, 1, 1),
        TextScaled = true,
        TextColor3 = light,
        TextTransparency = 1,
        FontFace = titleFont,
        ZIndex = 10,
        Parent = shell,
    })

    local sparks = {}
    local sparkCount = math.max(math.floor(tonumber(style.sparkles) or 0), 0)
    for index = 1, sparkCount do
        local spark = w:Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.04, 0.04),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            BackgroundColor3 = style.sparkleColor,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 11,
            Parent = shell,
        })
        w:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = spark })
        table.insert(sparks, {
            frame = spark,
            offset = (index - 1) / sparkCount * math.pi * 2,
            speed = 0.5 + (index % 3) * 0.1,
            size = 0.028 + (index % 3) * 0.006,
        })
    end

    -- the default Roblox name would sit right under the plate saying the same thing
    local humanoid = character:FindFirstChild("Humanoid")
    local nameType = nil
    if humanoid and self.hideDefaultName then
        nameType = humanoid.DisplayDistanceType or Enum.HumanoidDisplayDistanceType.Viewer
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    end

    entry.gui = gui
    entry.head = head
    entry.humanoid = humanoid
    entry.nameType = nameType
    entry.layout = layout
    entry.born = os.clock()
    entry.phase = (player.UserId % 97) / 97 * 10 -- plates side by side don't move in lockstep
    entry.parts = {
        shell = shell,
        scale = scale,
        glow = glow,
        glowStroke = glowStroke,
        card = card,
        content = content,
        backdrop = backdrop,
        veil = veil,
        shine = shine,
        sweep = sweep,
        border = border,
        borderStroke = borderStroke,
        borderGradient = borderGradient,
        title = title,
        titleShine = titleShine,
        subtitle = subtitle,
        badge = badge,
        badgeScale = badgeScale,
        badgeStroke = badgeStroke,
        badgeText = badgeText,
        halo = halo,
        logo = logo,
        logoCorner = logoCorner,
        monogram = monogram,
        sparks = sparks,
    }
    self:_writeText(entry)
    self:_applyImages(entry)
    self:_step(os.clock())
end

-- Fade a plate out and then remove it. Takes the plate's own fields, so a respawn can retire the
-- old plate while the entry moves on to the new one.
function Nameplate:_vanish(plate)
    if not plate.gui then
        return
    end
    if plate.humanoid and plate.nameType and plate.humanoid.Parent then
        plate.humanoid.DisplayDistanceType = plate.nameType
    end
    plate.diedAt = os.clock()
    plate.humanoid = nil
    table.insert(self._dying, plate)
end

-- Animation -------------------------------------------------------------------------------------

-- Where each part of the entrance is at, 0 to 1, `age` seconds in.
local function entranceAt(kind, age)
    if kind == "none" then
        return { mark = 1, card = 1, edge = 1, title = 1, subtitle = 1, badge = 1, sparks = 1, fade = 1 }
    elseif kind == "fade" then
        local p = span(age, 0, 0.5)
        return { mark = p, card = 1, edge = p, title = p, subtitle = p, badge = p, sparks = p, fade = p }
    end
    return {
        mark = span(age, 0, 0.5),
        card = span(age, 0.15, 0.6),
        edge = span(age, 0.45, 0.4),
        title = span(age, 0.42, 0.45),
        subtitle = span(age, 0.52, 0.45),
        badge = span(age, 0.65, 0.4),
        sparks = span(age, 0.3, 0.6),
        fade = span(age, 0.1, 0.35),
    }
end

-- A layer's transparency at `alpha` of the way from hidden (1) to its resting value.
local function fadeTo(base, alpha)
    return 1 - (1 - base) * alpha
end

local function animate(self, plate, t, cap)
    local parts = plate.parts
    if not parts then
        return false
    end
    local style = self.style
    local layout = plate.layout
    local age = t - plate.born
    local e = entranceAt(style.entrance, age)

    -- overall visibility: enabled, dying, distance
    local alpha = cap
    local shrink = 1
    if plate.diedAt then
        local q = clamp01((t - plate.diedAt) / vanishTime)
        if q >= 1 then
            return true -- finished: caller removes it
        end
        alpha *= 1 - outCubic(q)
        shrink = 1 - 0.08 * q
    end
    local camera = variables.workspace.CurrentCamera
    if camera and plate.head and plate.head.Parent then
        local distance = (camera.CFrame.Position - plate.head.Position).Magnitude
        local far = clamp01((distance - style.maxDistance * 0.6) / (style.maxDistance * 0.4))
        local near = clamp01((distance - nearFade) / 2)
        alpha *= (1 - far) * near
    end
    parts.scale.Scale = shrink

    local phase = t + plate.phase

    -- the mark: swirls in out of nothing, then rocks gently while the halo breathes
    local mark = e.mark
    local markAlpha = outCubic(mark) * alpha
    local markSize = style.logoScale * (0.35 + 0.65 * outBack(mark))
    local spin = (1 - outCubic(mark)) * -90
        + math.sin(phase * 0.8) * (style.logoSway or 0)
        + phase * (style.logoSpin or 0)
    for _, part in { parts.logo, parts.monogram } do
        part.Size = UDim2.fromScale(markSize, markSize)
        part.Rotation = spin % 360
    end
    parts.logo.ImageTransparency = 1 - markAlpha
    parts.monogram.TextTransparency = 1 - markAlpha
    local breath = 0.5 + 0.5 * math.sin(phase * 2.1)
    parts.halo.ImageTransparency = 1 - markAlpha * (0.18 + 0.12 * breath)
    local haloSize = style.logoScale * (1.45 + 0.12 * breath) * (0.5 + 0.5 * outCubic(mark))
    parts.halo.Size = UDim2.fromScale(haloSize, haloSize)

    -- sparks orbit the mark on a tilted ellipse; the ones behind it dim and pass underneath
    local sparkAlpha = outCubic(e.sparks) * alpha
    local tilt = math.rad(-25)
    for _, spark in parts.sparks do
        local angle = phase * spark.speed + spark.offset
        local dx, dy = math.cos(angle) * 0.62, math.sin(angle) * 0.2
        local x = dx * math.cos(tilt) - dy * math.sin(tilt)
        local y = dx * math.sin(tilt) + dy * math.cos(tilt)
        local front = math.sin(angle) > 0
        local depth = if front then 1 else 0.7
        local twinkle = 0.75 + 0.25 * math.sin(phase * 5 + spark.offset * 3)
        spark.frame.Position =
            UDim2.fromScale(layout.logoCenter + x * style.logoScale / layout.aspect, 0.5 + y * style.logoScale)
        spark.frame.Size = UDim2.fromScale(spark.size * depth, spark.size * depth)
        spark.frame.ZIndex = if front then 11 else 9
        spark.frame.BackgroundTransparency = 1 - sparkAlpha * twinkle * (if front then 0.8 else 0.3)
    end

    -- the card: unfolds from a tile around the mark to full width
    local open = outQuint(e.card)
    local width = layout.closedWidth + (1 - layout.closedWidth) * open
    local frameSize = UDim2.fromScale(width, 1)
    parts.card.Size = frameSize
    parts.border.Size = frameSize
    parts.glow.Size = frameSize
    parts.content.Size = UDim2.fromScale(1 / width, 1)

    local cardAlpha = outCubic(e.fade) * alpha
    parts.card.BackgroundTransparency = fadeTo(style.cardTransparency, cardAlpha)
    parts.backdrop.ImageTransparency = fadeTo(style.backdropTransparency, cardAlpha * open)
    parts.veil.BackgroundTransparency = fadeTo(0, cardAlpha)
    parts.shine.BackgroundTransparency = fadeTo(0, cardAlpha)

    local edgeAlpha = outCubic(e.edge) * alpha
    parts.borderStroke.Transparency = fadeTo(style.borderTransparency, math.max(edgeAlpha, cardAlpha * 0.6))
    parts.glowStroke.Transparency = if style.glow then fadeTo(0.85, edgeAlpha) else 1
    parts.borderGradient.Rotation = (phase * style.borderSpeed) % 360

    -- the words: title slides in, the name follows, the badge pops
    local titleIn = outCubic(e.title)
    parts.title.TextTransparency = 1 - titleIn * alpha
    parts.title.Position = UDim2.fromScale(layout.textLeft + (1 - titleIn) * 0.03, style.titleTop)
    local subtitleIn = outCubic(e.subtitle)
    parts.subtitle.TextTransparency = 1 - subtitleIn * alpha
    parts.subtitle.Position =
        UDim2.fromScale(layout.textLeft + (1 - subtitleIn) * 0.02, style.titleTop + style.titleSize + 0.05)
    parts.badgeScale.Scale = outBack(e.badge)
    local badgeAlpha = clamp01(e.badge * 1.5) * alpha
    parts.badge.BackgroundTransparency = fadeTo(0.86, badgeAlpha)
    parts.badgeStroke.Transparency = fadeTo(0.55, badgeAlpha)
    parts.badgeText.TextTransparency = 1 - badgeAlpha
    if style.titleShine then
        parts.titleShine.Offset = Vector2.new(((phase * 0.3) % 2) - 1, 0)
    end

    -- animated logo and backdrop: advance their frames
    if plate.visuals then
        for _, entry in plate.visuals do
            if entry.visual then
                animatedImage.step(entry.label, entry.visual, phase, entry.state)
            end
        end
    end

    -- the float, and a sweep of light across the glass every so often
    local bob = if style.bob then math.sin(phase * style.bobSpeed) * style.bobHeight else 0
    plate.gui.StudsOffset = Vector3.new(0, style.lift + bob, 0)
    if style.sweep then
        local u = (phase % style.sweepEvery) / sweepTime
        parts.sweep.Offset = Vector2.new(if u < 1 then -1 + 2 * inOutSine(u) else -1, 0)
    end
    return false
end

function Nameplate:_step(t)
    local cap = if self.enabled then 1 else 0
    for _, plate in self.plates do
        if plate.gui then
            animate(self, plate, t, cap)
        end
    end
    local dying = self._dying
    for index = #dying, 1, -1 do
        local plate = dying[index]
        if animate(self, plate, t, cap) then
            table.remove(dying, index)
            self.window:DestroySubtree(plate.gui)
        end
    end
end

-- Check-ins -------------------------------------------------------------------------------------

function Nameplate:_identity()
    local player = variables.localPlayer
    return {
        user = {
            id = if player then player.UserId else 0,
            name = if player then player.Name else "Player",
        },
        jobId = tostring(game.JobId ~= nil and game.JobId ~= "" and game.JobId or "studio"),
    }
end

-- One check-in: tell the relay we're here, take back who else is. Public for scripts that want to
-- refresh on their own schedule.
function Nameplate:CheckIn(): boolean
    if not self._alive then
        return false
    end
    local ok, data = relayClient.request(self, "POST", "/v1/presence", self:_identity())
    if not ok or type(data) ~= "table" or type(data.users) ~= "table" then
        return false
    end
    local users = {}
    for _, user in data.users do
        local id = tonumber(type(user) == "table" and user.id)
        if id then
            users[id] = {
                badge = if type(user.badge) == "string" then user.badge else nil,
                media = if type(user.media) == "table" then user.media else nil,
            }
        end
    end
    local localPlayer = variables.localPlayer
    if localPlayer then
        if self.showSelf then
            users[localPlayer.UserId] = users[localPlayer.UserId] or {}
            users[localPlayer.UserId].badge = users[localPlayer.UserId].badge or self.badge
        else
            users[localPlayer.UserId] = nil
        end
    end
    self.users = users
    self:_reconcileAll()
    return true
end

function Nameplate:_startCheckIns()
    task.spawn(function()
        while self._alive and not self.window.unloaded do
            self:CheckIn()
            task.wait(self.checkInInterval)
        end
        -- leave the list straight away rather than waiting to time out
        relayClient.request(self, "DELETE", "/v1/presence", self:_identity())
    end)
end

-- Public ----------------------------------------------------------------------------------------

-- Show or hide every plate (they fade rather than pop).
function Nameplate:SetEnabled(enabled: boolean)
    self.enabled = enabled ~= false
end

function Nameplate:SetTitle(title: string)
    self.title = tostring(title)
    for _, plate in self.plates do
        if plate.parts then
            self:_writeText(plate)
        end
    end
end

-- Change the look: a preset name, a table of style overrides, or both. Plates rebuild and play
-- their entrance again.
function Nameplate:SetStyle(style, preset: string?)
    if type(style) == "string" then
        preset, style = style, nil
    end
    if preset then
        self.preset = preset
    end
    if type(style) == "table" then
        for key, value in style do
            self.overrides[key] = value
        end
    end
    self.style = resolveStyle(self.preset, self.overrides)
    self:_loadImages()
    for player, plate in self.plates do
        if plate.character then
            self:_attach(player, plate.character)
        end
    end
end

-- The token that proves your custom image is yours, kept in the executor's workspace.
local function tokenPath()
    return path.join(variables.fileSystemManager:getRootFolder(), "nameplate-token.txt")
end

function Nameplate:_token()
    if self._savedToken then
        return self._savedToken
    end
    local ok, token = pcall(function()
        return if filesystem.isfile(tokenPath()) then filesystem.readfile(tokenPath()) else nil
    end)
    self._savedToken = if ok and type(token) == "string" and token ~= "" then token else nil
    return self._savedToken
end

function Nameplate:_saveToken(token)
    if type(token) ~= "string" or token == "" then
        return
    end
    self._savedToken = token
    pcall(function()
        filesystem.ensureFolder(variables.fileSystemManager:getRootFolder())
        filesystem.writefile(tokenPath(), token)
    end)
end

-- Put your own image or GIF on your plate, for everyone running the script to see. `link` is an
-- image or GIF link (Discord, Tenor, Giphy, Imgur, …); `slot` is "backdrop" (default, the whole
-- card) or "logo" (the square on the left). Returns ok and, if not, why.
function Nameplate:SetMedia(link: string, slot: string?): (boolean, string?)
    if not self.endpoint and not self.transport then
        return false, "Custom images need a relay (endpoint)."
    end
    local body = self:_identity()
    body.token = self:_token()
    body.media = { url = tostring(link), slot = if slot == "logo" then "logo" else "backdrop" }
    local ok, data = relayClient.request(self, "PUT", "/v1/profile", body)
    if not ok or type(data) ~= "table" then
        return false,
            if type(data) == "table" and type(data.error) == "string" then data.error else "Couldn't set that image."
    end
    self:_saveToken(data.token)
    self:_setOwnMedia(data.media)
    return true
end

-- Take your own image off your plate.
function Nameplate:ClearMedia(): boolean
    if not self.endpoint and not self.transport then
        return false
    end
    local body = self:_identity()
    body.token = self:_token()
    local ok, data = relayClient.request(self, "DELETE", "/v1/profile", body)
    if ok and type(data) == "table" then
        self:_saveToken(data.token)
        self:_setOwnMedia(nil)
    end
    return ok
end

function Nameplate:_setOwnMedia(media)
    local me = variables.localPlayer
    if not me then
        return
    end
    self.users[me.UserId] = self.users[me.UserId] or { badge = self.badge }
    self.users[me.UserId].media = media
    if self.plates[me] then
        self:_syncMedia(self.plates[me])
    end
end

-- Give a player a plate yourself (for a backend other than the relay), with an optional badge.
function Nameplate:Add(player, badge: string?)
    if typeof(player) ~= "Instance" and type(player) ~= "table" then
        return
    end
    self.users[player.UserId] = { badge = badge }
    self:_reconcile(player)
end

function Nameplate:Remove(player)
    if player then
        self.users[player.UserId] = nil
        self:_drop(player)
    end
end

function Nameplate:Destroy()
    if not self._alive then
        return
    end
    self._alive = false
    for player in self.plates do
        self:_drop(player)
    end
    -- give the fades a moment, then take everything down
    task.delay(vanishTime + 0.05, function()
        if self.stepConnection then
            self.window:Disconnect(self.stepConnection)
        end
        if self.folder then
            self.window:DestroySubtree(self.folder)
        end
    end)
end

return Nameplate
