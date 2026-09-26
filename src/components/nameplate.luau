--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Floating nameplates over the heads of everyone running your script.
--
-- Each plate is a BillboardGui on the player's head: a dark glass card over a misty backdrop, the
-- hub's mark, its name and the player's @username, edged by a slowly turning gradient. It rises
-- in with a small overshoot, bobs gently, catches a light sweep every few seconds and fades with
-- distance, all driven from one per-frame loop.
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

local defaultAccent = Color3.fromRGB(59, 130, 246)
local plateSize = UDim2.fromScale(5.6, 1.35) -- studs: it sits in the world and scales with it
local defaultLift = 2.5 -- studs above the head
local bobHeight = 0.08
local bobSpeed = 1.8
local appearTime = 0.7
local vanishTime = 0.35
local sweepEvery = 6.5 -- seconds between light sweeps
local sweepTime = 1.1
local nearFade = 3 -- closer than this (first person) the plate gets out of the way
local defaultMaxDistance = 100
local defaultCheckIn = 20

local function clamp01(x)
    return math.clamp(x, 0, 1)
end

local function outCubic(p)
    return 1 - (1 - p) ^ 3
end

-- a touch of overshoot on the way in, the way a real object settles
local function outBack(p)
    local c1, c3 = 1.5, 2.5
    return 1 + c3 * (p - 1) ^ 3 + c1 * (p - 1) ^ 2
end

local function inOutSine(p)
    return -(math.cos(math.pi * p) - 1) / 2
end

local function escape(text: string): string
    return (text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

function Nameplate.new(window, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        window = window,
        title = properties.title or properties.Title or string.upper(tostring(window.name or "Rayfield")),
        subtitle = properties.subtitle or properties.Subtitle,
        accent = properties.accent or properties.Accent or defaultAccent,
        logo = properties.logo or properties.Logo,
        backdrop = properties.backdrop or properties.Backdrop,
        badge = properties.badge or properties.Badge,
        endpoint = relayClient.base(properties.endpoint or properties.Endpoint),
        key = properties.key or properties.Key,
        transport = properties.transport or properties.Transport,
        showSelf = properties.showSelf ~= false and properties.ShowSelf ~= false,
        hideDefaultName = properties.hideDefaultName ~= false and properties.HideDefaultName ~= false,
        maxDistance = tonumber(properties.maxDistance or properties.MaxDistance) or defaultMaxDistance,
        lift = tonumber(properties.lift or properties.Lift) or defaultLift,
        checkInInterval = math.max(tonumber(properties.checkInInterval) or defaultCheckIn, 5),
        autoCheckIn = properties.autoCheckIn ~= false, -- false: call CheckIn yourself

        enabled = true,
        plates = {}, -- player -> plate
        users = {}, -- userId -> { badge }
        _alive = true,
        _images = {},
    }, Nameplate)

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

-- Artwork -----------------------------------------------------------------------------------------

-- The mark and backdrop come from this project's assets/ as custom assets. Where the executor
-- can't load those, plates fall back to a lettered mark on a plain gradient, still complete.
function Nameplate:_loadImages()
    local function want(value, default)
        if value == false then
            return nil
        elseif value == nil then
            return { file = default }
        elseif type(value) == "number" or (type(value) == "string" and value:match("^%d+$")) then
            return { uri = "rbxassetid://" .. tostring(value) }
        end
        return { uri = tostring(value) }
    end
    local wanted = {
        logo = want(self.logo, "nameplate-mark.png"),
        backdrop = want(self.backdrop, "nameplate-backdrop.png"),
    }
    for name, source in wanted do
        if source.uri then
            self._images[name] = source.uri
        elseif source.file then
            task.spawn(function()
                local uri = imageCache.remote(source.file)
                if uri and self._alive then
                    self._images[name] = uri
                    for _, plate in self.plates do
                        self:_applyImages(plate)
                    end
                end
            end)
        end
    end
end

function Nameplate:_applyImages(plate)
    local logo, backdrop = self._images.logo, self._images.backdrop
    if logo then
        plate.logo.Image = logo
        plate.logo.Visible = true
        plate.monogram.Visible = false
    end
    if backdrop then
        plate.backdrop.Image = backdrop
        plate.backdrop.Visible = true
    end
end

-- Who gets a plate ---------------------------------------------------------------------------------

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
    elseif entry.subtitle then
        entry.subtitle.Text = self:_subtitleFor(player)
    end
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

-- Building a plate ----------------------------------------------------------------------------------

function Nameplate:_subtitleFor(player)
    local text = if type(self.subtitle) == "function"
        then tostring(self.subtitle(player))
        elseif type(self.subtitle) == "string" then self.subtitle
        else "@" .. player.Name
    local info = self.users[player.UserId]
    local badge = info and info.badge
    if badge then
        local hex = self.accent:ToHex()
        text = escape(text) .. `  <font color="#{hex}">•  {escape(string.upper(tostring(badge)))}</font>`
        return text
    end
    return escape(text)
