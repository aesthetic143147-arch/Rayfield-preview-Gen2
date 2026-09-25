--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Picks the window size for a given screen. Each layout has its own ideal shape and its own
-- idea of which axis matters: the top-tab window is portrait and defends its height, the
-- sidebar window is landscape and defends its width. Anything roomy keeps the ideal untouched.

local layouts = require(script.Parent.layouts)

local windowSizing = {}

export type Profile = {
    -- The size we ship on a roomy screen, and the smallest we'll shrink to on a tiny one. The
    -- minimum is a floor, not a guarantee: a screen too small to hold it gets a window that
    -- fits instead.
    defaultSize: Vector2,
    minSize: Vector2,

    -- Most of the screen we'll ever take, per axis, plus a pixel floor so a huge display still
    -- gets a margin. Fractions rather than a flat inset: a fixed margin only ever bites on the
    -- small screens least able to afford it, which is how a phone ended up filled top to bottom
    -- while half its width sat unused.
    -- plain numbers, not a Vector2: its components are 32 bit, so 0.70 would come back as
    -- 0.69999998 and the cap would sit a pixel under what it says on some screens
    maxOccupancyX: number,
    maxOccupancyY: number?,
    marginFloorX: number,
    marginFloorY: number,

    -- Room to leave above a centred window for the Roblox topbar. Where this is set it takes
    -- the place of a vertical fraction: it is the thing the fraction was standing in for, and
    -- it does not give away half a phone screen to express it.
    topbarClearance: number?,

    -- How wide the window is ever allowed to read against its own height, and (sidebar only)
    -- how narrow, so a landscape window never turns portrait on the way down.
    maxAspectRatio: number,
    minAspectRatio: number?,

    -- top only: when a short screen forces the height down, the window earns a little width
    -- back. Scales with the height actually lost, so a screen tall enough keeps the ideal width.
    widthCompensation: number?,

    chromeHeight: number,
}

-- Below this, either axis is a viewport we dont believe - a camera mid-init or a stray 1x1
-- report. Sizing off one would pin the window at its floor for the session, so take the
-- default and let the caller's reconcile correct it once the screen reports properly.
local minPlausibleViewport = 200

local profiles = {
    top = {
        defaultSize = Vector2.new(475, 500),
        minSize = Vector2.new(300, 285),

        -- Height is bounded by the topbar rather than by a fraction. A flat 70% was chosen so a
        -- centred window cleared the Roblox topbar, but on a phone that gave away far more than
        -- the topbar needs: 273px of a 390px screen, leaving four rows of content. Asking for
        -- the clearance directly keeps the same gap above and hands the rest back. On a big
        -- screen nothing changes, because the ideal height caps it long before this does.
        maxOccupancyX = 0.86,
        topbarClearance = 36,
        marginFloorX = 24,
        marginFloorY = 28,

        -- A landscape phone leaves plenty of width spare, and the window could not reach it:
        -- at a phone's height the aspect ceiling bound the width long before the screen did.
        -- Both are raised together so a short screen gets a usably wide window, while a roomy
        -- one is untouched - the compensation only applies once height has actually been lost.
        maxAspectRatio = 2.3,
        widthCompensation = 130,

        chromeHeight = layouts.top.chromeHeight,
    } :: Profile,
    sidebar = {
        defaultSize = Vector2.new(685, 450),
        -- the floor sits where a rail plus a usable card still fit, in the same band the other
        -- landscape libraries settle on rather than something we invented.
        minSize = Vector2.new(560, 350),

        -- the mirror of the portrait window: width is what the layout is for, so it takes more
        -- of the screen across. The vertical cap is looser than the top layout's because a
        -- phone held landscape is short, and a rail of tabs needs the height to be worth using.
        maxOccupancyX = 0.92,
        maxOccupancyY = 0.8,
        marginFloorX = 24,
        marginFloorY = 28,

        maxAspectRatio = 2.6,
        minAspectRatio = 1.2,

        chromeHeight = layouts.sidebar.chromeHeight,
    } :: Profile,
}

