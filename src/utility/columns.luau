--!strict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- The measurements behind a tab's two columns. A page is two columns side by side while there's
-- room for both, and one stacked over the other when there isn't, so a phone gets the same
-- elements at a width they can actually be used at.
--
-- Everything here is worked out from the window's settled size rather than from a live
-- AbsoluteSize, so the columns never flip back and forth while the window animates open or shut.

local layouts = require(script.Parent.layouts)

local columns = {}

export type Side = "Left" | "Right"

-- Every element sits 10px in from its host's edge (the (1, -20) width every element builds at).
-- Pulling the two columns together by one inset leaves a 10px gutter between them, the same gap
-- as the 10px the page itself keeps in from the window.
columns.overlap = 10

-- Below this page width the columns stack. At this width each column is ~285px, the narrowest a
-- dropdown's label and value still sit side by side without one running into the other.
columns.stackBelow = 560

-- The page is inset 10px each side from the content area (the (1, -20) the tab page builds at).
local pageInset = 20

-- Width of the scrolling page a tab builds, for a window this wide. Under a sidebar the rail
-- takes its slice first.
function columns.pageWidth(windowWidth: number, layout: layouts.Layout): number
    return math.max(windowWidth - layouts.railWidthFor(layout, windowWidth) - pageInset, 0)
end

-- Whether a page this wide stacks its columns. Zero means the page hasn't been measured yet, and
-- side by side is the shape a window is built for.
function columns.shouldStack(pageWidth: number): boolean
    return pageWidth > 0 and pageWidth < columns.stackBelow
end

-- Read whatever a dev passed as a column (a side name, any case, or an index) back to a side.
-- Nil means the default, the left one. Anything else is a mistake, and gets nil back so the
-- caller can say so.
function columns.resolveSide(value: unknown): Side?
    if value == nil then
        return "Left"
    end
    if value == 1 then
        return "Left"
    elseif value == 2 then
        return "Right"
    end
    if type(value) ~= "string" then
        return nil
    end

    local lowered = string.lower(value)
    if lowered == "left" or lowered == "l" then
        return "Left"
    elseif lowered == "right" or lowered == "r" then
        return "Right"
    end
    return nil
end

return columns
