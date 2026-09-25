--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Typecheck only. The runner collects *.spec.luau, so this is never required and never runs -
-- it exists so luau-lsp checks the public handles against what the elements actually ship. A
-- method that exists at runtime but never made it into types.luau fails here.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rayfield = require(ReplicatedStorage.Rayfield)

return function(window: Rayfield.Window, tab: Rayfield.Tab)
    -- a heading in the sidebar rail, not in a tab's element list
    local railSection: Rayfield.TabSection = window:CreateSection({ name = "General" })
    railSection:Remove()

    local progress: Rayfield.Progress = tab:CreateProgress({ name = "Progress" })
    progress:Set(0.5)
    local progressValue: number = progress:Get()
    local progressRatio: number = progress:GetPercentage()
    progress:SetRange(0, 10)
    progress:SetText("halfway")
    progress:SetText(nil) -- back to the formatter
    progress:SetIndeterminate(true)
    progress:Remove()

    local console: Rayfield.Console = tab:CreateConsole({ name = "Console" })
    console:Set("body")
    console:Append("line")
    console:Clear()
    local consoleBody: string = console:Get()
    local copied: boolean = console:Copy()
    console:SetHeight(160)
    console:Remove()

    -- every element you can operate takes a lock, and only those
    local button: Rayfield.Button = tab:CreateButton({ name = "Button" })
    local toggle: Rayfield.Toggle = tab:CreateToggle({ name = "Toggle" })
    local slider: Rayfield.Slider = tab:CreateSlider({ name = "Slider" })
    local dropdown: Rayfield.Dropdown = tab:CreateDropdown({ name = "Dropdown" })
    local input: Rayfield.Input = tab:CreateInput({ name = "Input" })
    local keybind: Rayfield.Keybind = tab:CreateKeybind({ name = "Keybind" })
    local colorPicker: Rayfield.ColorPicker = tab:CreateColorPicker({ name = "Colour" })

    button:Lock("needs a key")
    toggle:Lock()
    slider:Lock()
    dropdown:Lock()
    input:Lock()
    keybind:Lock()
    colorPicker:Lock()

    button:Unlock()
    local locked: boolean = toggle:IsLocked()

    -- the page is two columns: build into either one directly, or pick one from the tab
    local left: Rayfield.Column = tab.Left
    local right: Rayfield.Column = tab:GetColumn("Right")
    local leftSection: Rayfield.Section = left:CreateSection({ name = "Job" })
    local leftDropdown: Rayfield.Dropdown = left:CreateDropdown({ name = "Select Job", options = { "Baker" } })
    local rightSlider: Rayfield.Slider = right:CreateSlider({ name = "Work Time", range = { 1, 60 } })
    local rightStat: Rayfield.Stat = right:CreateStat({ name = "Shift Earnings", prefix = "$" })
    local sided: Rayfield.Toggle = tab:CreateToggle({ name = "Enable Breaks", side = "Right" })
    local nested: Rayfield.Group = right:CreateGroup({ direction = "column" })
    leftSection:MoveToTop()
    leftDropdown:Lock()
    rightSlider:Set(30)
    rightStat:Set(349)
    sided:Set(true)
    nested:CreateToggle({ name = "Nested" })

    return progressValue, progressRatio, consoleBody, copied, locked
end
