--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
-- Modified for Rayfield Columns: exports the Column type and drops the loading banner.

local variables = require(script.utility.variables)
local image = require(script.utility.image)
local locale = require(script.utility.locale)
local constants = require(script.utility.constants)
local types = require(script.types)

-- re-export public types so consumers can annotate against Rayfield.Window etc
export type Theme = types.Theme
export type Translator = types.Translator
export type Translations = types.Translations
export type ColumnSide = types.ColumnSide
export type WindowConfiguration = types.WindowConfiguration

export type WindowProps = types.WindowProps
export type TabProps = types.TabProps
export type TagProps = types.TagProps
export type SectionProps = types.SectionProps
export type GroupProps = types.GroupProps
export type ButtonProps = types.ButtonProps
export type ToggleProps = types.ToggleProps
export type SliderProps = types.SliderProps
export type DropdownProps = types.DropdownProps
export type InputProps = types.InputProps
export type KeybindProps = types.KeybindProps
export type ColorPickerProps = types.ColorPickerProps
export type StatProps = types.StatProps
export type ProgressProps = types.ProgressProps
export type ConsoleProps = types.ConsoleProps
export type TextProps = types.TextProps
export type DividerProps = types.DividerProps
export type NotifyProps = types.NotifyProps
export type ToastProps = types.ToastProps
export type PopupBox = types.PopupBox
export type PopupOption = types.PopupOption
export type PopupProps = types.PopupProps

export type Moveable = types.Moveable
export type Lockable = types.Lockable
export type Window = types.Window
export type Tab = types.Tab
export type Column = types.Column
export type Group = types.Group
export type Button = types.Button
export type Toggle = types.Toggle
export type Slider = types.Slider
export type Dropdown = types.Dropdown
export type Input = types.Input
export type Keybind = types.Keybind
export type ColorPicker = types.ColorPicker
export type Stat = types.Stat
export type Progress = types.Progress
export type Console = types.Console
export type Section = types.Section
export type TabSection = types.TabSection
export type Text = types.Text
export type Divider = types.Divider
export type Tag = types.Tag
export type Popup = types.Popup
export type Rayfield = types.Rayfield

-- the components are untyped luau, so this is where the window module meets the public contract
type WindowModule = { new: (types.WindowProps) -> types.Window }

local rayfield = {} :: Rayfield

function rayfield:CreateWindow(properties: types.WindowProps): types.Window
    local window: types.Window? -- forward declared so the settle callback below can reach it
    -- preload can settle before the window is built; hold the notify until it is
    local queuedNotify: (() -> ())?

    if variables.secureMode then
        -- cache icons locally so secureMode doesnt leak asset ids. non-blocking: whats already on
        -- disk applies now, the rest download in the background and rebind once ready. if any never
        -- cache, tell the dev once - on screen only, secure mode stays off the console
        image.preload(function(failed)
            if failed <= 0 then
                return
            end
            local function notify()
                if not window or window.unloaded then
                    return
                end
                window:Notify({
                    title = locale.resolve("Secure mode"),
                    content = if failed == 1
                        then locale.resolve("An asset couldn't be cached and won't appear.")
                        else locale.resolve("Some assets couldn't be cached and won't appear."),
                })
            end
            if window then
                notify()
            else
                queuedNotify = notify
            end
        end)
    end

    local built = (require(script.components.window) :: WindowModule).new(properties)
    window = built

    if queuedNotify then
        task.spawn(queuedNotify)
        queuedNotify = nil
    end

    if variables.secureMode then
        -- secure mode renders the fallback up front (variables.brandFont), then downloads the real
        -- brand faces off the main thread and swaps them in once ready, so startup never blocks
        task.spawn(function()
            local body = variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.Medium)
            local title = variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.SemiBold)
            -- the download can outlast the window; dont swap into one thats been unloaded
            if
                not built.unloaded
                and body
                and title
                and body ~= variables.fallbackFont
                and title ~= variables.fallbackFont
            then
                built:ChangeTheme({ Font = body, TitleFont = title })
            end
        end)
    end

    -- a short beat so the script can build its tabs before the window opens (no loading banner)
    task.spawn(function()
        task.wait(0.5)
        -- the window can be unloaded inside this delay; showing it then would fire
        -- saved-config callbacks and build toasts on destroyed instances
        if not built.unloaded then
            built:Show()
        end
    end)

    return built
end

return rayfield
