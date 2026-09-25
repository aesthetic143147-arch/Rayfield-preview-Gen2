--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A monospaced block for code or log output. It holds the height it's given and scrolls inside
-- itself, so a console that fills up doesn't push the rest of the page down the screen.
--
-- One label per line, not one label for the whole body: a single auto-sized label inside a
-- fixed-height scroller gets clamped to one viewport, and the canvas then has nothing to
-- scroll. A row each keeps every label short enough that its own height is never the thing
-- being clamped, and the list layout measures the canvas for us.

local Console = {}
Console.__index = Console
Console.__type = "Console"

-- Utility
local utility = script.Parent.Parent.utility

-- Variables
local moveable = require(utility.moveable)
local locale = require(utility.locale)

local defaultHeight = 120
local minHeight = 48
local titleHeight = 24 -- the row the name sits on, when there is one
local padding = 17
local textPadding = 12 -- inside the panel; log output sits close to its edge
local textSize = 12
local lineHeight = 1.25 -- dense, the way a real log reads

-- How many lines the block keeps. Past this the oldest roll off the top, so a console left
-- running all session cant grow without end.
local defaultMaxLines = 200

-- Monospace, so columns line up. Not the brand font: this is output, not copy.
local monoFont = Font.fromEnum(Enum.Font.Code)

function Console.new(tab, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        name = properties.name or properties.Name,
        description = properties.description or properties.Description,

        height = math.max(tonumber(properties.height or properties.Height) or defaultHeight, minHeight),
        -- a log pins itself to the newest line; a code sample stays where you left it
        follow = properties.follow or properties.Follow or false,
        maxLines = math.max(tonumber(properties.maxLines or properties.MaxLines) or defaultMaxLines, 1),

        lines = {},
        -- Pooled and recycled in a ring. Appending at capacity rewrites one label and gives it
        -- the next LayoutOrder, so a line costs the same whether the buffer holds ten or a
        -- thousand - rewriting every row on every append is what makes a console crawl.
        lineLabels = {},
        head = 1, -- the pooled label holding the oldest line
        nextOrder = 1,
        textDirty = true,
    }, Console)

    self:_build()
    self:_setLines(properties.text or properties.Text or "")

    if self.description then
        self.descriptor = require(script.Parent.descriptor).new(self.tab, { description = self.description })
    end

    return self
end

-- The body as one string. Built on demand: joining every line on each append would put an O(n)
-- cost on the one path that has to stay cheap.
function Console:Get(): string
    if self.textDirty then
        self.text = table.concat(self.lines, "\n")
        self.textDirty = false
    end
    return self.text
end

-- Split a body into lines and keep only the newest maxLines of them.
function Console:_setLines(text)
    text = if type(text) == "string" then text else tostring(text)

    table.clear(self.lines)
    if text ~= "" then
        for line in string.gmatch(text .. "\n", "([^\n]*)\n") do
            table.insert(self.lines, line)
        end
    end
    self:_trim()
    self:_flush()
end

-- Drop from the front until the buffer fits. table.move rather than repeated table.remove, so
-- a burst of output doesn't turn into a quadratic shuffle.
function Console:_trim()
    local excess = #self.lines - self.maxLines
    if excess <= 0 then
        return
    end
    table.move(self.lines, excess + 1, #self.lines, 1)
    for index = #self.lines, #self.lines - excess + 1, -1 do
        self.lines[index] = nil
    end
end

-- A row for a line. Created once and then recycled; the pool never exceeds maxLines.
function Console:_makeLabel()
    return self.window:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = monoFont,
        TextSize = textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        LineHeight = lineHeight,
        RichText = false, -- it's output; angle brackets are text, not markup

        -- a line added after the reveal comes in at whatever the rest are already at
        TextTransparency = self._textTransparency or 1,

        Parent = self.scroll,
    }, { TextColor3 = "ContentColor" })
end

-- a blank line still has to take a row, and an empty label collapses to nothing
local function rowText(line: string): string
    return if line == "" then " " else line
end

-- Rebuild every row from the buffer. Only the paths that replace the whole body use this;
-- Append has its own O(1) route below.
function Console:_flush()
    self.textDirty = true

    for index, line in self.lines do
        local label = self.lineLabels[index]
        if not label then
            label = self:_makeLabel()
            self.lineLabels[index] = label
        end
        label.LayoutOrder = index
        label.Text = rowText(line)
        label.Visible = true
    end

    for index = #self.lines + 1, #self.lineLabels do
        self.lineLabels[index].Visible = false
    end

    self.head = 1
    self.nextOrder = #self.lines + 1
    self:_follow()
end