end

-- (Re)build the plate on a character's head. Called on spawn, so a respawn gets a fresh plate that
-- rises in again.
function Nameplate:_attach(player, character)
    local entry = self.plates[player]
    if not entry or not character then
        return
    end
    if entry.gui then
        -- the old body's plate fades out on its own copy while the entry moves to the new one
        self:_vanish(table.clone(entry))
        entry.gui = nil
    end

    local head = character:FindFirstChild("Head")
    if not head and character.WaitForChild then
        head = character:WaitForChild("Head", 5)
    end
    if not head or not self.plates[player] then
        return
    end

    local w = self.window
    local accent = self.accent
    local light = accent:Lerp(Color3.new(1, 1, 1), 0.65)

    local gui = w:Create("BillboardGui", {
        Name = "Nameplate",
        Adornee = head,
        Size = plateSize,
        StudsOffset = Vector3.new(0, self.lift, 0),
        MaxDistance = self.maxDistance,
        AlwaysOnTop = false, -- walls hide it, so it belongs to the world rather than the screen
        LightInfluence = 0,
        ResetOnSpawn = false,
        Enabled = self.enabled,
        Parent = self.folder,
    })

    local shell = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Parent = gui,
    })
    local scale = w:Create("UIScale", { Scale = 0.8, Parent = shell })

    -- soft outer glow: a wide, faint stroke under the crisp one
    local glow = w:Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = shell })
    w:Create("UICorner", { CornerRadius = UDim.new(0.3, 0), Parent = glow })
    local glowStroke = w:Create("UIStroke", {
        Color = accent,
        Thickness = 4,
        Transparency = 1,
        Parent = glow,
    })

    local card = w:Create("CanvasGroup", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(6, 9, 18),
        BackgroundTransparency = 0.1,
        GroupTransparency = 1,
        BorderSizePixel = 0,
        Parent = shell,
    })
    w:Create("UICorner", { CornerRadius = UDim.new(0.3, 0), Parent = card })

    local backdrop = w:Create("ImageLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Crop,
        ImageTransparency = 0.15,
        Visible = false,
        ZIndex = 1,
        Parent = card,
    })

    -- the left side darkens so the text reads over any backdrop; the right lets the scene show
    local veil = w:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(3, 5, 10),
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = card,
    })
    w:Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.15),
            NumberSequenceKeypoint.new(0.5, 0.5),
            NumberSequenceKeypoint.new(1, 0.9),
        }),
        Parent = veil,
    })

    -- a band of light that sweeps across now and then
    local sweep = w:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.22, 2.4),
        Position = UDim2.fromScale(-0.4, 0.5),
        Rotation = 18,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 3,
        Parent = card,
    })
    w:Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.86),
            NumberSequenceKeypoint.new(1, 1),
        }),
        Parent = sweep,
    })

    -- a hairline of light along the top edge, the way glass catches it
    local rim = w:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.03),
        Size = UDim2.new(0.84, 0, 0, 1),
        BackgroundColor3 = light,
        BorderSizePixel = 0,
        ZIndex = 4,
        Parent = card,
    })
    w:Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.55),
            NumberSequenceKeypoint.new(1, 1),
        }),
        Parent = rim,
    })

    local logo = w:Create("ImageLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.05, 0.5),
        Size = UDim2.fromScale(0.64, 0.64),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 5,
        Parent = card,
    })
    local monogram = w:Create("TextLabel", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.05, 0.5),
        Size = UDim2.fromScale(0.64, 0.64),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        Text = string.sub(self.title, 1, 1),
        TextScaled = true,
        TextColor3 = light,
        FontFace = variables.brandFont(Enum.FontWeight.Heavy),
        ZIndex = 5,
        Parent = card,
    })

    local title = w:Create("TextLabel", {
        Position = UDim2.fromScale(0.27, 0.17),
        Size = UDim2.fromScale(0.68, 0.38),
        BackgroundTransparency = 1,
        Text = self.title,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Color3.fromRGB(248, 250, 252),
        FontFace = variables.brandFont(Enum.FontWeight.Heavy),
        ZIndex = 5,
        Parent = card,
    })
    local subtitle = w:Create("TextLabel", {
        Position = UDim2.fromScale(0.27, 0.58),
        Size = UDim2.fromScale(0.68, 0.24),
        BackgroundTransparency = 1,
        Text = self:_subtitleFor(player),
        RichText = true,
        TextScaled = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextColor3 = Color3.fromRGB(165, 180, 205),
        FontFace = variables.brandFont(Enum.FontWeight.SemiBold),
        ZIndex = 5,
        Parent = card,
    })

    -- the crisp edge, its gradient turning slowly around the card
    local border = w:Create("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = shell })
    w:Create("UICorner", { CornerRadius = UDim.new(0.3, 0), Parent = border })
    local borderStroke = w:Create("UIStroke", {
        Color = Color3.new(1, 1, 1),
        Thickness = 1.6,
        Transparency = 1,
        Parent = border,
    })
    local borderGradient = w:Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, accent),
            ColorSequenceKeypoint.new(0.5, light),
            ColorSequenceKeypoint.new(1, accent),
        }),
        Parent = borderStroke,
    })

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
    entry.subtitle = subtitle
    entry.born = os.clock()
    entry.phase = (player.UserId % 97) / 97 * 10 -- plates side by side don't move in lockstep
    entry.parts = {
        shell = shell,
        scale = scale,
        card = card,
        glowStroke = glowStroke,
        borderStroke = borderStroke,
        borderGradient = borderGradient,
        sweep = sweep,
        logo = logo,
        title = title,
    }
    entry.logo = logo
    entry.monogram = monogram
    entry.backdrop = backdrop
    self:_applyImages(entry)
    self:_step(os.clock())
