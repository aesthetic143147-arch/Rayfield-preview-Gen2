local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

return function()
    local Window = helpers.requireComponent("window")
    local columns = helpers.requireUtility("columns")
    local layouts = helpers.requireUtility("layouts")
    local logModule = helpers.requireUtility("log")
    local variables = helpers.requireUtility("variables")

    describe("utility.columns", function()
        it("reads a side from a name in any case, an index, or nothing", function()
            expect(columns.resolveSide(nil)).to.equal("Left")
            expect(columns.resolveSide("Left")).to.equal("Left")
            expect(columns.resolveSide("right")).to.equal("Right")
            expect(columns.resolveSide("RIGHT")).to.equal("Right")
            expect(columns.resolveSide("r")).to.equal("Right")
            expect(columns.resolveSide("l")).to.equal("Left")
            expect(columns.resolveSide(1)).to.equal("Left")
            expect(columns.resolveSide(2)).to.equal("Right")
        end)

        it("gives nothing back for a side that isn't one, so the caller can say so", function()
            expect(columns.resolveSide("middle")).to.equal(nil)
            expect(columns.resolveSide(3)).to.equal(nil)
            expect(columns.resolveSide(true)).to.equal(nil)
        end)

        it("measures the page a window gives, with the rail taken off under a sidebar", function()
            expect(columns.pageWidth(760, layouts.top)).to.equal(740)
            expect(columns.pageWidth(900, layouts.sidebar)).to.equal(900 - layouts.sidebar.railWidth - 20)
            -- a window too small for its own insets is a page of nothing, never a negative one
            expect(columns.pageWidth(10, layouts.top)).to.equal(0)
        end)

        it("stacks only a page that's been measured and is too narrow for two", function()
            expect(columns.shouldStack(0)).to.equal(false)
            expect(columns.shouldStack(columns.stackBelow - 1)).to.equal(true)
            expect(columns.shouldStack(columns.stackBelow)).to.equal(false)
            expect(columns.shouldStack(740)).to.equal(false)
        end)
    end)

    describe("component column", function()
        local window

        local function makeWindow(properties)
            window = Window.new(properties or {
                name = "Columns Window",
                configuration = { autoSave = false, autoLoad = false },
            })
            return window
        end

        -- a window the size the default profile ships at, so the columns sit side by side
        local function wideWindow(properties)
            local w = makeWindow(properties)
            w.size = UDim2.fromOffset(760, 520)
            w:_layoutColumns()
            return w
        end

        local function narrowWindow()
            local w = makeWindow()
            w.size = UDim2.fromOffset(360, 520)
            w:_layoutColumns()
            return w
        end

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("gives every tab a left and a right column, empty until used", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })

            expect(tab.Left.__type).to.equal("Column")
            expect(tab.Right.__type).to.equal("Column")
            expect(tab.left).to.equal(tab.Left)
            expect(tab.right).to.equal(tab.Right)
            expect(tab.Left.main.Parent).to.equal(tab.columnsRow)
            expect(tab.Right.main.Parent).to.equal(tab.columnsRow)
            expect(tab.columnsRow.Parent).to.equal(tab.tabPage)

            -- an unused column takes no room
            expect(tab.Left.main.Visible).to.equal(false)
            expect(tab.Right.main.Visible).to.equal(false)
        end)

        it("builds elements straight into the column they're created on", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })

            local job = tab.Left:CreateSection({ name = "Job" })
            local breaks = tab.Right:CreateSection({ name = "Breaks" })

            expect(job.main.Parent).to.equal(tab.Left.tabPage)
            expect(breaks.main.Parent).to.equal(tab.Right.tabPage)
            expect(tab.Left.elements[1]).to.equal(job)
            expect(tab.Right.elements[1]).to.equal(breaks)

            -- the tab still knows every element on its page, for the window's walks over it
            expect(table.find(tab.elements, job)).never.to.equal(nil)
            expect(table.find(tab.elements, breaks)).never.to.equal(nil)
        end)

        it("puts a tab's own CreateX in the left column unless told otherwise", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })

            local plain = tab:CreateButton({ name = "Go To Work" })
            local right = tab:CreateToggle({ name = "Enable Breaks", side = "Right" })
            local pascal = tab:CreateToggle({ name = "Pascal", Side = "right" })
            local indexed = tab:CreateSlider({ name = "Break Time", range = { 1, 60 }, column = 2 })
            local named = tab:CreateButton({ name = "Named", Column = "Left" })

            expect(plain.tab).to.equal(tab.Left)
            expect(right.tab).to.equal(tab.Right)
            expect(pascal.tab).to.equal(tab.Right)
            expect(indexed.tab).to.equal(tab.Right)
            expect(named.tab).to.equal(tab.Left)

            -- a tab-level call with no props at all still lands somewhere
            expect(tab:CreateDivider().tab).to.equal(tab.Left)
        end)

        it("warns and falls back to the left column for a side that isn't one", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local warned = {}
            local originalWarn = logModule.warn
            logModule.warn = function(...)
                table.insert(warned, table.concat({ ... }, " "))
            end

            local ok, element = pcall(function()
                return tab:CreateButton({ name = "Typo", side = "Middle" })
            end)
            logModule.warn = originalWarn

            expect(ok).to.equal(true)
            expect(element.tab).to.equal(tab.Left)
            expect(#warned).to.equal(1)
            expect(string.find(warned[1], "Middle", 1, true)).never.to.equal(nil)
        end)

        it("looks a column up by side", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            expect(tab:GetColumn()).to.equal(tab.Left)
            expect(tab:GetColumn("Right")).to.equal(tab.Right)
            expect(tab:GetColumn(1)).to.equal(tab.Left)
            expect(tab:GetColumn(2)).to.equal(tab.Right)
        end)

        it("sets two used columns side by side with a gutter between them", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            tab.Left:CreateToggle({ name = "Enable Auto Farm" })
            tab.Right:CreateToggle({ name = "Enable Breaks" })

            expect(tab.stacked).to.equal(false)
            expect(tab.Left.main.Visible).to.equal(true)
            expect(tab.Right.main.Visible).to.equal(true)
            expect(tab.columnsLayout.FillDirection).to.equal(Enum.FillDirection.Horizontal)

            -- each takes half the row and half the overlap, and the layout pulls them together by
            -- the whole overlap, so between them they span exactly the row
            local half = UDim2.new(0.5, columns.overlap / 2, 0, 0)
            expect(tab.Left.main.Size).to.equal(half)
            expect(tab.Right.main.Size).to.equal(half)
            expect(tab.columnsLayout.Padding).to.equal(UDim.new(0, -columns.overlap))
        end)

        it("gives the whole page to a column when the other holds nothing", function()
            local tab = wideWindow():CreateTab({ name = "Solo" })
            tab.Right:CreateToggle({ name = "Only" })

            expect(tab.Left.main.Visible).to.equal(false)
            expect(tab.Right.main.Visible).to.equal(true)
            expect(tab.Right.main.Size).to.equal(UDim2.fromScale(1, 0))
            expect(tab.columnsLayout.Padding).to.equal(UDim.new(0, 0))
        end)

        it("stacks the columns on a page too narrow for two", function()
            local tab = narrowWindow():CreateTab({ name = "Auto" })
            tab.Left:CreateToggle({ name = "Enable Auto Farm" })
            tab.Right:CreateToggle({ name = "Enable Breaks" })

            expect(tab.stacked).to.equal(true)
            expect(tab.columnsLayout.FillDirection).to.equal(Enum.FillDirection.Vertical)
            expect(tab.Left.main.Size).to.equal(UDim2.fromScale(1, 0))
            expect(tab.Right.main.Size).to.equal(UDim2.fromScale(1, 0))
            -- left reads first, then right, with room between them like a section's
            expect(tab.Left.main.LayoutOrder < tab.Right.main.LayoutOrder).to.equal(true)
            expect(tab.columnsLayout.Padding.Offset > 0).to.equal(true)
        end)

        it("stacks every tab when the screen shrinks, and puts them back when it grows", function()
            local originalCamera = variables.workspace.CurrentCamera
            local function setViewport(x, y)
                variables.workspace.CurrentCamera = {
                    ViewportSize = Vector2.new(x, y),
                    GetPropertyChangedSignal = function()
                        return helpers.makeSignal()
                    end,
                }
            end

            setViewport(1920, 1080)
            local w = makeWindow()
            w.hidden = false
            w:_applyWindowSize()

            local first = w:CreateTab({ name = "First" })
            local second = w:CreateTab({ name = "Second" })
            for _, tab in { first, second } do
                tab.Left:CreateButton({ name = "Left" })
                tab.Right:CreateButton({ name = "Right" })
            end
            expect(first.stacked).to.equal(false)
            expect(second.stacked).to.equal(false)

            -- a portrait phone: far too narrow for two columns
            setViewport(390, 844)
            w:_applyWindowSize()
            expect(first.stacked).to.equal(true)
            expect(second.stacked).to.equal(true)

            setViewport(1920, 1080)
            w:_applyWindowSize()
            expect(first.stacked).to.equal(false)
            expect(second.stacked).to.equal(false)

            variables.workspace.CurrentCamera = originalCamera
        end)

        it("leaves the room above a column's first section out, and keeps it for later ones", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })

            local job = tab.Left:CreateSection({ name = "Job" })
            local breaks = tab.Right:CreateSection({ name = "Breaks" })
            tab.Left:CreateToggle({ name = "Enable Auto Farm" })
            local mood = tab.Left:CreateSection({ name = "Mood" })

            -- both columns start with a heading that sits flush with the top of the page
            expect(job.main.Size.Y.Offset).to.equal(20)
            expect(breaks.main.Size.Y.Offset).to.equal(20)
            expect(mood.main.Size.Y.Offset > 20).to.equal(true)
        end)

        it("shows a slim, themed scrollbar on a page, clear of the elements", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            local page = tab.tabPage

            expect(page.ScrollBarThickness > 0).to.equal(true)
            expect(page.ScrollBarThickness <= 10).to.equal(true) -- fits the page's 10px side margin
            expect(page.ScrollBarImageTransparency < 1).to.equal(true)
            expect(page.VerticalScrollBarInset).to.equal(Enum.ScrollBarInset.None)
            expect(page.ScrollBarImageColor3).to.equal(w.theme.ContentColor)
            expect(w.searchPage.ScrollBarThickness).to.equal(page.ScrollBarThickness)

            -- it follows the theme like the rest of the page
            w:ChangeTheme("Frost")
            expect(page.ScrollBarImageColor3).to.equal(w.theme.ContentColor)
        end)

        it("takes every element a tab takes", function()
            local tab = wideWindow():CreateTab({ name = "Everything" })

            for _, column in { tab.Left, tab.Right } do
                local built = {
                    column:CreateSection({ name = "Section" }),
                    column:CreateButton({ name = "Button" }),
                    column:CreateToggle({ name = "Toggle" }),
                    column:CreateSwitch({ name = "Switch" }),
                    column:CreateSlider({ name = "Slider", range = { 0, 10 } }),
                    column:CreateDropdown({ name = "Dropdown", options = { "A", "B" } }),
                    column:CreateInput({ name = "Input" }),
                    column:CreateKeybind({ name = "Keybind" }),
                    column:CreateColorPicker({ name = "Colour" }),
                    column:CreateStat({ name = "Stat", value = 1 }),
                    column:CreateProgress({ name = "Progress", value = 0.5 }),
                    column:CreateConsole({ name = "Console" }),
                    column:CreateText({ name = "Text", text = "Body" }),
                    column:CreateDivider({ text = "or" }),
                    column:CreateGroup({ direction = "row" }),
                }

                for index, element in built do
                    expect(element.tab).to.equal(column)
                    expect(element.main.Parent).to.equal(column.tabPage)
                    expect(column.elements[index]).to.equal(element)
                    expect(table.find(tab.elements, element)).never.to.equal(nil)
                end
            end
        end)

        it("gives each column its own flags on the window, unique across both", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })

            local farm = tab.Left:CreateToggle({ name = "Enable Auto Farm", value = true })
            local breaks = tab.Right:CreateToggle({ name = "Enable Auto Farm" })

            expect(farm.flag).never.to.equal(breaks.flag)
            expect(w.controls[farm.flag]).to.equal(farm)
            expect(w.controls[breaks.flag]).to.equal(breaks)
            expect(w.Flags[farm.flag]).to.equal(true)

            w.Flags[breaks.flag] = true
            expect(breaks.value).to.equal(true)
        end)

        it("keeps the settings tab's controls out of the config from inside a column", function()
            local w = wideWindow()
            for _, element in w.rfSettings.elements do
                expect(element.forgetState == true or element.flag == nil).to.equal(true)
            end
            expect(w.rfSettings.Left.forgetState).to.equal(true)
        end)

        it("reorders an element within its own column", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local first = tab.Left:CreateButton({ name = "First" })
            local second = tab.Left:CreateButton({ name = "Second" })
            local other = tab.Right:CreateButton({ name = "Other" })

            second:MoveToTop()
            expect(tab.Left.elements[1]).to.equal(second)
            expect(second.main.LayoutOrder < first.main.LayoutOrder).to.equal(true)

            second:MoveDown()
            expect(tab.Left.elements[2]).to.equal(second)
            expect(first.main.LayoutOrder < second.main.LayoutOrder).to.equal(true)

            -- the other column is none of its business
            expect(#tab.Right.elements).to.equal(1)
            expect(tab.Right.elements[1]).to.equal(other)

            -- a move asked of an element the column doesn't hold does nothing
            tab.Left:_moveElement(other, 1)
            expect(tab.Left.elements[1]).to.equal(first)
        end)

        it("reveals down both columns together, not one after the other", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })

            local leftTop = tab.Left:CreateButton({ name = "Left Top" })
            local leftLow = tab.Left:CreateButton({ name = "Left Low" })
            local rightTop = tab.Right:CreateButton({ name = "Right Top" })
            local rightLow = tab.Right:CreateButton({ name = "Right Low" })

            leftTop.main.AbsolutePosition = Vector2.new(20, 0)
            leftLow.main.AbsolutePosition = Vector2.new(20, 50)
            rightTop.main.AbsolutePosition = Vector2.new(400, 0)
            rightLow.main.AbsolutePosition = Vector2.new(400, 50)
            tab.tabPage.AbsolutePosition = Vector2.new(0, 0)
            tab.tabPage.AbsoluteWindowSize = Vector2.new(740, 400)

            local order = {}
            for _, element in tab.elements do
                element._setShown = function(self, shown)
                    if shown then
                        table.insert(order, self)
                    end
                end
            end

            w.selectedTab = tab
            w:_revealElements(0.01, 1)

            expect(order[1]).to.equal(leftTop)
            expect(order[2]).to.equal(rightTop)
            expect(order[3]).to.equal(leftLow)
            expect(order[4]).to.equal(rightLow)
        end)

        it("scrolls the tab's page when a dropdown in a column opens past the fold", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            local drop = tab.Right:CreateDropdown({
                name = "Select Job",
                options = { "A", "B", "C", "D", "E", "F" },
                forgetState = true,
            })

            -- the column isn't what scrolls, the page under both columns is
            expect(drop.tab.scrollPage).to.equal(tab.tabPage)

            local page = tab.tabPage
            page.AbsolutePosition = Vector2.new(0, 0)
            page.AbsoluteWindowSize = Vector2.new(740, 300)
            page.CanvasPosition = Vector2.new(0, 0)
            drop.main.AbsolutePosition = Vector2.new(400, 260)

            drop:_bringIntoView()
            expect(page.CanvasPosition.Y > 0).to.equal(true)
        end)

        it("scrolls the page from a dropdown in a group inside a column too", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local group = tab.Left:CreateGroup({ direction = "column" })
            local drop = group:CreateDropdown({ name = "Nested", options = { "A" }, forgetState = true })

            expect(group.scrollPage).to.equal(tab.tabPage)
            expect(drop.tab.scrollPage).to.equal(tab.tabPage)
        end)

        it("fits a long dropdown value into half the header, and ellipsizes the rest", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local drop = tab.Left:CreateDropdown({
                name = "Select Job",
                options = { "PizzaPlanetBaker" },
                value = "PizzaPlanetBaker",
                forgetState = true,
            })

            expect(drop.selectedLabel.Size.X.Scale).to.equal(0.5)
            expect(drop.selectedLabel.TextTruncate).to.equal(Enum.TextTruncate.AtEnd)
            local constraint = drop.selectedLabel:FindFirstChild("UISizeConstraint")
            expect(constraint).never.to.equal(nil)
            expect(constraint.MaxSize.X).to.equal(168)
        end)

        it("stacks a slider in a column, and keeps a full-width one wide", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local slider = tab.Right:CreateSlider({ name = "Work Time", range = { 5, 120 }, suffix = "min" })

            -- the shim holds AbsoluteSize as a plain field, so say it changed the way the engine would
            local function measure(width)
                slider.main.AbsoluteSize = Vector2.new(width, 70)
                slider.main:GetPropertyChangedSignal("AbsoluteSize"):Fire()
            end

            -- the whole page: the title block on the left, the fixed track on the right
            measure(720)
            expect(slider._layoutMode).to.equal("wide")
            expect(slider.track.Size).to.equal(UDim2.new(0, 222, 0, 14))

            -- a half-page column: title and value over a full-width track
            measure(355)
            expect(slider._layoutMode).to.equal("narrow")
            expect(slider.track.Size).to.equal(UDim2.new(1, -30, 0, 14))
        end)

        it("keeps an input's field off its title in a column", function()
            local tab = wideWindow():CreateTab({ name = "Auto" })
            local input = tab.Left:CreateInput({
                name = "Player Name",
                value = string.rep("a very long player name ", 6),
                forgetState = true,
            })

            local function measure(width)
                input.main.AbsoluteSize = Vector2.new(width, 41)
                input.main:GetPropertyChangedSignal("AbsoluteSize"):Fire()
            end

            measure(355)
            expect(input.box.Size.X.Offset <= 355 - (20 + 150 + 5 + 7)).to.equal(true)

            -- a full-width row gives it the most it ever takes, and no more
            measure(720)
            expect(input.box.Size.X.Offset).to.equal(220)

            -- a row too narrow for anything still leaves a readable pill
            measure(150)
            expect(input.box.Size.X.Offset).to.equal(70)

            -- widths swept through while the window animates aren't settled on
            input.window.animating = true
            measure(720)
            expect(input.box.Size.X.Offset).to.equal(70)
            input.window.animating = false
        end)

        it("finds a keybind in a column when the menu key is checked for a clash", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            local sprint = tab.Right:CreateKeybind({ name = "Sprint", value = Enum.KeyCode.LeftShift })

            expect(w:_keybindUsing(Enum.KeyCode.LeftShift)).to.equal(sprint)
        end)

        it("searches elements in both columns and puts each back in its own", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            local farm = tab.Left:CreateToggle({ name = "Enable Auto Farm" })
            local breaks = tab.Right:CreateToggle({ name = "Enable Breaks" })
            w:Show()

            w.searchAction.interact.MouseButton1Click:Fire()
            expect(farm.main.Parent).to.equal(w.searchPage)
            expect(breaks.main.Parent).to.equal(w.searchPage)

            w.searchInput.Text = "breaks"
            w.searchInput:GetPropertyChangedSignal("Text"):Fire()
            expect(farm.main.Visible).to.equal(false)
            expect(breaks.main.Visible).to.equal(true)

            w.searchAction.interact.MouseButton1Click:Fire()
            expect(farm.main.Parent).to.equal(tab.Left.tabPage)
            expect(breaks.main.Parent).to.equal(tab.Right.tabPage)
        end)

        it("leaves nothing connected or registered once its tab is removed", function()
            local w = wideWindow()
            local connectionsBefore = #w.connections

            local tab = w:CreateTab({ name = "Doomed" })
            tab.Left:CreateToggle({ name = "Doomed Toggle" })
            tab.Right:CreateSlider({ name = "Doomed Slider", range = { 0, 10 } })
            tab.Right:CreateConsole({ name = "Doomed Console" })
            expect(#w.connections > connectionsBefore).to.equal(true)

            tab:Remove()
            expect(#w.connections).to.equal(connectionsBefore)
            expect(w.controls.DoomedToggle).to.equal(nil)
            expect(#tab.Left.elements).to.equal(0)
            expect(#tab.Right.elements).to.equal(0)
            expect(tab.columnsRow).to.equal(nil)
        end)

        it("takes a removed progress bar or console out of its column, description and all", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            tab.Left:CreateButton({ name = "Stays" })
            local bar = tab.Right:CreateProgress({ name = "Download", description = "Below the bar." })
            local console = tab.Right:CreateConsole({ name = "Output", description = "Below the block." })
            local connectionsWithConsole = #w.connections

            bar:Remove()
            expect(table.find(tab.Right.elements, bar)).to.equal(nil)
            expect(table.find(tab.elements, bar)).to.equal(nil)
            expect(bar.descriptor.main).to.equal(nil)
            expect(tab.Right.main.Visible).to.equal(true)

            console:Remove()
            expect(table.find(tab.Right.elements, console)).to.equal(nil)
            expect(#w.connections < connectionsWithConsole).to.equal(true)

            -- the right column is empty now, so the left one takes the page back
            expect(tab.Right.main.Visible).to.equal(false)
            expect(tab.Left.main.Size).to.equal(UDim2.fromScale(1, 0))
        end)

        it("reveals an element added to a column after the window is open", function()
            local w = wideWindow()
            local tab = w:CreateTab({ name = "Auto" })
            w.hidden = false

            local late = tab.Right:CreateToggle({ name = "Late" })
            expect(late.title.TextTransparency).to.equal(0)
        end)

        it("restores a saved value into an element built in a column after the config loaded", function()
            local w = wideWindow()
            w._loadedConfig = { LateToggle = true }
            local tab = w:CreateTab({ name = "Auto" })

            local late = tab.Right:CreateToggle({ name = "Late Toggle", flag = "LateToggle" })
            expect(late.value).to.equal(true)
        end)

        it("lays the columns out under a sidebar from the card's width", function()
            local w = makeWindow({
                name = "Sidebar",
                sidebarLayout = true,
                configuration = { autoSave = false, autoLoad = false },
            })
            w.size = UDim2.fromOffset(900, 540)
            w:_layoutColumns()
            local tab = w:CreateTab({ name = "Auto", icon = 1 })
            tab.Left:CreateButton({ name = "Left" })
            tab.Right:CreateButton({ name = "Right" })
            expect(tab.stacked).to.equal(false)

            -- the same window with less room: the rail's share leaves too little for two
            w.size = UDim2.fromOffset(700, 540)
            w:_layoutColumns()
            expect(tab.stacked).to.equal(true)
        end)
    end)
end
