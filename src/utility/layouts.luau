--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Where a window puts its tab selector, and every measurement that follows from it.
-- "top" is the horizontal pill strip under the topbar. "sidebar" is a vertical rail down the
-- left with the content in its own card. Anything that needs one of these numbers reads it
-- from here, so the two layouts cant drift apart in a stray offset somewhere.

local layouts = {}

-- The same bar in both layouts: title and subtitle left, actions right.
local topbarHeight = 64

-- The strip hangs a pixel into the topbar's base, and the content starts a small gap below it.
local tabStripTop = topbarHeight - 1
local tabStripHeight = 38
local tabStripGap = 3

export type Mode = "top" | "sidebar"

export type Layout = {
    mode: Mode,

    -- Everything above the content area. The elements frame is sized (1, -chromeHeight).
    topbarHeight: number,
    chromeHeight: number,

    -- Which way the pages slide as you change tab: across for a strip, up and down for a rail,
    -- so the movement always answers the selector.
    pageDirection: Enum.FillDirection,

    -- Bottom fade over the content: elements dissolve into the window as they scroll out.
    -- fadeCorners nil means the whole shape is rounded; a list rounds only those corners.
    fadeSize: UDim2,
    fadeTransparency: NumberSequence,
    fadeCorners: { string }?,

    -- top only
    tabStripTop: number?,
    tabStripHeight: number?,

    -- sidebar only
    railWidth: number?,
    railCollapsedWidth: number?,
    railCollapseBelow: number?,
    rowHeight: number?,
    rowCornerRadius: number?,
    rowSpacing: number?,
    railPadding: number?,
    rowInset: number?,
    rowPadding: number?,
    rowContentSpacing: number?,
    rowIconSize: number?,
    footerHeight: number?,
    avatarSize: number?,
    cardTransparency: number?,
    cardStrokeRotation: number?,
    cardStrokeTransparency: NumberSequence?,
    cardCorners: { string }?,
}

layouts.top = {
    mode = "top" :: Mode,

    topbarHeight = topbarHeight,
    chromeHeight = tabStripTop + tabStripHeight + tabStripGap,

    tabStripTop = tabStripTop,
    tabStripHeight = tabStripHeight,

    pageDirection = Enum.FillDirection.Horizontal,

    -- the negative scale keeps the fade a touch shorter on a tall window, so it stays a hint
    -- of a fade rather than swallowing the last row
    fadeSize = UDim2.new(1, 0, -0.093, 100),
    fadeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.4414, 0),
        NumberSequenceKeypoint.new(0.7007, 0.631),
        NumberSequenceKeypoint.new(1, 1),
    }),
} :: Layout

layouts.sidebar = {
    mode = "sidebar" :: Mode,

    topbarHeight = topbarHeight,
    chromeHeight = topbarHeight,

    -- offset, not scale: element rows want a stable width, so a narrower window takes it out
    -- of the rail rather than shaving both sides proportionally.
    railWidth = 219,
    -- under railCollapseBelow the rail drops its titles and becomes an icon rail, which is the
    -- difference between a usable content card and an unusable one on a phone.
    railCollapsedWidth = 64,
    railCollapseBelow = 589,

    rowHeight = 38,
    rowCornerRadius = 14,
    rowSpacing = 4,
    -- clears the selected row's glow, which reaches about this far past its own top edge
    railPadding = 17,
    rowInset = 15,
    rowPadding = 10,
    rowContentSpacing = 6,
    rowIconSize = 20,

    footerHeight = 60,
    avatarSize = 34,

    pageDirection = Enum.FillDirection.Vertical,

    cardTransparency = 0.98,
    cardStrokeRotation = 55,
    -- the card is tucked into the window's bottom-right corner, so it shares that radius and
    -- the one diagonally opposite it. The other two butt against the topbar and the rail.
    cardCorners = { "TopLeftRadius", "BottomRightRadius" },
    cardStrokeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.9),
        NumberSequenceKeypoint.new(0.128, 0.95),
        NumberSequenceKeypoint.new(0.414, 0.985),
        NumberSequenceKeypoint.new(1, 1),
    }),

    fadeSize = UDim2.new(1, 0, 0, 55),
    fadeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.377, 0),
        NumberSequenceKeypoint.new(1, 1),
    }),
    -- only the corner it actually sits in; the rail holds the other side
    fadeCorners = { "BottomRightRadius" },
} :: Layout

-- Resolve whatever the dev passed to a layout. An unknown name warns through the caller's
-- fallback rather than here, so this stays a pure lookup.
function layouts.get(mode: unknown): Layout?
    if mode == "sidebar" then
        return layouts.sidebar
    elseif mode == "top" then
        return layouts.top
    end
    return nil
end

-- How wide the rail reads at this window width. Titles need the room to be there; below that
-- they cost more than they give, so the rail keeps the icons and drops them.
function layouts.railWidthFor(layout: Layout, windowWidth: number): number
    if layout.mode ~= "sidebar" then
        return 0
    end
    local full = layout.railWidth :: number
    if windowWidth < (layout.railCollapseBelow :: number) then
        return layout.railCollapsedWidth :: number
    end
    return full
end

return layouts
