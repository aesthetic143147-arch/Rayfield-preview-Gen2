-- Rayfield Columns example: the "Pulse" hub, laid out in two columns.
-- In Studio this runs from Rojo against ReplicatedStorage.Rayfield. From an executor, load the
-- bundle instead (see example.lua):
--   local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/aesthetic143147-arch/cwk-assets/main/rayfield-columns/dist/RayfieldColumns.luau"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rayfield = require(ReplicatedStorage.Rayfield)

-- Let the viewport settle before opening, so the window fits to the full screen size.
task.wait(2)

local Window = Rayfield:CreateWindow({
    name = "Pulse",
    configuration = {
        autoSave = true,
        autoLoad = true,
        fileName = "Pulse",
    },
})

-- the badge beside the title
Window:CreateTag({ text = "Bloxburg", color = Color3.fromRGB(235, 90, 215) })

-- Home ----------------------------------------------------------------------
-- A tab can be an icon alone, like the home button at the start of the strip.
local Home = Window:CreateTab({ icon = 93364949241311 })

Home.Left:CreateSection({ name = "Welcome" })
Home.Left:CreateText({
    name = "Pulse",
    text = "Everything is split into two columns. Build into Tab.Left and Tab.Right, "
        .. 'or pass side = "Right" to a tab\'s own Create call.',
})

Home.Right:CreateSection({ name = "Session" })
local Uptime = Home.Right:CreateStat({ name = "Session Time", suffix = "min", value = 0 })

task.spawn(function()
    while not Window.unloaded do
        task.wait(60)
        Uptime:Set(Uptime.value + 1)
    end
end)

-- Auto ----------------------------------------------------------------------
local Auto = Window:CreateTab({ name = "Auto", icon = 84750991656135 })

-- Left column
local Left = Auto.Left

Left:CreateSection({ name = "Job" })

Left:CreateDropdown({
    name = "Select Job",
    options = { "PizzaPlanetBaker", "PizzaPlanetCashier", "BensIceCreamSeller", "StylezHairStylist" },
    value = "PizzaPlanetBaker",
    callback = function(job)
        print("Job:", job)
    end,
})

Left:CreateToggle({
    name = "Enable Auto Farm",
    value = true,
    callback = function(enabled)
        print("Auto Farm:", enabled)
    end,
})

Left:CreateButton({
    name = "Go To Work",
    callback = function()
        Window:Toast({ title = "Heading to work" })
    end,
})

Left:CreateSection({ name = "Mood" })

local MoodStatus = Left:CreateText({ name = "Mood Status", text = "Waiting" })

Left:CreateSlider({
    name = "Mood % To Enable At",
    range = { 0, 100 },
    increment = 1,
    value = 20,
    suffix = "%",
})

Left:CreateToggle({
    name = "Enable Auto Mood",
    callback = function(enabled)
        MoodStatus:Set(if enabled then "Watching your mood" else "Waiting")
    end,
})

-- Right column
local Right = Auto.Right

Right:CreateSection({ name = "Breaks" })

Right:CreateSlider({
    name = "Work Time",
    range = { 5, 120 },
    increment = 5,
    value = 30,
    suffix = "min",
})

Right:CreateSlider({
    name = "Break Time",
    range = { 5, 60 },
    increment = 5,
    value = 20,
    suffix = "min",
})

Right:CreateToggle({ name = "Enable Breaks" })

Right:CreateSection({ name = "Statistics" })

local Earnings = Right:CreateStat({ name = "Shift Earnings", prefix = "$", value = 349 })
Right:CreateStat({ name = "Efficiency", suffix = "%", value = 92 })

Right:CreateButton({
    name = "Simulate Shift",
    callback = function()
        Earnings:Set(Earnings.value + math.random(20, 120))
    end,
})

-- Elements ------------------------------------------------------------------
-- Every Rayfield Gen2 element works in either column. `side` on a tab's own Create call picks the
-- column, so code written for a single-column Rayfield page still runs (it lands on the left).
local Elements = Window:CreateTab({ name = "Elements", icon = 100604009889706 })

Elements:CreateSection({ name = "Input" })
Elements:CreateInput({ name = "Player Name", placeholder = "Enter a name" })
Elements:CreateKeybind({ name = "Sprint", value = Enum.KeyCode.LeftShift })
Elements:CreateColorPicker({ name = "Highlight", color = Color3.fromRGB(235, 90, 215) })
Elements:CreateDropdown({
    name = "Modules",
    multiSelect = true,
    options = { "Aimbot", "ESP", "Triggerbot", "Fly" },
    value = { "ESP" },
    placeholder = "None selected",
})

Elements:CreateSection({ name = "Output", side = "Right" })

local Download = Elements:CreateProgress({ name = "Download", range = { 0, 100 }, value = 35, side = "Right" })

Elements:CreateSlider({
    name = "Download progress",
    range = { 0, 100 },
    value = 35,
    suffix = "%",
    forgetState = true,
    side = "Right",
    callback = function(value)
        Download:Set(value)
    end,
})

local Console = Elements:CreateConsole({
    name = "Console",
    text = "-- output lands here",
    height = 110,
    follow = true,
    side = "Right",
})

local Actions = Elements.Right:CreateGroup()

Actions:CreateButton({
    name = "Log a line",
    callback = function()
        Console:Append(string.format("[%s] player joined", os.date("%H:%M:%S")))
    end,
})

Actions:CreateButton({
    name = "Clear",
    callback = function()
        Console:Clear()
    end,
})

Window:Navigate("Auto")
