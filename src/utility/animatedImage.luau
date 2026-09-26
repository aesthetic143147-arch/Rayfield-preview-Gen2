--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Moving pictures on an ImageLabel. Roblox has no GIFs, so an animation is either a sprite sheet
-- (every frame in one image, laid out in a grid, shown one cell at a time through ImageRectOffset)
-- or a list of separate images swapped in turn. A still image is the same thing with one frame.
--
-- A "visual" here is what's ready to draw:
--   { uri = "rbxassetid://…" }                                              a still image
--   { uri = …, sheet = { frames, columns, frameWidth, frameHeight, fps } }  a sprite sheet
--   { list = { uri, uri, … }, fps = 8 }                                     separate frames

local animatedImage = {}

function animatedImage.isAnimated(visual): boolean
    if not visual then
        return false
    end
    if visual.sheet then
        return (visual.sheet.frames or 1) > 1 and (visual.sheet.fps or 0) > 0
    end
    return visual.list ~= nil and #visual.list > 1 and (visual.fps or 0) > 0
end

-- Put a visual on a label, showing its first frame.
function animatedImage.apply(label, visual)
    if not visual then
        label.Image = ""
        label.ImageRectSize = Vector2.zero
        label.ImageRectOffset = Vector2.zero
        return
    end
    if visual.list then
        label.Image = visual.list[1] or ""
        label.ImageRectSize = Vector2.zero
        label.ImageRectOffset = Vector2.zero
        return
    end
    label.Image = visual.uri or ""
    local sheet = visual.sheet
    if sheet then
        label.ImageRectSize = Vector2.new(sheet.frameWidth, sheet.frameHeight)
        label.ImageRectOffset = Vector2.zero
    else
        label.ImageRectSize = Vector2.zero
        label.ImageRectOffset = Vector2.zero
    end
end

-- Which frame a visual is on at time t (0-based).
function animatedImage.frameAt(visual, t: number): number
    if not animatedImage.isAnimated(visual) then
        return 0
    end
    local count = if visual.sheet then visual.sheet.frames else #visual.list
    local fps = if visual.sheet then visual.sheet.fps else visual.fps
    return math.floor(t * fps) % count
end

-- Show the frame for time t. Cheap enough to call every frame: it only writes when the frame moves.
function animatedImage.step(label, visual, t: number, state)
    if not animatedImage.isAnimated(visual) then
        return
    end
    local index = animatedImage.frameAt(visual, t)
    if state and state.frame == index then
        return
    end
    if state then
        state.frame = index
    end
    if visual.sheet then
        local sheet = visual.sheet
        local column = index % sheet.columns
        local row = index // sheet.columns
        label.ImageRectOffset = Vector2.new(column * sheet.frameWidth, row * sheet.frameHeight)
    else
        label.Image = visual.list[index + 1]
    end
end

return animatedImage
