local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

-- The file people actually load is dist/RayfieldColumns.luau, a bundle of src built by `make dist`.
-- This runs that file the way an executor's loadstring would, so a broken or stale-shaped bundle
-- fails here rather than in someone's game. Studio has no file access, so there it's skipped.
return function()
    if not helpers.loadBundle then
        return
    end

    describe("dist bundle", function()
        local window

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("loads and builds a two-column page", function()
            local Rayfield = helpers.loadBundle("dist/RayfieldColumns.luau")
            expect(type(Rayfield)).to.equal("table")
            expect(type(Rayfield.CreateWindow)).to.equal("function")

            window = Rayfield:CreateWindow({
                name = "Omnity",
                configuration = { autoSave = false, autoLoad = false },
            })
            window:CreateTag({ text = "Bloxburg" })

            local auto = window:CreateTab({ name = "Auto", icon = 84750991656135 })
            auto.Left:CreateSection({ name = "Job" })
            local job = auto.Left:CreateDropdown({
                name = "Select Job",
                options = { "PizzaPlanetBaker" },
                value = "PizzaPlanetBaker",
            })
            auto.Right:CreateSection({ name = "Breaks" })
            local work = auto.Right:CreateSlider({ name = "Work Time", range = { 5, 120 }, value = 30, suffix = "min" })
            local breaks = auto:CreateToggle({ name = "Enable Breaks", side = "Right" })

            expect(job.main.Parent).to.equal(auto.Left.main)
            expect(work.main.Parent).to.equal(auto.Right.main)
            expect(breaks.tab).to.equal(auto.Right)
            expect(window.Flags.WorkTime).to.equal(30)
            expect(window.Flags.SelectJob[1]).to.equal("PizzaPlanetBaker")
        end)

        it("starts on the default theme and ships every built-in one", function()
            local Rayfield = helpers.loadBundle("dist/RayfieldColumns.luau")
            window = Rayfield:CreateWindow({
                name = "Theme",
                configuration = { autoSave = false, autoLoad = false },
            })
            expect(window.theme.AccentColor).to.equal(Color3.fromRGB(23, 153, 110))

            local accents = {
                Amethyst = Color3.fromRGB(168, 110, 246),
                Cobalt = Color3.fromRGB(48, 120, 240),
                Ember = Color3.fromRGB(240, 142, 40),
                Frost = Color3.fromRGB(0, 176, 208),
                Rose = Color3.fromRGB(240, 82, 138),
                Default = Color3.fromRGB(23, 153, 110),
            }
            for name, accent in accents do
                window:ChangeTheme(name)
                expect(window.theme.AccentColor).to.equal(accent)
            end
        end)
    end)
end
