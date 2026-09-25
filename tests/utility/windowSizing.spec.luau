local requireUtility = (_G :: any).__RAYFIELD_TEST_HELPERS.requireUtility

return function()
    local windowSizing = requireUtility("windowSizing")
    local top = windowSizing.profile("top")

    local function fit(x: number, y: number)
        local size = windowSizing.fit(Vector2.new(x, y))
        return size.X.Offset, size.Y.Offset
    end

    describe("utility.windowSizing", function()
        it("leaves roomy screens on the default size", function()
            for _, viewport in { Vector2.new(1280, 720), Vector2.new(1920, 1080), Vector2.new(1080, 810) } do
                local width, height = fit(viewport.X, viewport.Y)
                expect(width).to.equal(top.defaultSize.X)
                expect(height).to.equal(top.defaultSize.Y)
            end
        end)

        it("falls back to the default when the viewport is missing or implausible", function()
            for _, viewport in { nil, Vector2.new(0, 0), Vector2.new(1, 1), Vector2.new(640, 120) } do
                local size = windowSizing.fit(viewport)
                expect(size.X.Offset).to.equal(top.defaultSize.X)
                expect(size.Y.Offset).to.equal(top.defaultSize.Y)
            end
        end)

        it("only widens once height is actually constrained", function()
            -- tall enough for the full height, so width stays exactly default
            local wideWidth = fit(2560, 1440)
            expect(wideWidth).to.equal(top.defaultSize.X)

            -- a short screen gives height up, and earns width back for it
            local phoneWidth, phoneHeight = fit(844, 390)
            expect(phoneHeight < top.defaultSize.Y).to.equal(true)
            expect(phoneWidth > top.defaultSize.X).to.equal(true)
        end)

        it("leaves exactly the topbar's room above, and gives the rest to the window", function()
            -- pinned, so loosening the clearance fails here rather than sliding through the
            -- bounds checks below. A centred window leaves half the slack above it, so the
            -- height is the screen less twice the clearance.
            for _, viewport in { Vector2.new(800, 360), Vector2.new(844, 390), Vector2.new(955, 440) } do
                local _, height = fit(viewport.X, viewport.Y)
                expect(height).to.equal(viewport.Y - top.topbarClearance * 2)
            end

            -- once the screen is tall enough, the ideal height is what caps it instead
            local _, windowed = fit(1280, 600)
            expect(windowed).to.equal(top.defaultSize.Y)
        end)

        it("keeps a phone inside the caps that still apply", function()
            for _, viewport in { Vector2.new(667, 375), Vector2.new(844, 390), Vector2.new(720, 360) } do
                local width, height = fit(viewport.X, viewport.Y)
                expect(width <= viewport.X * top.maxOccupancyX).to.equal(true)
                expect(height <= viewport.Y - top.topbarClearance * 2).to.equal(true)
            end
        end)

        it("leaves room above a centred window for the roblox topbar", function()
            -- the vertical cap is what clears the inset, so the gap above must beat it
            for _, viewport in { Vector2.new(667, 375), Vector2.new(844, 390), Vector2.new(720, 360) } do
                local _, height = fit(viewport.X, viewport.Y)
                expect((viewport.Y - height) / 2 >= 36).to.equal(true)
            end
        end)

        it("never returns a size that overflows a plausible screen", function()
            for _, viewport in
                { Vector2.new(640, 360), Vector2.new(667, 375), Vector2.new(390, 844), Vector2.new(1194, 834) }
            do
                local width, height = fit(viewport.X, viewport.Y)
                expect(width <= viewport.X).to.equal(true)
                expect(height <= viewport.Y).to.equal(true)
            end
        end)

        it("holds the aspect ceiling against the height it actually ships", function()
            -- the cap has to be measured off the whole-pixel height, not the fraction it came
            -- from, or the shipped width can sit a pixel over it
            for _, viewport in
                { Vector2.new(1200, 240), Vector2.new(400, 201), Vector2.new(640, 260), Vector2.new(900, 300) }
            do
                local width, height = fit(viewport.X, viewport.Y)
                expect(width <= height * top.maxAspectRatio).to.equal(true)
            end
        end)

        it("keeps the minimum as a floor while the screen can afford it", function()
            local width = fit(400, 700)
            expect(width >= top.minSize.X).to.equal(true)
        end)

        it("gives the floor up rather than overflow a screen too small for it", function()
            -- both of these clear the plausibility check but cannot hold the minimum size
            local narrowWidth, narrowHeight = fit(240, 700)
            expect(narrowWidth <= 240).to.equal(true)
            expect(narrowWidth < top.minSize.X).to.equal(true)
            expect(narrowHeight <= 700).to.equal(true)

            local shortWidth, shortHeight = fit(1200, 240)
            expect(shortHeight <= 240).to.equal(true)
            expect(shortHeight < top.minSize.Y).to.equal(true)
            expect(shortWidth <= 1200).to.equal(true)
        end)

        it("holds the caps down to the smallest believed viewport", function()
            for _, viewport in
                { Vector2.new(200, 200), Vector2.new(240, 700), Vector2.new(1200, 240), Vector2.new(210, 380) }
            do
                local width, height = fit(viewport.X, viewport.Y)
                expect(width <= viewport.X * top.maxOccupancyX).to.equal(true)
                expect(height <= viewport.Y - top.topbarClearance * 2).to.equal(true)
            end
        end)

        it("returns whole pixels", function()
            local width, height = fit(823, 431)
            expect(width % 1).to.equal(0)
            expect(height % 1).to.equal(0)
        end)
    end)

    local sidebar = windowSizing.profile("sidebar")

    local function fitSidebar(x: number, y: number)
        local size = windowSizing.fit(Vector2.new(x, y), "sidebar")
        return size.X.Offset, size.Y.Offset
    end

    describe("utility.windowSizing sidebar", function()
        it("ships a landscape window where the top layout ships a portrait one", function()
            expect(sidebar.defaultSize.X > sidebar.defaultSize.Y).to.equal(true)
            expect(top.defaultSize.Y > top.defaultSize.X).to.equal(true)
            expect(sidebar.defaultSize.X > top.defaultSize.X).to.equal(true)
        end)

        it("leaves roomy screens on the default size", function()
            for _, viewport in { Vector2.new(1920, 1080), Vector2.new(1280, 800), Vector2.new(2560, 1440) } do
                local width, height = fitSidebar(viewport.X, viewport.Y)
                expect(width).to.equal(sidebar.defaultSize.X)
                expect(height).to.equal(sidebar.defaultSize.Y)
            end
        end)

        it("falls back to the default when the viewport is missing or implausible", function()
            for _, viewport in { nil, Vector2.new(0, 0), Vector2.new(1, 1), Vector2.new(640, 120) } do
                local size = windowSizing.fit(viewport, "sidebar")
                expect(size.X.Offset).to.equal(sidebar.defaultSize.X)
                expect(size.Y.Offset).to.equal(sidebar.defaultSize.Y)
            end
        end)

        it("defends its width where the top layout defends its height", function()
            -- the same cramped screen: the sidebar keeps proportionally more width
            local viewport = Vector2.new(760, 520)
            local sidebarWidth = select(1, fitSidebar(viewport.X, viewport.Y))
            local topWidth = select(1, fit(viewport.X, viewport.Y))
            expect(sidebarWidth > topWidth).to.equal(true)
        end)

        it("never reads portrait, however narrow the screen gets", function()
            for _, viewport in
                { Vector2.new(390, 844), Vector2.new(430, 932), Vector2.new(500, 900), Vector2.new(320, 700) }
            do
                local width, height = fitSidebar(viewport.X, viewport.Y)
                expect(width >= height).to.equal(true)
                expect(width >= height * sidebar.minAspectRatio - 1).to.equal(true)
            end
        end)

        it("holds both aspect bounds against the width it actually ships", function()
            for _, viewport in
                { Vector2.new(1200, 240), Vector2.new(900, 300), Vector2.new(640, 900), Vector2.new(1600, 400) }
            do
                local width, height = fitSidebar(viewport.X, viewport.Y)
                expect(width <= height * sidebar.maxAspectRatio).to.equal(true)
                expect(width >= height * sidebar.minAspectRatio - 1).to.equal(true)
            end
        end)

        it("holds the occupancy caps down to the smallest believed viewport", function()
            for _, viewport in
                { Vector2.new(200, 200), Vector2.new(390, 844), Vector2.new(1200, 240), Vector2.new(844, 390) }
            do
                local width, height = fitSidebar(viewport.X, viewport.Y)
                expect(width <= viewport.X * sidebar.maxOccupancyX).to.equal(true)
                expect(height <= viewport.Y * sidebar.maxOccupancyY).to.equal(true)
            end
        end)

        it("gives the floor up rather than overflow a screen too small for it", function()
            local width, height = fitSidebar(390, 844)
            expect(width < sidebar.minSize.X).to.equal(true)
            expect(width <= 390).to.equal(true)
            expect(height <= 844).to.equal(true)
        end)

        it("returns whole pixels", function()
            local width, height = fitSidebar(823, 431)
            expect(width % 1).to.equal(0)
            expect(height % 1).to.equal(0)
        end)

        it("measures the page against its own chrome, not the top layout's", function()
            local height = 600
            expect(windowSizing.pageHeight(height, "sidebar")).to.equal(height - sidebar.chromeHeight)
            expect(windowSizing.pageHeight(height, "sidebar") > windowSizing.pageHeight(height, "top")).to.equal(true)

            -- no size yet: the smallest page that layout can have, never nothing
            expect(windowSizing.pageHeight(nil, "sidebar")).to.equal(sidebar.minSize.Y - sidebar.chromeHeight)
            expect(windowSizing.pageHeight(0, "sidebar")).to.equal(sidebar.minSize.Y - sidebar.chromeHeight)
        end)

        it("treats an unknown or missing layout as the top one", function()
            expect(windowSizing.profile(nil)).to.equal(top)
            expect(windowSizing.profile("nonsense" :: any)).to.equal(top)
        end)
    end)
end
