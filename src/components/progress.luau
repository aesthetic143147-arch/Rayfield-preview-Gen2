--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A progress bar: a title with a readout beside it and a filled track underneath. Read-only,
-- so it carries no flag and saves nothing. It takes a range the way the slider does, and it
-- borrows the slider's track wholesale - same SliderBackground, same SliderProgress fill, same
-- accent glow - so the two read as one family and a theme for one already fits the other.

local Progress = {}
Progress.__index = Progress
Progress.__type = "Progress"

-- Utility
local utility = script.Parent.Parent.utility

-- Variables
local variables = require(utility.variables)
local functions = require(utility.functions)
local moveable = require(utility.moveable)
local locale = require(utility.locale)

local rowHeight = 60
local trackHeight = 8
local inset = 20 -- left and right, matching the other elements' content inset

-- Stepped bars run a little thinner than a continuous one, so a row of them doesn't read as
-- heavy as a single solid track.
local stepHeight = 6
local stepGap = 6

local titleSize = 16
local readoutSize = 14
local readoutTransparency = 0.4

local fillInfo = TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

-- The slider's fill gradient, so a filled track looks the same in both elements.
local fillTransparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(1, 0),
})

-- The waiting sweep: the fill grows out from the left edge and empties back into it, over and
-- over. Roblox repeats and reverses it natively, so there is no loop of ours to run, nothing to
-- cancel by hand, and nothing left running once the window goes. It also never leaves the
-- track, so the fill's rounded ends are never clipped square against the track's own corner.
local sweepSeconds = 0.9
local sweepInfo = TweenInfo.new(sweepSeconds, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, -1, true)

local function finite(value: unknown): number?
    local number = tonumber(value)
    if number == nil or number ~= number or math.abs(number) == math.huge then
        return nil
    end
    return number
end

function Progress.new(tab, properties)
    properties = if typeof(properties) == "table" then properties else {}

    -- steps: the track becomes that many segments, and unless a range says otherwise the value
    -- counts them, so Set(3) on a 5-step bar means three done.
    local steps = finite(properties.steps or properties.Steps)
    steps = if steps and steps >= 2 then math.floor(steps) else nil

    local range = properties.range or properties.Range
    local min = finite(range and range[1]) or 0
    local max = finite(range and range[2]) or steps or 1
    if min > max then
        min, max = max, min
    end

    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        name = properties.name or properties.Name or "Progress",
        icon = properties.icon or properties.Icon,
        description = properties.description or properties.Description,

        min = min,
        max = max,
        steps = steps,
        value = 0, -- settled by the Set below, once the range is in place

        -- a readout of your own, or a formatter for it; without either it's a percentage
        text = properties.text or properties.Text,
        format = properties.format or properties.Format,
        showValue = if properties.showValue == nil then true else properties.showValue == true,
        indeterminate = properties.indeterminate or properties.Indeterminate or false,
    }, Progress)

    self.value = self:_clamp(finite(properties.value or properties.Value) or min)

    self:_build()

    if self.description then
        self.descriptor = require(script.Parent.descriptor).new(self.tab, { description = self.description })
    end

    return self
end

function Progress:_clamp(value: number): number
    return math.clamp(finite(value) or self.min, self.min, self.max)
end

-- Where the value sits in its range, 0 to 1. An empty range is a full bar, not a divide by zero.
function Progress:_ratio(): number
    local span = self.max - self.min
    if span <= 0 then
        return 1
    end
    return (self.value - self.min) / span
end

-- How many segments are filled at the current value.
function Progress:_filledSteps(): number
    local count = self.steps :: number
    return math.clamp(math.round(self:_ratio() * count), 0, count)
end

function Progress:_readout(): string
    if self.text then
        return locale.resolve(self.text)
    end
    if self.format then
        local ok, formatted = pcall(self.format, self.value, self.min, self.max)
        if ok and type(formatted) == "string" then
            return formatted
        end
    end
    -- a stepped bar counts its stages; a continuous one is a percentage
    if self.steps then
        return string.format("%d/%d", self:_filledSteps(), self.steps)
    end
    return string.format("%d%%", math.round(self:_ratio() * 100))