function windowSizing.profile(mode: layouts.Mode?): Profile
    if mode == "sidebar" then
        return profiles.sidebar
    end
    return profiles.top
end

-- The page a window of this height can show. Nil height means the window hasn't been sized yet,
-- so answer with the smallest page there can be rather than nothing.
function windowSizing.pageHeight(windowHeight: number?, mode: layouts.Mode?): number
    local profile = windowSizing.profile(mode)
    local height = if windowHeight and windowHeight > 0 then windowHeight else profile.minSize.Y
    return math.max(height - profile.chromeHeight, 0)
end

-- How much height this screen will give. Whichever bound the profile declares applies; a
-- profile with both gets the tighter of the two.
local function availableHeight(profile: Profile, viewportY: number): number
    local limit = viewportY - profile.marginFloorY
    if profile.topbarClearance then
        limit = math.min(limit, viewportY - profile.topbarClearance * 2)
    end
    if profile.maxOccupancyY then
        limit = math.min(limit, viewportY * profile.maxOccupancyY)
    end
    return limit
end

-- How much of an axis we had to give up, 0 on a screen big enough and 1 once pinned to the floor.
local function deficit(actual: number, ideal: number, floor: number): number
    return math.clamp((ideal - actual) / (ideal - floor), 0, 1)
end

-- Portrait: settle the height first and buy a slice of width back for whatever it cost.
local function fitVertical(profile: Profile, availableX: number, availableY: number): UDim2
    -- the floor gives way to the screen: a viewport too small to hold it gets a smaller window
    -- rather than one hanging off the edge, so the occupancy caps hold at every size. settle the
    -- height to whole pixels first, so the aspect cap is measured against the height we ship
    -- rather than a fraction that rounds away underneath it.
    local height = math.floor(math.min(math.clamp(availableY, profile.minSize.Y, profile.defaultSize.Y), availableY))
    local lost = deficit(height, profile.defaultSize.Y, profile.minSize.Y)
    local width = math.max(profile.defaultSize.X + (profile.widthCompensation :: number) * lost, profile.minSize.X)

    -- the screen and the aspect ceiling are the hard limits, so they are applied after the
    -- floor has lifted the width: a minimum that can push back past a cap is not a cap.
    -- floor, not round: rounding up can carry the result back past those same limits.
    return UDim2.fromOffset(math.floor(math.min(width, availableX, height * profile.maxAspectRatio)), height)
end

-- Landscape: settle the width first, then take whatever height the screen allows without
-- letting the window read portrait.
local function fitHorizontal(profile: Profile, availableX: number, availableY: number): UDim2
    local width = math.min(math.clamp(availableX, profile.minSize.X, profile.defaultSize.X), availableX)
    local height = math.min(math.clamp(availableY, profile.minSize.Y, profile.defaultSize.Y), availableY)

    -- a tall screen doesn't make this a tall window, and a short one narrows it rather than
    -- stretching it into a letterbox. Height gives way first, so the layout keeps the width it
    -- exists for wherever the screen can afford it.
    -- the height settles to whole pixels before the width is capped against it, so the ceiling
    -- holds against the height we ship rather than the fraction it came from.
    height = math.floor(math.min(height, width / (profile.minAspectRatio :: number)))
    width = math.floor(math.min(width, height * profile.maxAspectRatio))

    return UDim2.fromOffset(width, height)
end

function windowSizing.fit(viewport: Vector2?, mode: layouts.Mode?): UDim2
    local profile = windowSizing.profile(mode)

    if not viewport or viewport.X < minPlausibleViewport or viewport.Y < minPlausibleViewport then
        return UDim2.fromOffset(profile.defaultSize.X, profile.defaultSize.Y)
    end

    local availableX = math.min(viewport.X * profile.maxOccupancyX, viewport.X - profile.marginFloorX)
    local availableY = availableHeight(profile, viewport.Y)

    if profile.minAspectRatio then
        return fitHorizontal(profile, availableX, availableY)
    end
    return fitVertical(profile, availableX, availableY)
end

return windowSizing
