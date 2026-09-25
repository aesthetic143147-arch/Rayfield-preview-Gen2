local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

return function()
    local Window = helpers.requireComponent("window")
    local windowSizing = helpers.requireUtility("windowSizing")

    describe("component dropdown list", function()
        local window

        -- mirrors the option geometry in dropdown.luau, so a row is worth the same here
        local optionHeight = 38
        local optionGap = 5
        local rowStride = optionHeight + optionGap

        local function makeWindow()
            window = Window.new({
                name = "Dropdown Window",
                configuration = { autoSave = false, autoLoad = false },
            })
            window.hidden = false
            return window
        end

        -- the page is the window's height less the chrome above the elements frame, so a page
        -- of a given height is a window of that height plus the chrome
        local windowChromeHeight = windowSizing.profile("top").chromeHeight

        local function makePage(height)
            window.size = UDim2.fromOffset(400, height + windowChromeHeight)
            local tab = window:CreateTab({ name = "Main" })
            tab.tabPage.AbsolutePosition = Vector2.new(0, 0)
            tab.tabPage.AbsoluteWindowSize = Vector2.new(400, height)
            return tab
        end

        local function options(count)
            local names = {}
            for index = 1, count do
                table.insert(names, "Option " .. index)
            end
            return names
        end

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("keeps its borders outside the frame that clips its contents", function()
            makeWindow()
            local tab = makePage(400)
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta" },
                value = "Alpha",
                forgetState = true,
            })

            -- a stroke is drawn outside the frame it belongs to, and both cards fill the wrapper
            -- exactly, so a clip there takes the border off each of them. unset reads as nil in
            -- the harness, which is the same thing as not clipping.
            expect(drop.main.ClipsDescendants or false).to.equal(false)

            -- the options card is what has contents to hide while collapsed, so the cut is its own
            expect(drop.panel.ClipsDescendants).to.equal(true)
            expect(drop.panelStroke).to.be.ok()
        end)

        it("lifts the header stroke on hover the way every other element does", function()
            makeWindow()
            local tab = makePage(400)
            local drop = tab:CreateDropdown({ name = "Choice", options = { "Alpha" }, forgetState = true })

            window.theme.ElementStrokeTransparency = 0.4
            window.theme.ElementStrokeHoverTransparency = 0.05
            window.theme.ElementStroke = Color3.fromRGB(35, 35, 35)
            window.theme.ElementStrokeHover = Color3.fromRGB(80, 80, 80)
            drop.stroke.Transparency = 0.4
            drop.stroke.Color = window.theme.ElementStroke

            -- the closed card carries the plain themed stroke, so both halves move exactly as
            -- Window:_wireElementHover moves them everywhere else
            drop.main.MouseEnter:Fire()
            expect(drop.stroke.Transparency).to.equal(0.05)
            expect(drop.stroke.Color).to.equal(window.theme.ElementStrokeHover)
            expect(drop.hoverOverlay.BackgroundTransparency).to.equal(0.97)

            drop.main.MouseLeave:Fire()
            expect(drop.stroke.Transparency).to.equal(0.4)
            expect(drop.stroke.Color).to.equal(window.theme.ElementStroke)
        end)

        it("leaves the stroke where it is while the card is open", function()
            makeWindow()
            local tab = makePage(400)
            local drop = tab:CreateDropdown({ name = "Choice", options = { "Alpha" }, forgetState = true })

            window.theme.ElementStrokeTransparency = 0.4
            window.theme.ElementStrokeHoverTransparency = 0.05
            drop.stroke.Transparency = 0.4

            drop:_open()
            drop.main.MouseEnter:Fire()
            expect(drop.stroke.Transparency).to.equal(0.4)
        end)

        it("opens to four rows when the page has room for them", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(2), forgetState = true })

            local two = drop:_openHeight()

            drop:Refresh(options(4))
            local four = drop:_openHeight()
            expect(four - two).to.equal(rowStride * 2)

            -- past four it scrolls rather than growing without end
            drop:Refresh(options(9))
            expect(drop:_openHeight()).to.equal(four)
        end)

        it("never opens taller than the page it sits on", function()
            makeWindow()
            -- the shortest page the window can hand an element: the sizing floor less the chrome
            -- above the elements frame
            local shortPage = windowSizing.pageHeight(windowSizing.profile("top").minSize.Y, "top")
            local tab = makePage(shortPage)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(9), forgetState = true })

            drop:_open()
            local squeezed = drop:_openHeight()
            expect(squeezed <= shortPage).to.equal(true)
            expect(drop.main.Size.Y.Offset <= shortPage).to.equal(true)

            -- still a card, not a sliver: the header and at least one option are in there
            expect(squeezed > 41).to.equal(true)

            -- the same list on a page with room opens further, so the cap is the page not the list
            local roomy = makePage(500)
            local other = roomy:CreateDropdown({ name = "Choice", options = options(9), forgetState = true })
            expect(other:_openHeight() > squeezed).to.equal(true)
        end)

        it("counts the search bar and the actions row against the page", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(9), forgetState = true })
            local multi = tab:CreateDropdown({
                name = "Many",
                options = options(9),
                multiSelect = true,
                forgetState = true,
            })

            -- both cap at four rows, and the multi-select carries a bulk actions row on top
            expect(multi:_openHeight() > drop:_openHeight()).to.equal(true)

            -- the bar grows when it takes focus, so the card owes it the difference
            local closed = drop:_openHeight()
            drop._searchOpen = true
            expect(drop:_openHeight() - closed).to.equal(8)
            drop._searchOpen = false
            expect(drop:_openHeight()).to.equal(closed)
        end)

        it("falls back to the smallest page there can be before anything is laid out", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(9), forgetState = true })

            local measured = drop:_openHeight()

            -- no size to read yet, so the card falls back to the smallest page a window can
            -- have rather than to four rows it might have no room for
            local sized = window.size
            window.size = nil
            local unmeasured = drop:_openHeight()
            window.size = sized

            expect(unmeasured < measured).to.equal(true)
            expect(unmeasured < windowSizing.profile("top").minSize.Y).to.equal(true)
        end)

        it("scrolls the options that dont fit rather than dropping them", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(9), forgetState = true })

            -- every option is still there to reach, capped card or not
            expect(#drop._optionFrames).to.equal(9)
            expect(drop.list.ClipsDescendants).to.equal(true)
            expect(drop.list.AutomaticCanvasSize).to.equal(Enum.AutomaticSize.Y)
            expect(drop.list.ScrollingDirection).to.equal(Enum.ScrollingDirection.Y)

            -- the list renders no lower than the card it sits in, or the card would cover it
            expect(drop.list.ZIndex >= drop.panel.ZIndex).to.equal(true)

            drop:_open()
            drop.list.AbsoluteWindowSize = Vector2.new(300, 4 * rowStride)
            drop.list.AbsoluteCanvasSize = Vector2.new(300, 9 * rowStride)
            drop.list.CanvasPosition = Vector2.new(0, 0)
            drop:_syncScrollHint()
            expect(drop.list.ScrollBarImageTransparency < 1).to.equal(true)

            -- scrolled to the end, so there is nothing left to point at
            drop.list.CanvasPosition = Vector2.new(0, 5 * rowStride)
            drop:_syncScrollHint()
            expect(drop.list.ScrollBarImageTransparency).to.equal(1)

            -- and a filtered list that now fits never shows one
            drop.list.AbsoluteCanvasSize = Vector2.new(300, 2 * rowStride)
            drop.list.CanvasPosition = Vector2.new(0, 0)
            drop:_syncScrollHint()
            expect(drop.list.ScrollBarImageTransparency).to.equal(1)
        end)

        it("filters the list without losing the rows it hides", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta", "Gamma", "Delta", "Epsilon" },
                forgetState = true,
            })

            drop:_open()
            local all = drop:_openHeight()

            drop:_applyFilter("a")
            expect(drop._optionFrames[2].frame.Visible).to.equal(true) -- Beta
            expect(drop._optionFrames[5].frame.Visible).to.equal(false) -- Epsilon

            drop:_applyFilter("alp")
            expect(drop:_openHeight() < all).to.equal(true)
            expect(drop.emptyLabel.Visible).to.equal(false)

            -- a search that matches nothing keeps a row of room to say so
            drop:_applyFilter("zzz")
            expect(drop.emptyLabel.Visible).to.equal(true)

            drop:_applyFilter("")
            expect(drop.emptyLabel.Visible).to.equal(false)
            expect(drop:_openHeight()).to.equal(all)
        end)

        it("re-selects a pending option once it arrives, through Refresh or Add", function()
            makeWindow()
            local tab = makePage(500)
            local handed
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha" },
                value = "Gamma", -- restored from a config, its option not built yet
                forgetState = true,
                callback = function(value)
                    handed = value
                end,
            })

            expect(#drop.value).to.equal(0)

            drop:Add("Gamma")
            expect(drop.value[1]).to.equal("Gamma")
            expect(handed).to.equal("Gamma")

            -- and the same intent survives a rebuild that takes the option away and gives it back
            drop:Refresh({ "Alpha", "Beta" })
            expect(#drop.value).to.equal(0)
            drop:Refresh({ "Alpha", "Gamma" })
            expect(drop.value[1]).to.equal("Gamma")
            expect(#drop._optionFrames).to.equal(2)
        end)

        it("re-points a reused row at its new option, not the one it was built for", function()
            makeWindow()
            local tab = makePage(500)
            local picked
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta", "Gamma" },
                forgetState = true,
                callback = function(value)
                    picked = value
                end,
            })

            local firstRow = drop._optionFrames[1].frame
            drop:Refresh({ "Delta", "Epsilon", "Zeta" })

            -- the rows are the same instances: nothing was torn down to do this
            expect(drop._optionFrames[1].frame).to.equal(firstRow)
            expect(#drop._optionFrames).to.equal(3)

            -- and every one now reads, shows and selects its new option
            expect(drop._optionFrames[1].name).to.equal("Delta")
            expect(drop._optionFrames[1].title.Text).to.equal("Delta")
            expect(drop._optionFrames[3].name).to.equal("Zeta")

            -- the wire that matters: clicking a reused row must pick the option it now shows
            drop:_open()
            drop._optionFrames[1].interact.MouseButton1Click:Fire()
            expect(drop.value[1]).to.equal("Delta")
            expect(picked).to.equal("Delta")
        end)

        it("keeps the rows in the order the options were given", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta" },
                forgetState = true,
            })

            drop:Refresh({ "One", "Two", "Three", "Four" })
            for index, name in { "One", "Two", "Three", "Four" } do
                expect(drop._optionFrames[index].name).to.equal(name)
                expect(drop._optionFrames[index].frame.LayoutOrder).to.equal(index)
            end
        end)

        it("drops the rows it no longer needs and builds the ones it does", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(6), forgetState = true })

            local kept = drop._optionFrames[1].frame
            local surplus = drop._optionFrames[6].frame

            drop:Refresh(options(2))
            expect(#drop._optionFrames).to.equal(2)
            expect(drop._optionFrames[1].frame).to.equal(kept) -- reused
            expect(surplus.Parent).to.equal(nil) -- and the rest actually went

            drop:Refresh(options(5))
            expect(#drop._optionFrames).to.equal(5)
            expect(drop._optionFrames[1].frame).to.equal(kept)
            expect(drop._optionFrames[5].name).to.equal("Option 5")
        end)

        it("still fires the callback only when the visible selection moved", function()
            makeWindow()
            local tab = makePage(500)
            local fired = 0
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta" },
                value = "Alpha",
                forgetState = true,
                callback = function()
                    fired += 1
                end,
            })
            fired = 0

            -- Alpha survives, so nothing the dev can see changed
            drop:Refresh({ "Alpha", "Gamma" })
            expect(fired).to.equal(0)
            expect(drop.value[1]).to.equal("Alpha")

            -- Alpha is gone, so it did
            drop:Refresh({ "Gamma", "Delta" })
            expect(fired).to.equal(1)
            expect(#drop.value).to.equal(0)
        end)

        it("leaves no dead connections behind on the rows it drops", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(10), forgetState = true })

            local before = #drop.connections
            drop:Refresh(options(3))
            -- seven rows went, and their connections went with them
            expect(#drop.connections < before).to.equal(true)

            drop:Refresh(options(10))
            drop:Refresh(options(10)) -- same length twice over: nothing should accumulate
            local settled = #drop.connections
            drop:Refresh(options(10))
            expect(#drop.connections).to.equal(settled)
        end)

        it("prunes only the removed option from what it still wants", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta" },
                multiSelect = true,
                forgetState = true,
            })

            drop:Set({ "Alpha", "Beta", "Gamma" }) -- Gamma hasnt loaded yet
            drop:Remove("Alpha")

            expect(table.find(drop._desiredValue, "Alpha")).to.equal(nil)
            expect(table.find(drop._desiredValue, "Gamma")).to.be.ok()
            expect(#drop.value).to.equal(1)
            expect(drop.value[1]).to.equal("Beta")

            -- Gamma was only ever pending, so it comes back the moment it exists
            drop:Add("Gamma")
            expect(#drop.value).to.equal(2)
        end)

        it("tears an option's connections down with its row", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(6), forgetState = true })

            local before = #drop.connections
            for _ = 1, 3 do
                drop:Refresh(options(6))
            end

            -- rebuild churn must not pile up dead connections on the element
            expect(#drop.connections).to.equal(before)
            expect(#drop._optionFrames).to.equal(6)
        end)

        it("selects and clears only what the search is showing", function()
            makeWindow()
            local tab = makePage(500)
            local drop = tab:CreateDropdown({
                name = "Choice",
                options = { "Alpha", "Beta", "Gamma" },
                multiSelect = true,
                forgetState = true,
            })

            drop:Set({ "Beta" })
            drop:_applyFilter("al") -- Beta is picked, and now out of sight

            local selectAll, clear
            for _, child in drop.actions:GetChildren() do
                if child.Text == "Select all" then
                    selectAll = child
                elseif child.Text == "Clear" then
                    clear = child
                end
            end

            selectAll.MouseButton1Click:Fire()
            expect(#drop.value).to.equal(2)
            expect(table.find(drop.value, "Beta")).to.be.ok()

            clear.MouseButton1Click:Fire()
            expect(#drop.value).to.equal(1)
            expect(drop.value[1]).to.equal("Beta")

            -- a single-choice card has nothing to select all of
            local single = tab:CreateDropdown({ name = "One", options = { "A", "B" }, forgetState = true })
            expect(single.actions).to.equal(nil)
        end)

        it("scrolls an opened card back inside the page it opened past", function()
            makeWindow()
            local tab = makePage(300)
            local drop = tab:CreateDropdown({ name = "Choice", options = options(6), forgetState = true })

            local page = tab.tabPage
            page.CanvasPosition = Vector2.new(0, 0)

            -- sitting near the fold, so opening runs past it
            drop.main.AbsolutePosition = Vector2.new(0, 260)
            drop:_bringIntoView()
            expect(page.CanvasPosition.Y > 0).to.equal(true)

            -- the card fits the page now, so scrolling to it shows all of it
            expect(page.CanvasPosition.Y + 300 >= 260 + drop:_openHeight()).to.equal(true)

            -- never past the card's own top
            expect(page.CanvasPosition.Y <= 260).to.equal(true)

            -- one that already ends inside the view is left where it is
            page.CanvasPosition = Vector2.new(0, 0)
            drop.main.AbsolutePosition = Vector2.new(0, 10)
            drop:_bringIntoView()
            expect(page.CanvasPosition.Y).to.equal(0)
        end)

        describe("row order", function()
            -- the rows sort on LayoutOrder, so it has to stay in step with the option list.
            -- removing from the middle used to leave gaps a later Add could land in.
            local function ordersOf(drop)
                local out = {}
                for _, data in drop._optionFrames do
                    table.insert(out, string.format("%s=%d", data.name, data.frame.LayoutOrder))
                end
                return table.concat(out, " ")
            end

            it("keeps LayoutOrder in step with the options after a removal", function()
                makeWindow()
                local tab = makePage(300)
                local drop = tab:CreateDropdown({
                    name = "Choice",
                    options = { "A", "B", "C", "D" },
                    forgetState = true,
                })

                drop:Remove("B")
                drop:Remove("C")
                drop:Add("E")

                expect(table.concat(drop.options, ",")).to.equal("A,D,E")
                -- the row added last has to sort last, not into the gap the removals left
                expect(ordersOf(drop)).to.equal("A=1 D=2 E=3")
            end)

            it("still numbers rows from one after shrinking off the end", function()
                makeWindow()
                local tab = makePage(300)
                local drop = tab:CreateDropdown({
                    name = "Choice",
                    options = { "A", "B", "C" },
                    forgetState = true,
                })

                drop:Refresh({ "A" })
                drop:Add("Z")
                expect(ordersOf(drop)).to.equal("A=1 Z=2")
            end)
        end)
    end)
end
