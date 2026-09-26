--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local Column = {}
Column.__index = Column
Column.__type = "Column"

-- One of the two columns every tab lays its page out in. It takes every element a tab takes, and
-- builds them exactly the way a tab does: it offers the same fields the elements read off their
-- host (window, tabPage, elements, forgetState, compact, direction, _moveElement), so the same
-- element code runs here untouched.
--
-- Each column keeps its own element list, which is the order its elements sit in and what
-- MoveUp/MoveDown work against. Every element is also filed on the owning tab, because the
-- window reveals, fades, themes and searches a page by walking tab.elements.

local assignOrder = require(script.Parent.Parent.utility.ordering)

-- the same gap the tab page puts between its elements, so a column reads like a page
local elementPadding = 7

function Column.new(tab, side)
    local self = setmetatable({
        tab = assert(tab, "Missing argument #1 (Tab expected)"),
        window = tab.window,
        side = side,
        name = side,
        forgetState = tab.forgetState, -- the settings tab keeps everything out of the config
        compact = false, -- full-width builds, the way a tab page builds them
        direction = Enum.FillDirection.Vertical,
        elements = {},
    }, Column)

    self.main = self.window:Create("Frame", {
        Name = side,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(0.5, 0),
        LayoutOrder = if side == "Left" then 1 else 2,
        -- an unused column takes no room, so the other one gets the page to itself
        Visible = false,

        Parent = tab.columnsRow,
    })

    self.layout = self.window:Create("UIListLayout", {
        Padding = UDim.new(0, elementPadding),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.main,
    })

    -- elements parent here. The scrolling page is still the tab's: the dropdown scrolls it to
    -- bring an open list into view.
    self.tabPage = self.main
    self.scrollPage = tab.tabPage

    return self
end

-- The tail every CreateX shares, the column version of Tab:_register: order it, file it on the
-- tab for the window's page walks, restore its saved value, and reveal it if the window is open.
function Column:_register(element)
    table.insert(self.elements, element)
    assignOrder(element, #self.elements * 10)
    table.insert(self.tab.elements, element)

    self.window:_restoreLate(element)

    if not self.window.hidden then
        element:_setShown(true, true)
    end

    self.tab:_layoutColumns()

    return element
end

-- Button
function Column:CreateButton(properties)
    return self:_register(require(script.Parent.button).new(self, properties))
end

-- Switch/Toggle
function Column:CreateToggle(properties)
    return self:_register(require(script.Parent.toggle).new(self, properties))
end

function Column:CreateSwitch(properties)
    return self:CreateToggle(properties)
end

-- Section, the heading over the elements that follow it in this column
function Column:CreateSection(properties)
    return self:_register(require(script.Parent.section).new(self, properties))
end

-- Text (a title, a body, or both)
function Column:CreateText(properties)
    return self:_register(require(script.Parent.text).new(self, properties))
end

-- Divider
function Column:CreateDivider(properties)
    return self:_register(require(script.Parent.divider).new(self, properties))
end

-- Stat
function Column:CreateStat(properties)
    return self:_register(require(script.Parent.stat).new(self, properties))
end

-- Progress bar
function Column:CreateProgress(properties)
    return self:_register(require(script.Parent.progress).new(self, properties))
end

-- Console / code block
function Column:CreateConsole(properties)
    return self:_register(require(script.Parent.console).new(self, properties))
end

-- Chat, backed by a Discord channel through a relay
function Column:CreateChat(properties)
    return self:_register(require(script.Parent.chat).new(self, properties))
end

-- Slider
function Column:CreateSlider(properties)
    return self:_register(require(script.Parent.slider).new(self, properties))
end

-- Dropdown
function Column:CreateDropdown(properties)
    return self:_register(require(script.Parent.dropdown).new(self, properties))
end

-- Input
function Column:CreateInput(properties)
    return self:_register(require(script.Parent.input).new(self, properties))
end

-- Keybind
function Column:CreateKeybind(properties)
    return self:_register(require(script.Parent.keybind).new(self, properties))
end

-- Color picker
function Column:CreateColorPicker(properties)
    return self:_register(require(script.Parent.colorpicker).new(self, properties))
end

-- Group (layout container). A row that wraps by default; pass direction="column" for a column
-- inside this column. Add elements via group:CreateX.
function Column:CreateGroup(properties)
    return self:_register(require(script.Parent.group).new(self, properties))
end

-- Drop an element that removed itself, from this column's order and from the tab's walks, and
-- give the room back if it was the column's last one.
function Column:_forget(element)
    local idx = table.find(self.elements, element)
    if idx then
        table.remove(self.elements, idx)
        for i, el in self.elements do
            assignOrder(el, i * 10)
        end
    end

    local tabIdx = table.find(self.tab.elements, element)
    if tabIdx then
        table.remove(self.tab.elements, tabIdx)
    end

    self.window:_unregisterControl(element)
    -- its own connections go with it rather than waiting for Unload
    if element.connections then
        self.window:DisconnectMany(element, element.connections)
        element.connections = nil
    end
    self.tab:_layoutColumns()
end

-- Reorder an element within this column. The tab's list isn't an order anything is laid out
-- by, so it's left alone.
function Column:_moveElement(element, targetIndex)
    local idx = table.find(self.elements, element)
    if not idx then
        return
    end
    table.remove(self.elements, idx)
    targetIndex = math.clamp(targetIndex, 1, #self.elements + 1)
    table.insert(self.elements, targetIndex, element)
    for i, el in self.elements do
        assignOrder(el, i * 10)
    end
end

return Column