end

-- Fade a plate out and then remove it. Takes the plate's own fields so a respawn can retire the
-- old plate while the entry moves on to the new one.
function Nameplate:_vanish(plate)
    if not plate.gui then
        return
    end
    if plate.humanoid and plate.nameType and plate.humanoid.Parent then
        plate.humanoid.DisplayDistanceType = plate.nameType
    end
    plate.diedAt = os.clock()
    self._dying = self._dying or {}
    table.insert(self._dying, plate)
    plate.humanoid = nil
end

-- Animation ------------------------------------------------------------------------------------------

local function animate(self, plate, t, alphaCap)
    local parts = plate.parts
    if not parts then
        return
    end
    local p = clamp01((t - plate.born) / appearTime)
    local alpha = outCubic(p) * alphaCap
    local size = 0.8 + 0.2 * outBack(p)

    if plate.diedAt then
        local q = clamp01((t - plate.diedAt) / vanishTime)
        alpha *= 1 - q
        size *= 1 - 0.08 * q
        if q >= 1 then
            return true -- finished: caller removes it
        end
    end

    -- fade with distance, and out of the way in first person
    local camera = variables.workspace.CurrentCamera
    if camera and plate.head and plate.head.Parent then
        local distance = (camera.CFrame.Position - plate.head.Position).Magnitude
        local far = clamp01((distance - self.maxDistance * 0.6) / (self.maxDistance * 0.4))
        local near = clamp01((distance - nearFade) / 2)
        alpha *= (1 - far) * near
    end

    parts.card.GroupTransparency = 1 - alpha
    parts.borderStroke.Transparency = 1 - alpha * 0.8
    parts.glowStroke.Transparency = 1 - alpha * 0.1
    parts.scale.Scale = size

    local phase = t + plate.phase
    plate.gui.StudsOffset = Vector3.new(0, self.lift + math.sin(phase * bobSpeed) * bobHeight, 0)
    parts.borderGradient.Rotation = (phase * 45) % 360
    parts.logo.Rotation = math.sin(phase * 0.7) * 5

    local u = (phase % sweepEvery) / sweepTime
    parts.sweep.Position = UDim2.fromScale(if u < 1 then -0.3 + 1.6 * inOutSine(u) else -0.4, 0.5)
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
    if dying then
        for index = #dying, 1, -1 do
            local plate = dying[index]
            if animate(self, plate, t, cap) then
                table.remove(dying, index)
                self.window:DestroySubtree(plate.gui)
            end
        end
    end
end

-- Check-ins ------------------------------------------------------------------------------------------

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

-- One check-in: tell the relay we're here, take back who else is. Public for scripts (and tests)
-- that want to refresh on their own schedule.
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
            users[id] = { badge = if type(user.badge) == "string" then user.badge else nil }
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
        if self.endpoint or self.transport then
            relayClient.request(self, "DELETE", "/v1/presence", self:_identity())
        end
    end)
end

-- Public -----------------------------------------------------------------------------------------------

-- Show or hide every plate (they fade rather than pop).
function Nameplate:SetEnabled(enabled: boolean)
    self.enabled = enabled ~= false
    for _, plate in self.plates do
        if plate.gui then
            plate.gui.Enabled = true -- the fade drives visibility; Enabled stays on while it runs
        end
    end
end

function Nameplate:SetTitle(title: string)
    self.title = tostring(title)
    for _, plate in self.plates do
        if plate.parts then
            plate.parts.title.Text = self.title
        end
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