end

function Progress:_build()
    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, rowHeight),
        BorderSizePixel = 0,
        Name = self.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),

        -- Animation
        BackgroundTransparency = 1, -- In = 0

        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })

    self.stroke = self.window:StyleElementBody(self.main)

    -- Title row: name left, readout hard right, both centred on the same line
    self.container = self.window:Create("Frame", {
        Size = UDim2.new(0, 170, 0, titleSize),
        Position = UDim2.new(0, inset, 0, 20),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.container,
    })

    if self.icon then
        self.iconLabel = self.window:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,

            -- Animation
            ImageTransparency = 1, -- In = 0

            Parent = self.container,
        }, { ImageColor3 = "ContentColor" })
    end

    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.name),

        Size = UDim2.fromOffset(250, titleSize),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = titleSize,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,

        -- Animation
        TextTransparency = 1, -- In = 0

        Parent = self.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    self.readout = self.window:Create("TextLabel", {
        Text = self:_readout(),

        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -inset, 0, 20),
        Size = UDim2.fromOffset(50, readoutSize),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = readoutSize,
        TextXAlignment = Enum.TextXAlignment.Right,
        Visible = self.showValue,

        -- Animation
        TextTransparency = 1, -- In = readoutTransparency

        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    if self.steps then
        self:_buildSteps()
        return
    end

    -- Track, sized and coloured exactly like the slider's. No ClipsDescendants: the fill is
    -- kept inside the track by its own geometry instead, so its rounded ends stay round -
    -- a rectangular clip would square them off against the track's rounded corner.
    self.track = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -16),
        Size = UDim2.new(1, -inset * 2, 0, trackHeight),
        BorderSizePixel = 0,

        BackgroundTransparency = 1, -- In = 0

        Parent = self.main,
    }, { BackgroundColor3 = "SliderBackground" })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),

        Parent = self.track,
    })

    self.fill = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(if self.indeterminate then 0 else self:_ratio(), 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,

        BackgroundTransparency = 1, -- In = 0

        Parent = self.track,
    })

    self.window:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),

        Parent = self.fill,
    })

    self.window:Create("UIGradient", {
        Offset = Vector2.new(0, 0.5),
        Rotation = 2,
        Transparency = fillTransparency,

        Parent = self.fill,
    }, { Color = { "SliderProgress", functions.toColorSequence } })

    self.fillGlow = self.window:CreateGlow(self.fill, "AccentColor", 20, 1)

    if self.indeterminate then
        self:_startSweep()
    end
end

-- A row of segments in place of the track. Each fills whole, so the bar reads as a count of
-- stages rather than a distance travelled.
function Progress:_buildSteps()
    local count = self.steps :: number

    self.track = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -17),
        Size = UDim2.new(1, -inset * 2, 0, stepHeight),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = self.main,
    })

    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, stepGap),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.track,
    })

    self.stepFrames = {}
    for index = 1, count do
        -- the scale share, less this segment's cut of the gaps, so the row lands exactly full
        local segment = self.window:Create("Frame", {
            Size = UDim2.new(1 / count, -(stepGap * (count - 1)) / count, 1, 0),
            BorderSizePixel = 0,
            LayoutOrder = index,
            -- no literal colour: Create applies the theme first and plain properties second, so
            -- a white here would paint straight over SliderBackground and the empty segments
            -- would read white in every theme

            BackgroundTransparency = 1, -- In = 0

            Parent = self.track,
        }, { BackgroundColor3 = "SliderBackground" })

        self.window:Create("UICorner", {
            CornerRadius = UDim.new(1, 0),

            Parent = segment,
        })

        -- the filled face, laid over the empty one and faded in once its stage is reached
        local fill = self.window:Create("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            ZIndex = 2,

            BackgroundTransparency = 1, -- In = 0 once this stage is reached

            Parent = segment,
        })

        self.window:Create("UICorner", {
            CornerRadius = UDim.new(1, 0),

            Parent = fill,
        })

        -- no transparency ramp here: the slider fades its fill in over a long track, but across
        -- a segment this short the same ramp just washes it out to white
        self.window:Create("UIGradient", {
            Rotation = 90,

            Parent = fill,
        }, { Color = { "SliderProgress", functions.toColorSequence } })

        table.insert(self.stepFrames, { segment = segment, fill = fill })
    end
