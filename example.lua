-- Rayfield Columns example: the "Omnity" Auto page, in two columns.
-- Paste into your executor.

local source =
    "https://raw.githubusercontent.com/aesthetic143147-arch/Rayfield-preview-Gen2/main/dist/RayfieldColumns.luau"
local Rayfield = loadstring(game:HttpGet(source))()

local Window = Rayfield:CreateWindow({
    name = "Omnity",
    configuration = {
        autoSave = true,
        autoLoad = true,
        fileName = "Omnity",
    },
})

Window:CreateTag({ text = "Bloxburg", color = Color3.fromRGB(235, 90, 215) })

local Auto = Window:CreateTab({ name = "Auto", icon = 84750991656135 })

-- Left column ---------------------------------------------------------------
Auto.Left:CreateSection({ name = "Job" })

Auto.Left:CreateDropdown({
    name = "Select Job",
    options = { "PizzaPlanetBaker", "PizzaPlanetCashier", "BensIceCreamSeller" },
    value = "PizzaPlanetBaker",
    callback = function(job)
        print("Job:", job)
    end,
})

Auto.Left:CreateToggle({
    name = "Enable Auto Farm",
    value = true,
    callback = function(enabled)
        print("Auto Farm:", enabled)
    end,
})

Auto.Left:CreateButton({
    name = "Go To Work",
    callback = function()
        Window:Toast({ title = "Heading to work" })
    end,
})

Auto.Left:CreateSection({ name = "Mood" })

local MoodStatus = Auto.Left:CreateText({ name = "Mood Status", text = "Waiting" })

Auto.Left:CreateSlider({ name = "Mood % To Enable At", range = { 0, 100 }, value = 20, suffix = "%" })

Auto.Left:CreateToggle({
    name = "Enable Auto Mood",
    callback = function(enabled)
        MoodStatus:Set(if enabled then "Watching your mood" else "Waiting")
    end,
})

-- Right column --------------------------------------------------------------
Auto.Right:CreateSection({ name = "Breaks" })

Auto.Right:CreateSlider({ name = "Work Time", range = { 5, 120 }, increment = 5, value = 30, suffix = "min" })
Auto.Right:CreateSlider({ name = "Break Time", range = { 5, 60 }, increment = 5, value = 20, suffix = "min" })
Auto.Right:CreateToggle({ name = "Enable Breaks" })

Auto.Right:CreateSection({ name = "Statistics" })

local Earnings = Auto.Right:CreateStat({ name = "Shift Earnings", prefix = "$", value = 349 })
Auto.Right:CreateStat({ name = "Efficiency", suffix = "%", value = 92 })

-- update a stat from your own code whenever the number changes
task.spawn(function()
    while not Window.unloaded do
        task.wait(10)
        Earnings:Set(Earnings.value + math.random(5, 25))
    end
end)

-- A floating OMNITY nameplate over your head (and, with a relay endpoint, over every other
-- Omnity user in the server). Players set their own image or GIF in settings -> Nameplate.
local Plates = Window:CreateNameplate({ title = "OMNITY", endpoint = nil })

-- Community tab: a chat room backed by your Discord channel ---------------------------------
-- Run the relay in relay/ (see relay/README.md) and put its address in `endpoint`. Until then
-- the chat shows "Not connected".
local Community = Window:CreateTab({ name = "Community", icon = 84750991656135 })

Community.Left:CreateSection({ name = "Chat" })
Community.Left:CreateChat({
    name = "Omnity Chat",
    endpoint = nil, -- e.g. "https://your-relay.example.com"
    channel = "general",
    height = 300,
})

Community.Right:CreateSection({ name = "About" })
Community.Right:CreateText({
    name = "Talk to everyone",
    text = "Messages here are posted in our Discord server, and replies from Discord show up here.",
})