-- One line, one label write. At capacity the oldest row is recycled into the newest position
-- rather than every row shuffling up, so the cost doesn't grow with the buffer.
function Console:_pushLine(line: string)
    self.textDirty = true

    if #self.lines < self.maxLines then
        table.insert(self.lines, line)
        local index = #self.lines
        local label = self.lineLabels[index]
        if not label then
            label = self:_makeLabel()
            self.lineLabels[index] = label
        end
        label.LayoutOrder = self.nextOrder
        label.Text = rowText(line)
        label.Visible = true
        self.nextOrder += 1
        return
    end

    -- full: drop the oldest line and hand its row to the newest one. table.move rather than
    -- table.remove so the shift is one bulk copy instead of a per-element slide.
    table.move(self.lines, 2, #self.lines, 1)
    self.lines[#self.lines] = line

    local label = self.lineLabels[self.head]
    label.LayoutOrder = self.nextOrder
    label.Text = rowText(line)
    label.Visible = true

    self.nextOrder += 1
    self.head = (self.head % #self.lineLabels) + 1
end

function Console:_build()
    local top = if self.name then titleHeight else 0

    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, self.height + top + padding * 2),
        BorderSizePixel = 0,
        Name = self.name or "Console",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),

        -- Animation
        BackgroundTransparency = 1, -- In = 0

        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })

    self.stroke = self.window:StyleElementBody(self.main)

    if self.name then
        self.container = self.window:Create("Frame", {
            Size = UDim2.new(1, -padding * 2, 0, 16),
            Position = UDim2.new(0, padding, 0, padding),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,

            Parent = self.main,
        })

        self.title = self.window:Create("TextLabel", {
            Text = locale.t(self.name),

            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Left,

            -- Animation
            TextTransparency = 1, -- In = 0

            Parent = self.container,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
    end

    -- The inset panel the text scrolls inside. Darker than the element it sits on, the way a
    -- terminal reads against the window around it.
    self.panel = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -padding),
        Size = UDim2.new(1, -padding * 2, 0, self.height),
        BorderSizePixel = 0,
        ClipsDescendants = true,

        BackgroundTransparency = 1, -- In = 0

        Parent = self.main,
    }, { BackgroundColor3 = "StatBackground" })

    self.window:Create("UICorner", {
        Parent = self.panel,
    }, { CornerRadius = "ElementCornerRadius" })

    self.panelStroke = self.window:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,

        -- Animation
        Transparency = 1, -- In = 0.9

        Parent = self.panel,
    }, { Color = "SurfaceStroke" })

    self.scroll = self.window:Create("ScrollingFrame", {
        Size = UDim2.new(1, -textPadding * 2, 1, -textPadding * 2),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,

        Parent = self.panel,
    })

    -- the layout is what measures the canvas, so the rows themselves can stay simple
    self.scrollLayout = self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.scroll,
    })

    self:_watchCanvas()
end

-- Pin to the bottom. Asking for a position past the end is fine: Roblox clamps it to the real
-- maximum, which saves working out the viewport height ourselves.
function Console:_pin()
    local scroll = self.scroll
    if not scroll or not scroll.Parent then
        return
    end
    scroll.CanvasPosition = Vector2.new(0, scroll.AbsoluteCanvasSize.Y)
end

function Console:_follow()
    if not self.follow then
        return
    end
    self:_pin()
    task.defer(function()
        self:_pin()
    end)
end

-- The canvas only settles a frame or two after the rows change, so pinning once on Append is a
-- race. The layout's content size is the thing that actually moves, so follow that instead.
function Console:_watchCanvas()
    self.window:ConnectFor(self, self.scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        if self.follow then
            self:_pin()
        end
    end)
end

-- Replace the whole body.
function Console:Set(text)
    self:_setLines(text)
end

-- Add a line to the end, the way a console does. Once the buffer is full the oldest line rolls
-- off the top, so what you see is always the newest output.
function Console:Append(line)
    line = if type(line) == "string" then line else tostring(line)
    for part in string.gmatch(line .. "\n", "([^\n]*)\n") do
        self:_pushLine(part)
    end
    self:_follow()
end

function Console:Clear()
    table.clear(self.lines)
    self:_flush()
end

-- Put the body on the clipboard, where the executor gives us one. Returns whether it landed.
function Console:Copy(): boolean
    local clipboard = (getgenv and getgenv().setclipboard) or setclipboard
    if typeof(clipboard) ~= "function" then
        return false
    end
    return (pcall(clipboard, self:Get()))
end

-- Change how tall the block stands. The panel takes the height; the element grows around it.
function Console:SetHeight(height)
    self.height = math.max(tonumber(height) or defaultHeight, minHeight)
    local top = if self.name then titleHeight else 0
    self.panel.Size = UDim2.new(1, -padding * 2, 0, self.height)
    self.main.Size = UDim2.new(1, -20, 0, self.height + top + padding * 2)
end

function Console:_setShown(shown, animate)
    local w = self.window

    -- no icon and (usually) no title, so the shared reveal doesn't fit; drive the parts directly
    w:_reveal(self.main, { BackgroundTransparency = if shown then w.theme.ElementTransparency or 0 else 1 }, animate)
    w:_reveal(self.stroke, { Transparency = if shown then w.theme.ElementStrokeTransparency else 1 }, animate)
    w:_reveal(self.panel, { BackgroundTransparency = if shown then 0 else 1 }, animate)
    w:_reveal(self.panelStroke, { Transparency = if shown then 0.9 else 1 }, animate)

    self._textTransparency = if shown then 0.15 else 1
    for _, label in self.lineLabels do
        w:_reveal(label, { TextTransparency = self._textTransparency }, animate)
    end

    if self.title then
        w:_reveal(self.title, { TextTransparency = if shown then 0 else 1 }, animate)
    end
    if self.descriptor then
        w:_reveal(self.descriptor.titleLabel, { TextTransparency = if shown then 0.7 else 1 }, animate)
    end
end

function Console:Remove()
    if self.descriptor then
        self.descriptor:Remove()
    end
    self.main:Destroy()
end

moveable(Console)

return Console
