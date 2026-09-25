--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- A heading in the sidebar rail, grouping the tab rows under it. Same shape and props as the
-- section in a tab's element list, so a dev who has used one already knows this one.
--
-- The rail only exists in the sidebar layout, so this builds nothing under the top strip.

local TabSection = {}
TabSection.__index = TabSection
TabSection.__type = "TabSection"

local locale = require(script.Parent.Parent.utility.locale)
local log = require(script.Parent.Parent.utility.log)

-- Sections sit further in than the rows they label, so the heading reads as a heading rather
-- than a row that lost its pill. Rows inset by layout.rowInset a side, these by this.
local sectionInset = 20

-- Clearance above a section that follows something. The rail's own list spacing already
-- separates it from the row above; this is the extra that makes it read as a new group.
local spacingAbove = 6

-- And under every section, so the first row beneath it isn't sat tight against the heading.
local spacingBelow = 3

-- Whether anything is already sitting above this one in the rail. The settings tab never gets
-- a row, so it doesn't count, and a section that follows only another section still does.
local function anythingAbove(window)
    for _, tab in window.tabs do
        if not tab.neglectSelector then
            return true
        end
    end
    return #window.tabSections > 0
end

function TabSection.new(window, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        window = assert(window, "Missing argument #1 (Window expected)"),
        name = properties.name or properties.Name or "Section",
        icon = properties.icon or properties.Icon,
    }, TabSection)

    -- the top strip has no rail to head, so there's nowhere to put this. say so once and hand
    -- back a handle that does nothing, rather than half-building something invisible.
    if window.layout.mode ~= "sidebar" then
        if not window._warnedTabSection then
            window._warnedTabSection = true
            log.warn("Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.")
        end
        self.inert = true
        return self
    end

    -- height comes from the content and the padding, not a number picked to match them
    self.main = window:Create("Frame", {
        Name = self.name,
        Size = UDim2.new(1, -sectionInset * 2, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Visible = false, -- In = true

        Parent = window.tabList,
    })

    self.padding = window:Create("UIPadding", {
        PaddingTop = UDim.new(0, if anythingAbove(window) then spacingAbove else 0),
        PaddingBottom = UDim.new(0, spacingBelow),

        Parent = self.main,
    })

    window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,

        Parent = self.main,
    })

    if self.icon then
        self.iconLabel = window:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 0,

            -- Animation
            ImageTransparency = 1, -- In = 0.65

            Parent = self.main,
        }, { ImageColor3 = "ContentColor" })
    end

    self.title = window:Create("TextLabel", {
        Text = locale.t(self.name),

        Size = UDim2.fromOffset(0, 15),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        TextWrapped = true,
        LayoutOrder = 1,

        -- Animation
        TextTransparency = 1, -- In = 0.6

        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })

    return self
end

-- Fade with the rows around it. Visible is left alone here, the same way a row's is, so a
-- collapse can fade the rail out before it stops drawing it.
function TabSection:_setShown(shown, animate)
    if not self.main then
        return -- never built (top strip), or already removed
    end
    local w = self.window
    w:_reveal(self.title, { TextTransparency = if shown then 0.6 else 1 }, animate)
    if self.iconLabel then
        w:_reveal(self.iconLabel, { ImageTransparency = if shown then 0.65 else 1 }, animate)
    end
end

function TabSection:_setVisible(visible)
    if self.main then
        self.main.Visible = visible
    end
end

function TabSection:Remove()
    local index = table.find(self.window.tabSections, self)
    if index then
        table.remove(self.window.tabSections, index)
    end
    self.window:DestroySubtree(self.main)
    self.main = nil
end

return TabSection
