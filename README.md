# Rayfield Columns

A two-column edition of [Rayfield Gen2](https://docs.sirius.menu/rayfield-gen2), the Roblox interface
suite by [Sirius](https://sirius.menu). It has the same elements, tabs, animations, config saving and
API as Gen2, but every tab page is split into a **left and a right column** you can fill independently.

> **Fan-made and unofficial.** Rayfield Columns is built on the Rayfield Gen2 source but is not made,
> endorsed or supported by Sirius. Please don't take issues with it to the Rayfield team. See
> [Credits](#credits).

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/aesthetic143147-arch/Rayfiend-preview-Gen2/main/dist/RayfieldColumns.luau"))()
```

**Documentation:** https://aesthetic143147-arch.github.io/Rayfiend-preview-Gen2/ (source in [`docs/`](docs/index.html))

## Quick start

```lua
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/aesthetic143147-arch/Rayfiend-preview-Gen2/main/dist/RayfieldColumns.luau"))()

local Window = Rayfield:CreateWindow({
    name = "Pulse",
    configuration = { autoSave = true, autoLoad = true, fileName = "Pulse" },
})

Window:CreateTag({ text = "Bloxburg", color = Color3.fromRGB(235, 90, 215) })

local Auto = Window:CreateTab({ name = "Auto", icon = 84750991656135 })

-- left column
Auto.Left:CreateSection({ name = "Job" })
Auto.Left:CreateDropdown({ name = "Select Job", options = { "PizzaPlanetBaker", "PizzaPlanetCashier" }, value = "PizzaPlanetBaker" })
Auto.Left:CreateToggle({ name = "Enable Auto Farm", value = true, callback = function(on) print(on) end })
Auto.Left:CreateButton({ name = "Go To Work", callback = function() print("go") end })

-- right column
Auto.Right:CreateSection({ name = "Breaks" })
Auto.Right:CreateSlider({ name = "Work Time", range = { 5, 120 }, increment = 5, value = 30, suffix = "min" })
Auto.Right:CreateToggle({ name = "Enable Breaks" })
Auto.Right:CreateSection({ name = "Statistics" })
Auto.Right:CreateStat({ name = "Shift Earnings", prefix = "$", value = 349 })
```

[`example.lua`](example.lua) is the full version of this page, ready to paste into an executor.
[`example.client.luau`](example.client.luau) is a longer tour for Roblox Studio.

## Columns

Every tab has two columns, `Tab.Left` and `Tab.Right`. Both take every element a Gen2 tab takes, laid
out top to bottom in the order you create them.

```lua
local Tab = Window:CreateTab({ name = "Main", icon = 84750991656135 })

Tab.Left:CreateToggle({ name = "Left side" })
Tab.Right:CreateToggle({ name = "Right side" })
```

You can also call `Create…` on the tab itself and pick a column with `side`. Without `side`, the
element goes in the left column, so a script written for normal Rayfield Gen2 still works unchanged.

```lua
Tab:CreateToggle({ name = "Goes left" })
Tab:CreateToggle({ name = "Goes right", side = "Right" })
```

| Way to pick a column | Example |
| --- | --- |
| The column itself | `Tab.Left`, `Tab.Right` (also `Tab.left`, `Tab.right`) |
| By side | `Tab:GetColumn("Right")` (any case), `Tab:GetColumn(2)` |
| On a tab-level call | `side = "Right"` or `side = 2` (`column = …` works too) |

A misspelled side prints a warning and falls back to the left column instead of erroring.

How the columns lay out:

- **Side by side** with a 10px gutter while the page is at least 560px wide. The two columns scroll
  together as one page.
- **Stacked** (left, then right) on screens too narrow for two, like phones in portrait. This
  follows the window size automatically, including when the screen rotates.
- **Full width** when a tab only uses one column. An empty column takes no space, so a tab
  with everything on one side looks like a normal single-column Rayfield page. The built-in
  settings page uses this.

A section (`CreateSection`) is a heading inside its column, like "Job" and "Breaks" in the example.
Each column's first section sits flush with the top of the page.

## Elements

Every Rayfield Gen2 element works in both columns, with the same properties and methods as Gen2.
Property names are camelCase; PascalCase (`Name`, `Callback`, …) is accepted too.

| Method | Key properties | Handle methods |
| --- | --- | --- |
| `CreateSection` | `name`, `icon` | `MoveUp` / `MoveDown` / `MoveTo` / `MoveToTop` / `MoveToBottom` (all elements) |
| `CreateButton` | `name`, `description`, `icon`, `callback()` | `Lock(reason)`, `Unlock()`, `IsLocked()` |
| `CreateToggle` / `CreateSwitch` | `name`, `value`, `flag`, `callback(bool)` | `Set(value)`, lock |
| `CreateSlider` | `name`, `range = {min, max}`, `increment`, `value`, `suffix`, `callback(value, dragging)` | `Set(value)`, lock |
| `CreateDropdown` | `name`, `options`, `value`, `multiSelect`, `placeholder`, `callback(value)` | `Set`, `Refresh(options)`, `Add`, `Remove`, lock |
| `CreateInput` | `name`, `value`, `placeholder`, `numeric`, `clearOnFocus`, `callback(text)` | `Set(text)`, lock |
| `CreateKeybind` | `name`, `value = Enum.KeyCode.X`, `hold`, `callback(key or held)` | `Set(key)`, lock |
| `CreateColorPicker` | `name`, `color`, `alpha`, `callback(color, alpha)` | `Set(color)`, `SetAlpha`, lock |
| `CreateStat` | `name`, `value`, `prefix`, `suffix`, `display`, `compact` | `Set(value)`, `ResetBaseline()` |
| `CreateProgress` | `name`, `range`, `value`, `steps`, `text`, `format`, `indeterminate` | `Set`, `SetRange`, `SetText`, `SetIndeterminate`, `Remove` |
| `CreateConsole` | `name`, `text`, `height`, `follow`, `maxLines` | `Set`, `Append`, `Clear`, `Copy`, `SetHeight`, `Remove` |
| `CreateText` | `name` (title), `text` (body), `icon` | `Set(text)`, `SetTitle(title)` |
| `CreateDivider` | `text`, `spacing`, `line` | `Set(text)` |
| `CreateGroup` | `direction = "row"` or `"column"` | the `Create…` methods above, for a row of buttons/toggles/stats/sliders or a nested column |

Controls that hold a value (toggle, slider, dropdown, input, keybind, color picker) save to the
config automatically. Their flag comes from the name ("Work Time" becomes `WorkTime`) unless you
pass `flag = "…"`. Pass `forgetState = true` to keep one out of the config.

The full property reference is in the [Rayfield Gen2 docs](https://docs.sirius.menu/rayfield-gen2).
Everything there applies here, and this README covers only what's different.

## Window

`Rayfield:CreateWindow({...})` takes the same options as Gen2:

| Option | What it does |
| --- | --- |
| `name`, `subtitle`, `icon` | The title bar |
| `sidebarLayout` | `true` puts the tabs in a rail on the left instead of across the top |
| `configuration` | `{ autoSave, autoLoad, fileName, customFolder }` for saving settings between sessions |
| `theme` | `"Default"` (the only built-in theme) or a table of theme keys to override |
| `showName`, `showIcon`, `showIconOnly` | What the collapsed pill shows while the window is hidden |
| `locale`, `translations`, `translator` | Localisation, as in Gen2 |

The window object has the same methods as in Gen2: `CreateTab`, `CreateTag`, `CreateSection`
(sidebar headings), `Notify`, `Toast`, `Popup`, `Navigate`, `Show` / `Hide` / `ToggleHide`,
`Save` / `Load` / `ListConfigs` / `DeleteConfig`, `Get` / `Set`, the live `Flags` table, `SetLocale`,
`ChangeTheme` and `Unload`. The menu toggles with **K** by default, and players can rebind it on the
settings page (cog icon).

## Differences from Rayfield Gen2

- Every tab page is two columns (above). All Gen2 elements, tabs, the tab strip and the sidebar
  work as before.
- The window is landscape by default (760×520 with top tabs, 900×540 with the sidebar), so each
  column gets a full-size element. It still shrinks to fit smaller screens.
- **Default is the only built-in theme.** Cobalt, Amethyst, Ember, Frost and Rose are not included.
  Asking for another theme by name falls back to Default with a warning. A custom theme table
  still works if you need your own colours.
- In a column, sliders use Gen2's stacked layout (name and value on top, full-width track below),
  a long dropdown value is shortened with "…", and an input field never grows over its title.
- Configs and settings are saved under `RayfieldColumns/`, separate from an official Rayfield
  install's `Rayfield/` folder.
- The icons secure mode caches are downloaded from this repository instead of Sirius's.
- Fixes to Gen2 behaviour this edition depends on: a dropdown inside a group can now scroll
  its page, and `Progress:Remove()` / `Console:Remove()` no longer error when the element has a
  description.

## Development

The source is a [Rojo](https://rojo.space) project with the same toolchain as Rayfield Gen2, pinned in
[`rokit.toml`](rokit.toml) (Rojo, Lune, StyLua, Selene, luau-lsp, Darklua).

```bash
make install   # install the pinned tools with Rokit
make ci        # format check, lint, typecheck, tests and the coverage gate
make dist      # build dist/RayfieldColumns.luau, the file the loadstring loads
make serve     # serve to Roblox Studio; example.client.luau runs in Play mode
```

| Path | What's there |
| --- | --- |
| `src/components/column.luau` | A column: hosts elements the same way a tab does |
| `src/components/tab.luau` | Builds the two columns and routes the tab's own `Create…` calls |
| `src/utility/columns.luau` | Gutter, stacking breakpoint and side names |
| `tests/components/columns.spec.luau` | Specs for the column layout |
| `tests/integration/dist.spec.luau` | Runs the built `dist` file the way `loadstring` would |
| `dist/RayfieldColumns.luau` | The built, minified bundle. Rebuild it with `make dist` after changing `src` |

The bundler doesn't produce byte-identical output between runs (it orders modules differently each
time), so `make dist` always shows a diff even when `src` hasn't changed. Only commit a rebuild
when `src` has actually changed.

Every source file changed from Gen2 says so in a `Modified for Rayfield Columns` line under its
licence header. The unmodified Gen2 1.2.0 import is its own commit, so `git diff` against it shows
exactly what this edition changes.

## Credits

- **[Rayfield](https://sirius.menu/products/rayfield) and Rayfield Gen2** are made by
  **[Sirius](https://sirius.menu)**. The original Rayfield source credits shlex (design and
  programming), iRay, Max and Damian (programming). Rayfield Gen2 is Copyright © 2026 Corridon
  Capital and published at
  [SiriusSoftwareLtd/rayfield-gen2](https://github.com/SiriusSoftwareLtd/rayfield-gen2). Almost all
  of this library, including the design, animations, elements and config system, is their work.
- **Rayfield Columns** (the two-column layout and the other changes listed above) is a fan-made
  edition maintained at
  [aesthetic143147-arch/Rayfiend-preview-Gen2](https://github.com/aesthetic143147-arch/Rayfiend-preview-Gen2).
- The bundle is built with [Wax](https://github.com/latte-soft/wax) (MIT, Latte Softworks) and
  minified with [Darklua](https://github.com/seaofvoices/darklua).

## License

Rayfield Columns is distributed under the same license as Rayfield Gen2, the
[Mozilla Public License 2.0](LICENSE). Files from Rayfield Gen2 keep their original copyright
notices. If you ship a modified copy, the MPL requires you to keep those notices and make the
source of the files you changed available under the MPL too.