end

-- With no value to show, the fill grows from the left edge and empties back into it.
function Progress:_startSweep()
    if self._sweep or self.steps then
        return -- already sweeping, and a row of stages has nothing to sweep
    end

    self.fill.AnchorPoint = Vector2.new(0, 0.5)
    self.fill.Position = UDim2.fromScale(0, 0.5)
    self.fill.Size = UDim2.fromScale(0, 1)

    self._sweep = variables.tweenService:Create(self.fill, sweepInfo, { Size = UDim2.fromScale(1, 1) })
    self._sweep:Play()
end

function Progress:_stopSweep()
    if not self._sweep then
        return
    end
    self._sweep:Cancel()
    self._sweep = nil
    self.fill.AnchorPoint = Vector2.new(0, 0.5)
    self.fill.Position = UDim2.fromScale(0, 0.5)
end

function Progress:_render(animate: boolean?)
    self.readout.Text = self:_readout()

    if self.steps then
        -- while hidden every face is transparent; _setShown paints the right ones on the way in
        if not self._shown then
            return
        end
        local filled = self:_filledSteps()
        for index, step in self.stepFrames do
            local target = if index <= filled then 0 else 1
            if animate == false then
                step.fill.BackgroundTransparency = target
            else
                variables.tweenService:Create(step.fill, fillInfo, { BackgroundTransparency = target }):Play()
            end
        end
        return
    end

    local size = UDim2.fromScale(self:_ratio(), 1)
    if animate == false then
        self.fill.Size = size
    else
        variables.tweenService:Create(self.fill, fillInfo, { Size = size }):Play()
    end
end

-- Set the value. Outside the range it's clamped; anything that isn't a number reads as the floor.
function Progress:Set(value)
    self.value = self:_clamp(value)

    if self.indeterminate then
        self.indeterminate = false
        self:_stopSweep()
    end

    self:_render()
end

function Progress:Get(): number
    return self.value
end

-- Where the value sits in its range, 0 to 1.
function Progress:GetPercentage(): number
    return self:_ratio()
end

-- Move the range. The value comes with it, clamped into whatever the new range allows.
function Progress:SetRange(min, max)
    min = finite(min) or self.min
    max = finite(max) or self.max
    if min > max then
        min, max = max, min
    end

    self.min, self.max = min, max
    self.value = self:_clamp(self.value)
    self:_render()
end

-- Replace the readout with your own line, or pass nil to go back to the formatter/percentage.
function Progress:SetText(text)
    self.text = text
    self.readout.Text = self:_readout()
end

-- Swap between a real value and the waiting sweep.
function Progress:SetIndeterminate(state)
    state = state == true
    if state == self.indeterminate then
        return
    end
    self.indeterminate = state

    if state then
        self:_startSweep()
    else
        self:_stopSweep()
        self:_render(false)
    end
end

function Progress:_setShown(shown, animate)
    local w = self.window

    self._shown = shown
    w:_reveal(self.readout, { TextTransparency = if shown then readoutTransparency else 1 }, animate)

    if shown then
        w:_revealCommon(self, animate)
    else
        w:_hideCommon(self, animate)
    end

    if self.steps then
        local filled = self:_filledSteps()
        for index, step in self.stepFrames do
            w:_reveal(step.segment, { BackgroundTransparency = if shown then 0 else 1 }, animate)
            w:_reveal(step.fill, { BackgroundTransparency = if shown and index <= filled then 0 else 1 }, animate)
        end
        return
    end

    w:_reveal(self.track, { BackgroundTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.fill, { BackgroundTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.fillGlow, { Transparency = if shown then w.theme.AccentGlow else 1 }, animate)
end

function Progress:Remove()
    self:_stopSweep()
    if self.descriptor then
        self.descriptor:Remove()
    end
    self.main:Destroy()
end

moveable(Progress)

return Progress
