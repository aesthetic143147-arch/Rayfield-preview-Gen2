--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Window furniture: the collapsed "Show" face main wears while hidden (window.collapsed*
-- fields), plus the first-open new-user check. The welcome greeting itself is just a toast now.

local utility = script.Parent.Parent.utility
local variables = require(utility.variables)
local filesystem = require(utility.filesystem)
local constants = require(utility.constants)
local locale = require(utility.locale)
local hapticEngine = require(utility.HapticEngine)

local chrome = {}

-- How far the cursor may travel before a press on the collapsed pill counts as a drag rather
-- than a click. Small enough that a deliberate tap always opens, big enough to survive a
-- shaky finger on a phone.
local dragThreshold = 5

-- The face main wears once collapsed: an icon + "name"/"Tap to show", drawn straight onto
-- the window frame itself. main already carries the pill's background (its own WindowColor
-- gradient reads the same as the old standalone pill), so shrinking main IS becoming the
-- pill - nothing to hand off to, nothing to swap.
function chrome.buildCollapsedFace(window)
    local iconOnly = window.showIconOnly

    window.collapsedIcon = window:Create("ImageLabel", {
        Name = "CollapsedIcon",
        AnchorPoint = if iconOnly then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5),
        Position = if iconOnly then UDim2.fromScale(0.5, 0.5) else UDim2.new(0, 16, 0.5, 0),
        Size = UDim2.fromOffset(24, 24),
        BackgroundTransparency = 1,
        -- raw value: Create routes Image through image.resolve (concat would double the prefix)
        Image = window.showIcon,
        ZIndex = constants.zIndex.restoreContent,

        ImageTransparency = 1, -- shown = 0, set by chrome.setCollapsedShown

        Parent = window.main,
    }, { ImageColor3 = "TitlingColor" })

    window:Create("UICorner", {
        Parent = window.collapsedIcon,
    }, { CornerRadius = "PillCornerRadius" })

    local textContainer = window:Create("Frame", {
        Name = "CollapsedText",
        Visible = not iconOnly,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 50, 0.5, 0),
        Size = UDim2.new(1, -60, 0, 32),
        BackgroundTransparency = 1,
        ZIndex = constants.zIndex.restoreContent,

        Parent = window.main,
    })

    window:Create("UIListLayout", {
        Padding = UDim.new(0, 1),
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = textContainer,
    })

    window.collapsedTitle = window:Create("TextLabel", {
        Name = "Title",
        Text = window.showName,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        FontFace = variables.brandFont(Enum.FontWeight.Medium),
        RichText = true,
        TextSize = 16,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = constants.zIndex.restoreContent,

        TextTransparency = 1, -- shown = 0, set by chrome.setCollapsedShown

        Parent = textContainer,
    }, { TextColor3 = "TitlingColor" })

    window.collapsedSubtitle = window:Create("TextLabel", {
        Name = "Subtitle",
        Text = locale.t("Tap to show"),
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        FontFace = variables.brandFont(Enum.FontWeight.Medium),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 2,
        ZIndex = constants.zIndex.restoreContent,

        TextTransparency = 1, -- shown = 0.5, set by chrome.setCollapsedShown

        Parent = textContainer,
    }, { TextColor3 = "TitlingColor" })

    -- covers the whole window but only takes clicks while collapsed - Window:Hide/Show flip
    -- Visible as the morph starts/settles so it can never eat a click mid-animation or while
    -- the window is fully open. Active alone doesn't stop a GuiButton from still receiving
    -- clicks here, so Visible is what actually keeps it out of hit-testing.
    window.collapsedInteract = window:Create("TextButton", {
        Name = "CollapsedInteract",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextTransparency = 1,
        Visible = false,
        ZIndex = constants.zIndex.restoreInteract,

        Parent = window.main,
    })

    chrome.bindCollapsedDrag(window)
end

-- Drag the collapsed pill around. A press only counts as a click if the cursor barely moved -
-- past dragThreshold it was a drag, and the window stays shut.
function chrome.bindCollapsedDrag(window)
    local uis = variables.userInputService
    local dragging, moved = false, false
    local grabOffset, grabMouse = Vector2.zero, Vector2.zero

    -- main.Position sits in a space shifted from AbsolutePosition by the gui inset, even though
    -- the ScreenGui ignores it - add it back or the pill jumps on the first move
    local function insetOffset()
        if window.screenGui and window.screenGui.IgnoreGuiInset then
            return variables.guiService:GetGuiInset()
        end
        return Vector2.zero
    end

    window:Connect(window.collapsedInteract.InputBegan, function(input, processed)
        if processed or not window.hidden or window.animating then
            return
        end
        local inputType = input.UserInputType.Name
        if inputType ~= "MouseButton1" and inputType ~= "Touch" then
            return
        end

        dragging, moved = true, false
        grabMouse = uis:GetMouseLocation()
        grabOffset = window.main.AbsolutePosition + window.main.AbsoluteSize * window.main.AnchorPoint - grabMouse
    end)

    window:Connect(uis.InputEnded, function(input)
        local inputType = input.UserInputType.Name
        if inputType ~= "MouseButton1" and inputType ~= "Touch" then
            return
        end
        if not dragging then
            return
        end
        dragging = false

        if moved then
            window._collapsedPosition = window.main.Position -- stay where it was put
            return
        end

        hapticEngine.click()
        window:ToggleHide()
    end)

    -- a release that never arrives (alt-tab with the button down) would otherwise leave the
    -- pill stuck to the cursor
    window:Connect(uis.WindowFocusReleased, function()
        dragging = false
    end)

    window:Connect(variables.runService.RenderStepped, function()
        if not dragging then
            return
        end
        if not window.hidden or window.animating then
            dragging = false -- the grab went stale under us
            return
        end

        local mouse = uis:GetMouseLocation()
        if not moved and (mouse - grabMouse).Magnitude < dragThreshold then
            return -- still inside the slop: it might yet be a click
        end
        moved = true

        local target = mouse + grabOffset + insetOffset()
        window.main.Position = UDim2.fromOffset(target.X, target.Y)
    end)
end

function chrome.isNewUser()
    local localPlayer = variables.localPlayer
    if not localPlayer then
        return false
    end

    -- No filesystem available - just show the banner every launch.
    if typeof(filesystem.isfile) ~= "function" or typeof(filesystem.writefile) ~= "function" then
        return true
    end

    local path = variables.fileSystemManager:getPath("lastuser.txt")
    local currentId = tostring(localPlayer.UserId)
    local isNew = true

    pcall(function()
        if filesystem.isfile(path) then
            isNew = filesystem.readfile(path) ~= currentId
        end
    end)

    pcall(function()
        filesystem.writefile(path, currentId)
    end)

    return isNew
end

-- Fade the collapsed face (icon + labels) in or out as main morphs into/out of the pill.
-- When tweenInfo is nil the values snap instantly.
function chrome.setCollapsedShown(window, shown, tweenInfo)
    local targets = {
        [window.collapsedIcon] = { ImageTransparency = if shown then 0 else 1 },
    }

    if not window.showIconOnly then
        targets[window.collapsedTitle] = { TextTransparency = if shown then 0 else 1 }
        targets[window.collapsedSubtitle] = { TextTransparency = if shown then 0.5 else 1 }
    end

    for instance, props in targets do
        if tweenInfo then
            variables.tweenService:Create(instance, tweenInfo, props):Play()
        else
            for property, value in props do
                instance[property] = value
            end
        end
    end
end

return chrome
