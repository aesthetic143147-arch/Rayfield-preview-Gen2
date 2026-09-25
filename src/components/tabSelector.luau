--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- The thing you click to change tab. A pill in the top strip, a row in the sidebar rail -
-- different shapes, same parts under the same names, so Tab drives either one without knowing
-- which it built. Both read TabBackground/TabStroke/TabColor, so a theme written for one
-- layout already fits the other.

local utility = script.Parent.Parent.utility
local variables = require(utility.variables)
local functions = require(utility.functions)
local locale = require(utility.locale)

local tabSelector = {}

-- A tab needs a name or an icon, not both, so an icon rail has to have something to show for a
-- tab that only has a name. Its first letter stands in - the same thing an avatar or a
-- workspace switcher falls back to. utf8, not string.sub: a name can start with a multi-byte
-- character and half of one renders as nothing.
local function initialOf(name: string?): string
    if type(name) ~= "string" or name == "" then
        return "?"
    end
    local afterFirst = utf8.offset(name, 2)
    local first = if afterFirst then string.sub(name, 1, afterFirst - 1) else name
    return string.upper(first)
end

-- Transparencies per state. The gradients stay put; selection is only ever transparency. A
-- state with no shadow entry leaves the shadow alone, which is how the pill (which has none)
-- and the rail row (which does) share one apply path.
tabSelector.states = {
    top = {
        selected = { background = 0, stroke = 0, content = 0 },
        hover = { background = 0.4, stroke = 0.3, content = 0.3 },
        unselected = { background = 0.8, stroke = 0.65, content = 0.5 },
        hidden = { background = 1, stroke = 1, content = 1 },
    },
    -- the rail row sits on the window rather than on a strip, so its selected fill is lighter
    -- and an unselected row is bare text. Ported from RF2-Sidebar.Window.Sidebar.Options.
    sidebar = {
        selected = { background = 0.4, stroke = 0.5, content = 0, shadow = 0.8 },
        hover = { background = 0.7, stroke = 0.8, content = 0.3, shadow = 1 },
        unselected = { background = 1, stroke = 1, content = 0.5, shadow = 1 },
        hidden = { background = 1, stroke = 1, content = 1, shadow = 1 },
    },
}

-- Fill + stroke gradients, identical on both shapes. Split out so neither builder restates it.
local function addGradients(tab, host, stroke)
    tab.topbarItemGradient = tab.window:Create("UIGradient", {
        Rotation = 90,

        Parent = host,
    }, { Color = { "TabBackground", functions.toColorSequence } })

    tab.topbarItemStrokeGradient = tab.window:Create("UIGradient", {
        Rotation = 90,

        Parent = stroke,
    }, { Color = { "TabStroke", functions.toColorSequence } })
end

local function addContent(tab, iconSize, withInitial)
    -- stands in for the icon while the rail is collapsed; hidden the rest of the time. Only the
    -- rail ever collapses, so the pill has no use for one.
    if withInitial and not tab.icon then
        tab.topbarItemInitial = tab.window:Create("TextLabel", {
            Text = initialOf(tab.name),

            Size = UDim2.fromOffset(iconSize, iconSize),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = iconSize - 4,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            Visible = false,

            -- Animation
            TextTransparency = 1, -- In = 0 / 0.5

            Parent = tab.topbarItemContainer,
        }, { TextColor3 = "TabColor", FontFace = "Font" })
    end

    if tab.icon then
        tab.topbarItemIcon = tab.window:Create("ImageLabel", {
            -- Configurables
            -- raw value: Create routes Image through image.resolve, which already handles
            -- numbers and rbxassetid strings (concat here would double the prefix)
            Image = tab.icon,

            Size = UDim2.fromOffset(iconSize, iconSize),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,

            -- Animation
            ImageTransparency = 1, -- In = 0 / 0.5

            Parent = tab.topbarItemContainer,
        }, { ImageColor3 = "TabColor" })
    end

    if tab.name then
        tab.topbarItemTitle = tab.window:Create("TextLabel", {
            -- Configurables
            Text = locale.t(tab.name), -- tab name

            Size = UDim2.fromOffset(0, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = 16,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            LayoutOrder = 1,

            -- Animation
            TextTransparency = 1, -- In = 0 / 0.5

            Parent = tab.topbarItemContainer,
        }, { TextColor3 = "TabColor", FontFace = "Font" })
    end
end

-- A pill in the horizontal strip: hugs its own content and grows with the label.
local function buildPill(tab)
    tab.topbarItem = tab.window:Create("Frame", {
        Name = tab.name,
        Size = UDim2.fromOffset(0, 34), -- min size, grows with content
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,

        -- Animation
        BackgroundTransparency = 1, -- In = 0 / 0.8
        Visible = false, -- In = true

        LayoutOrder = tab.customOrder or 0,

        Parent = tab.window.tabList,
    })

    tab.topbarItemInteract = tab.window:Create("TextButton", {
        Active = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,

        Parent = tab.topbarItem,
    })

    tab.window:Create("UICorner", {
        Parent = tab.topbarItem,
    }, { CornerRadius = "PillCornerRadius" })

    tab.topbarItemStroke = tab.window:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),

        -- Animation
        Transparency = 1, -- In = 0 / 0.5

        Parent = tab.topbarItem,
    })

    addGradients(tab, tab.topbarItem, tab.topbarItemStroke)

    tab.topbarItemContainer = tab.window:Create("Frame", {
        Size = UDim2.fromOffset(0, 34),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = tab.topbarItem,
    })

    tab.window:Create("UIPadding", {
        PaddingLeft = UDim.new(0, 13),
        PaddingRight = UDim.new(0, 14),

        Parent = tab.topbarItemContainer,
    })

    tab.topbarItemLayout = tab.window:Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = tab.topbarItemContainer,
    })

    addContent(tab, 16, false)
