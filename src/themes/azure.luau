--!strict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Deep midnight-blue dark theme with a bright azure accent. Darker and cooler than Cobalt, with a
-- sky-blue accent rather than a royal one. A partial theme: it only overrides the colours that
-- differ from default and inherits the rest (corners, fonts, toggle/field behaviour) from it.
return {
    WindowColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 13, 26)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(11, 21, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 30, 56)),
    }),
    ShadowColor = Color3.fromRGB(3, 7, 16),

    ElementStroke = Color3.fromRGB(28, 46, 76),
    ElementGradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 25, 47)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(17, 31, 56)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 31, 56)),
    }),
    ElementStrokeGradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 62, 100)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(50, 80, 124)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 62, 100)),
    }),
    ElementStrokeHover = Color3.fromRGB(56, 90, 138),

    TabBackground = ColorSequence.new(Color3.fromRGB(28, 52, 90), Color3.fromRGB(16, 31, 57)),
    TabStroke = ColorSequence.new(Color3.fromRGB(58, 100, 160), Color3.fromRGB(28, 52, 90)),

    SliderBackground = Color3.fromRGB(24, 42, 70),
    SliderBackgroundHover = Color3.fromRGB(34, 56, 92),
    SliderProgress = ColorSequence.new(Color3.fromRGB(56, 162, 255), Color3.fromRGB(22, 128, 236)),

    -- Azure accent for the active toggle, slider glow and popup primary button.
    AccentColor = Color3.fromRGB(30, 144, 255),
    AccentStroke = Color3.fromRGB(116, 196, 255),

    ToggleKnobOff = Color3.fromRGB(198, 220, 246), -- cool off-knob on the dark track

    StatBackground = Color3.fromRGB(11, 21, 40),

    DropdownHighlight = Color3.fromRGB(30, 144, 255),

    NeutralButton = Color3.fromRGB(24, 42, 70),
    NeutralButtonHover = Color3.fromRGB(34, 56, 92),
    NeutralButtonStroke = Color3.fromRGB(112, 156, 214), -- clearly lighter than the fill, reads at 0.85
}
