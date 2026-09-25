--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- The sidebar layout's rail: a scrolling column of tab rows down the left, with the signed-in
-- player at its base. The rail owns its own width, so it also sizes what that width displaces -
-- the content card and the fade over it. Values ported from RF2-Sidebar.Window.Sidebar.

local utility = script.Parent.Parent.utility
local variables = require(utility.variables)
local image = require(utility.image)
local locale = require(utility.locale)
local tabSelector = require(script.Parent.tabSelector)
local search = require(script.Parent.search)

local sidebar = {}

-- The profile line's resting brightness, matching the topbar's title over subtitle.
local nameTransparency = 0
local subtitleTransparency = 0.7
local avatarPlateTransparency = 0.95

-- Settling the profile in or out from the settings switch. Quint Out, like every other
-- settle in the window.
local settleInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

-- Whether this window has a profile block to show at all: sidebar layout, a real player, and
-- the user hasn't turned it off.
local function profileVisible(window)
    return window.layout.mode == "sidebar"
        and window.profile ~= nil
        and window.settings.showProfile
        and variables.localPlayer ~= nil
end

local function buildProfile(window, layout)
    local player = variables.localPlayer
    if not player then
        return -- no player to show (Studio server view, or a headless run)
    end

    window.profile = window:Create("Frame", {
        Name = "Profile",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, layout.footerHeight),
        BackgroundTransparency = 1,

        Parent = window.sidebar,
    })

    window.profileContainer = window:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, layout.rowInset, 0.5, 0),
        Size = UDim2.new(1, -layout.rowInset, 1, 0),
        BackgroundTransparency = 1,

        Parent = window.profile,
    })

    window.profileLayout = window:Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = window.profileContainer,
    })

    -- headshots resolve to a local getcustomasset file in secure mode, fetched async, so it can
    -- land after this builds - hence the onReady that fills it in once it's there
    window.profileAvatar = window:Create("ImageLabel", {
        Name = "Avatar",
        Image = image.avatar(player.UserId, function(uri)
            if window.profileAvatar and not window.unloaded then
                image.assign(window.profileAvatar, "Image", uri)
            end
        end),
        Size = UDim2.fromOffset(layout.avatarSize, layout.avatarSize),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,

        -- Animation
        BackgroundTransparency = 1, -- In = 0.95
        ImageTransparency = 1, -- In = 0

        Parent = window.profileContainer,
    })

    window:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),

        Parent = window.profileAvatar,
    })

    window.profileLabels = window:Create("Frame", {
        Size = UDim2.fromOffset(50, layout.avatarSize),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        LayoutOrder = 1,

        Parent = window.profileContainer,
    })

    window:Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = window.profileLabels,
    })

    window.profileName = window:Create("TextLabel", {
        Text = player.DisplayName,
        Size = UDim2.fromOffset(50, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,

        -- Animation
        TextTransparency = 1, -- In = 0

        Parent = window.profileLabels,
    }, { TextColor3 = "TitlingColor", FontFace = "Font" })

    -- The dev's line under the name. Nothing set means the name stands on its own rather than
    -- inventing a second line to fill the space.
    window.profileSubtitle = window:Create("TextLabel", {
        Text = "",
        Size = UDim2.fromOffset(50, 14),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        Visible = false,

        -- Animation
        TextTransparency = 1, -- In = 0.7

        Parent = window.profileLabels,
    }, { TextColor3 = "TitlingColor", FontFace = "Font" })
end

-- Build the rail and hand back the scrolling frame the tab rows live in. The window keeps it
-- as `tabList`, the same name the top strip uses, so everything downstream is layout-blind.
function sidebar.build(window, layout)
    window.sidebar = window:Create("Frame", {
        Name = "Sidebar",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(0, layout.railWidth, 1, -layout.chromeHeight),
        BackgroundTransparency = 1,

        Visible = false, -- In = true

        Parent = window.main,
    })

    window.tabList = window:Create("ScrollingFrame", {
        Name = "Tabs",
        Active = true,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollBarImageTransparency = 1,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ClipsDescendants = true,

        Parent = window.sidebar,
    })

    -- the scroller clips, and the selected row's stroke and glow reach past its own box, so
    -- the column is inset the way a tab page insets its elements
    window:Create("UIPadding", {
        PaddingTop = UDim.new(0, layout.railPadding),
        PaddingBottom = UDim.new(0, layout.railPadding),

        Parent = window.tabList,
    })

    window.tabListLayout = window:Create("UIListLayout", {
        Padding = UDim.new(0, layout.rowSpacing),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = window.tabList,
    })

    buildProfile(window, layout)
    sidebar.reflowProfile(window)
end

-- Give the rows back the height the profile isn't using (and vice versa), so a hidden profile
-- leaves no dead strip at the base of the rail.
function sidebar.reflowProfile(window)
    local layout = window.layout
    local shown = profileVisible(window)

    if window.profile then
        window.profile.Visible = shown
    end
    window.tabList.Size = UDim2.new(1, 0, 1, if shown then -layout.footerHeight else 0)
end

-- Take the rail's width, and size what it displaces with it. The card and its fade start where
-- the rail ends, so all three move together or the seam shows.
function sidebar.applyWidth(window, width)
    local layout = window.layout

    window.sidebar.Size = UDim2.new(0, width, 1, -layout.chromeHeight)
    window.elements.Size = UDim2.new(1, -width, 1, -layout.chromeHeight)
    window.bottomFade.Size = UDim2.new(1, -width, layout.fadeSize.Y.Scale, layout.fadeSize.Y.Offset)
    search.railWidth(window, width)

    local collapsed = width < (layout.railWidth :: number)
    for _, tab in window.tabs do
        if not tab.neglectSelector then
            tabSelector.setRowCollapsed(tab, collapsed, layout)
        end
    end

    if window.profileContainer then
        window.profileContainer.Position = UDim2.new(0, if collapsed then 0 else layout.rowInset, 0.5, 0)
        window.profileContainer.Size = UDim2.new(1, if collapsed then 0 else -layout.rowInset, 1, 0)
        window.profileLayout.HorizontalAlignment = if collapsed
            then Enum.HorizontalAlignment.Center
            else Enum.HorizontalAlignment.Left
        window.profileLabels.Visible = not collapsed
    end
end

-- Fade the profile with the rest of the window's chrome. Nil tweenInfo snaps.
function sidebar.setProfileShown(window, shown, tweenInfo)
    if not window.profile or not window.profile.Visible then
        return
    end

    local targets = {
        [window.profileAvatar] = {
            ImageTransparency = if shown then 0 else 1,
            BackgroundTransparency = if shown then avatarPlateTransparency else 1,
        },
        [window.profileName] = { TextTransparency = if shown then nameTransparency else 1 },
        [window.profileSubtitle] = { TextTransparency = if shown then subtitleTransparency else 1 },
    }

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

-- Flip the profile on or off from settings. It fades out before it goes, and the rows only take
-- its height once it's actually gone, so neither end of the switch snaps.
function sidebar.setProfileEnabled(window, enabled)
    if not window.profile then
        window.settings.showProfile = enabled
        return
    end

    if enabled then
        window.settings.showProfile = true
        sidebar.reflowProfile(window)
        sidebar.setProfileShown(window, true, settleInfo)
        return
    end

    -- still on for the length of the fade, so setProfileShown has something to animate
    sidebar.setProfileShown(window, false, settleInfo)
    task.delay(settleInfo.Time, function()
        if window.unloaded or window.settings.showProfile then
            return -- turned back on mid-fade
        end
        sidebar.reflowProfile(window)
    end)
    window.settings.showProfile = false
end

-- Set the line under the player's name. Empty (or nil) drops the line entirely.
function sidebar.setSubtitle(window, text)
    if not window.profileSubtitle then
        return
    end

    local resolved = if type(text) == "string" and text ~= "" then locale.resolve(text) else nil
    window.profileSubtitle.Text = resolved or ""
    window.profileSubtitle.Visible = resolved ~= nil
end

return sidebar