end

-- A row in the sidebar rail: the width of the rail, icon then label, left aligned.
local function buildRow(tab, layout)
    tab.topbarItem = tab.window:Create("Frame", {
        Name = tab.name,
        Size = UDim2.new(1, -layout.rowInset * 2, 0, layout.rowHeight),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,

        -- Animation
        BackgroundTransparency = 1, -- In = 0.4 / 1
        Visible = false, -- In = true

        LayoutOrder = tab.customOrder or 0,

        Parent = tab.window.tabList,
    })

    tab.topbarItemInteract = tab.window:Create("TextButton", {
        Active = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,

        Parent = tab.topbarItem,
    })

    tab.window:Create("UICorner", {
        CornerRadius = UDim.new(0, layout.rowCornerRadius),

        Parent = tab.topbarItem,
    })

    tab.topbarItemStroke = tab.window:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),

        -- Animation
        Transparency = 1, -- In = 0.5

        Parent = tab.topbarItem,
    })

    addGradients(tab, tab.topbarItem, tab.topbarItemStroke)

    -- lifts the selected row off the rail. Offset upward so the light reads as coming from
    -- above, the same direction the window's own shadow falls, and the spread pulls the glow
    -- wide and shallow so it hugs the row rather than pooling under it.
    tab.topbarItemShadow = tab.window:Create("UIShadow", {
        BlurRadius = UDim.new(0, 20),
        Color = Color3.fromRGB(255, 255, 255),
        Offset = UDim2.new(0, 0, 0, -15),
        Spread = UDim2.new(0, 10, 0, -30),
        ZIndex = -1,

        -- Animation
        Transparency = 1, -- In = 0.8

        Parent = tab.topbarItem,
    })

    tab.topbarItemContainer = tab.window:Create("Frame", {
        Size = UDim2.new(1, -layout.rowPadding, 0, 24),
        Position = UDim2.new(0, layout.rowPadding, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,

        Parent = tab.topbarItem,
    })

    tab.topbarItemLayout = tab.window:Create("UIListLayout", {
        Padding = UDim.new(0, layout.rowContentSpacing),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = tab.topbarItemContainer,
    })

    addContent(tab, layout.rowIconSize, true)
end

function tabSelector.build(tab, layout)
    if layout.mode == "sidebar" then
        buildRow(tab, layout)
    else
        buildPill(tab)
    end
end

-- Drop the row's label so the rail reads as icons only, or put it back. Snaps rather than
-- tweens: this follows a window resize, which snaps too, so animating it would only ever
-- trail the edge it is meant to sit inside.
function tabSelector.setRowCollapsed(tab, collapsed, layout)
    if layout.mode ~= "sidebar" or not tab.topbarItem then
        return
    end

    if tab.topbarItemTitle then
        tab.topbarItemTitle.Visible = not collapsed
    end
    -- a tab with no icon shows its initial in the icon's place, so the row is never blank
    if tab.topbarItemInitial then
        tab.topbarItemInitial.Visible = collapsed
    end
    local inset = if collapsed then 0 else layout.rowPadding
    tab.topbarItemContainer.Size = UDim2.new(1, -inset, 0, 24)
    tab.topbarItemContainer.Position = UDim2.new(0, inset, 0.5, 0)
    tab.topbarItemLayout.HorizontalAlignment = if collapsed
        then Enum.HorizontalAlignment.Center
        else Enum.HorizontalAlignment.Left
end

-- Apply one state's transparencies to whatever parts this selector actually has.
function tabSelector.applyVisual(tab, state, tweenInfo)
    local targets = {
        [tab.topbarItem] = { BackgroundTransparency = state.background },
        [tab.topbarItemStroke] = { Transparency = state.stroke },
    }

    if tab.topbarItemIcon then
        targets[tab.topbarItemIcon] = { ImageTransparency = state.content }
    end
    if tab.topbarItemTitle then
        targets[tab.topbarItemTitle] = { TextTransparency = state.content }
    end
    if tab.topbarItemInitial then
        targets[tab.topbarItemInitial] = { TextTransparency = state.content }
    end
    if tab.topbarItemShadow and state.shadow then
        targets[tab.topbarItemShadow] = { Transparency = state.shadow }
    end

    for instance, properties in targets do
        if tweenInfo then
            variables.tweenService:Create(instance, tweenInfo, properties):Play()
        else
            for property, value in properties do
                instance[property] = value
            end
        end
    end
end

return tabSelector
