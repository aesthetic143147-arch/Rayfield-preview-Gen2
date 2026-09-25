local requireUtility = (_G :: any).__RAYFIELD_TEST_HELPERS.requireUtility

return function()
    local layouts = requireUtility("layouts")

    describe("utility.layouts", function()
        it("resolves the two layouts by name and nothing else", function()
            expect(layouts.get("top")).to.equal(layouts.top)
            expect(layouts.get("sidebar")).to.equal(layouts.sidebar)

            for _, value in { "", "TOP", "rail", "Sidebar", 1, true } do
                expect(layouts.get(value)).to.equal(nil)
            end
            expect(layouts.get(nil)).to.equal(nil)
        end)

        it("shares one topbar height across both layouts", function()
            expect(layouts.sidebar.topbarHeight).to.equal(layouts.top.topbarHeight)
        end)

        it("leaves the top layout room for its strip and the sidebar none", function()
            -- the strip sits inside the chrome, so the top layout's is the taller of the two
            expect(layouts.top.chromeHeight).to.equal(layouts.top.tabStripTop + layouts.top.tabStripHeight + 3)
            expect(layouts.top.chromeHeight > layouts.sidebar.chromeHeight).to.equal(true)

            -- nothing hangs below the sidebar's topbar, so the rail starts right under it
            expect(layouts.sidebar.chromeHeight).to.equal(layouts.sidebar.topbarHeight)
        end)

        it("hangs the strip a pixel into the topbar", function()
            expect(layouts.top.tabStripTop).to.equal(layouts.top.topbarHeight - 1)
        end)

        it("drops the rail to icons only once the window is too narrow for labels", function()
            local layout = layouts.sidebar
            local full = layout.railWidth
            local collapsed = layout.railCollapsedWidth

            expect(layouts.railWidthFor(layout, layout.railCollapseBelow)).to.equal(full)
            expect(layouts.railWidthFor(layout, layout.railCollapseBelow + 200)).to.equal(full)
            expect(layouts.railWidthFor(layout, layout.railCollapseBelow - 1)).to.equal(collapsed)
            expect(layouts.railWidthFor(layout, 320)).to.equal(collapsed)

            -- an icon rail still has to fit its icon and the inset either side of it
            expect(collapsed > layout.rowInset * 2 + layout.rowIconSize).to.equal(true)
        end)

        it("gives the top layout no rail to take width from", function()
            expect(layouts.railWidthFor(layouts.top, 900)).to.equal(0)
            expect(layouts.railWidthFor(layouts.top, 300)).to.equal(0)
        end)

        it("fades each layout from opaque at the base to clear at the top", function()
            for _, layout in { layouts.top, layouts.sidebar } do
                local points = layout.fadeTransparency.Keypoints
                expect(points[1].Time).to.equal(0)
                expect(points[1].Value).to.equal(0)
                expect(points[#points].Time).to.equal(1)
                expect(points[#points].Value).to.equal(1)
            end
        end)
    end)
end
