--!nonstrict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
-- Modified for Rayfield Columns: a tab's page is two columns (tab.Left, tab.Right), and the
-- tab's own CreateX calls land in one of them. A long page shows a slim scrollbar.

local Tab = {}
Tab.__index = Tab
Tab.__type = "Tab"

-- Utility
local utility = script.Parent.Parent.utility

-- Variables
local variables = require(utility.variables)
local constants = require(utility.constants)
local hapticEngine = require(utility.HapticEngine)
local log = require(utility.log)
local columns = require(utility.columns)
local search = require(script.Parent.search)
local tabSelector = require(script.Parent.tabSelector)
local Column = require(script.Parent.column)

-- Walk a tab or group's children (groups nest) and tear each element down: drop its flag from
-- the window registry and disconnect every connection it owns, so nothing outlives the
-- instances we're about to destroy.
local function teardownElements(window, elements)
    for _, element in elements do
        if element.__type == "Group" then
            teardownElements(window, element.elements)
        else
            window:_unregisterControl(element)
        end

        -- persistent connections filed via window:ConnectFor
        if element.connections then
            for _, connection in element.connections do
                window:Disconnect(connection)
            end
            element.connections = nil
        end

        -- transient, self-managed connections that may still be live if removed mid-interaction
        if element._dragConnection then
            element._dragConnection:Disconnect()
            element._dragConnection = nil
        end
        -- a keybind removed mid-rebind would otherwise leave the window skipping its toggle
        -- key (and every keybind bailing) forever
        if window._recordingKeybind == element then
            window._recordingKeybind = nil
        end
        if element._outsideClickConn then
            window:Disconnect(element._outsideClickConn)
            element._outsideClickConn = nil
        end
    end
end

local selectTweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local hoverTweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

function Tab.new(window, properties)
    properties = if typeof(properties) == "table" then properties else {}

    local self = setmetatable({
        window = assert(window, "Missing argument #1 (Window expected)"),
        name = properties.name or properties.Name,
        icon = properties.icon or properties.Icon,
        neglectSelector = properties.neglectSelector or properties.NeglectSelector or false,
        customOrder = properties.customOrder or properties.CustomOrder or 0,
        -- when true, controls on this tab default to not persisting to config (the settings tab)
        forgetState = properties.forgetState or properties.ForgetState or false,

        elements = {},
        connections = {}, -- tracked so Remove can drop them without waiting for Unload
    }, Tab)

    -- a tab needs at least one of a name or an icon to show in the selector
    assert(self.name or self.icon, "A tab needs a name or an icon.")

    -- Allow for tabs to be hidden from the tab selector, for Rayfield Settings.
    if not self.neglectSelector then
        tabSelector.build(self, self.window.layout)
    end

    -- Tab Page
    self.tabPage = self.window:Create("ScrollingFrame", {
        Name = self.name,
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 68),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        -- a slim bar in the page's side margin, so a long page reads as scrollable
        ScrollBarThickness = constants.pageScrollbar.thickness,
        ScrollBarImageTransparency = constants.pageScrollbar.transparency,
        VerticalScrollBarInset = Enum.ScrollBarInset.None,
        ScrollingDirection = Enum.ScrollingDirection.Y,

        LayoutOrder = self.customOrder or 0,

        Parent = self.window.elements,
    }, { ScrollBarImageColor3 = "ContentColor" })

    self.tabPageLayout = self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 7),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.tabPage,
    })

    self.window:Create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 33),

        Parent = self.tabPage,
    })

    -- The page is one row holding the two columns. Each column sizes to what it holds and the
    -- row to the taller of them, so the page scrolls both columns together.
    self.columnsRow = self.window:Create("Frame", {
        Name = "Columns",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),

        Parent = self.tabPage,
    })

    self.columnsLayout = self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        -- top, not centre: a column growing (a dropdown opening) pushes down its own column
        -- and leaves the other where it is
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,

        Parent = self.columnsRow,
    })

    self.Left = Column.new(self, "Left")
    self.Right = Column.new(self, "Right")
    -- camelCase reads the same, the way every other Rayfield key does
    self.left = self.Left
    self.right = self.Right

    self:_layoutColumns()

    if not self.neglectSelector then
        table.insert(
            self.connections,
            self.window:Connect(self.topbarItemInteract.MouseButton1Click, function()
                hapticEngine.click()
                self:Select()
            end)
        )

        table.insert(
            self.connections,
            self.window:Connect(self.topbarItemInteract.MouseEnter, function()
                if not self.window:_interactive() then
                    return -- window still revealing/hiding: dont light up mid-animation
                end
                if self.window.selectedTab ~= self then
                    self:_applyVisual("hover", hoverTweenInfo)
                    self:_spinGradients() -- little gradient sweep, same as the intro flourish
                end
            end)
        )

        table.insert(
            self.connections,
            self.window:Connect(self.topbarItemInteract.MouseLeave, function()
                if self.window.selectedTab ~= self then
                    self:_applyVisual("unselected", hoverTweenInfo)
                end
            end)
        )
    end

    -- Auto-select is handled by Window:CreateTab after insertion

    return self
end

function Tab:_applyVisual(stateName, tweenInfo)
    if self.neglectSelector or not self.topbarItem then
        return
    end

    local state = tabSelector.states[self.window.layout.mode][stateName]
    if not state then
        return
    end

    tabSelector.applyVisual(self, state, tweenInfo)
end

-- Flourish: spin the pill's fill + stroke gradients one full turn back to their resting 90deg.
-- Used staggered per tab on the first reveal, and again when hovering an unselected tab.
function Tab:_spinGradients()
    if self.neglectSelector then
        return
    end

    local spinInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    for _, gradient in { self.topbarItemGradient, self.topbarItemStrokeGradient } do
        gradient.Rotation = 90 - 360 -- one full turn shy of rest, so the tween lands clockwise on 90
        variables.tweenService:Create(gradient, spinInfo, { Rotation = 90 }):Play()
    end
end

function Tab:Select(noAnimation)
    -- selecting a tab (e.g. via the settings action) leaves search: bring the strip back,
    -- but let the navigation below pick the page.
    if self.window._searching then
        search.close(self.window, { showTabs = true, jumpTo = false })
    end

    self.window.selectedTab = self
    self.window:_jumpTo(self.tabPage)

    -- noAnimation = initial selection, the pill is still hidden and the window reveal shows it.
    -- a dev calling Navigate/Select before the first Show() hits the same case even without
    -- passing it explicitly - a tween played now would resolve while main is invisible, so the
    -- icon it targets would just pop straight to its end state the moment the window appears
    local skipAnimation = noAnimation or not self.window:_interactive()

    if not self.neglectSelector and not skipAnimation then
        self:_applyVisual("selected", selectTweenInfo)
    end

    for _, tab in self.window.tabs do
        if tab ~= self.window.selectedTab then
            tab:Deselect(skipAnimation)
        end
    end

    if self ~= self.window.rfSettings and self.window.settingsAction and not skipAnimation then
        variables.tweenService
            :Create(
                self.window.settingsAction.iconLabel,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { ImageTransparency = 0.6 }
            )
            :Play()
    end
end

function Tab:Deselect(noAnimation)
    if not self.neglectSelector and not noAnimation then
        self:_applyVisual("unselected", selectTweenInfo)
    end
end

-- One of the tab's two columns, by side ("Left" / "Right", any case) or index (1 / 2). Nothing
-- means the left one. A side that isn't either warns and falls back to the left, so a typo still
-- builds the element rather than taking the whole script down with it.
function Tab:GetColumn(side)
    local resolved = columns.resolveSide(side)
    if not resolved then
        log.warn(`Rayfield: unknown column '{tostring(side)}', using the left one. Use "Left" or "Right".`)
        resolved = "Left"
    end
    return if resolved == "Right" then self.Right else self.Left
end

-- The column a tab-level CreateX lands in: props.side, or the left column when it isn't given.
function Tab:_columnFor(properties)
    if typeof(properties) ~= "table" then
        return self.Left
    end
    return self:GetColumn(properties.side or properties.Side or properties.column or properties.Column)
end

-- Lay the two columns out for the page width the window has settled on: side by side with a 10px
-- gutter where there's room, stacked where there isn't. A column holding nothing takes no room,
-- so a tab that only fills one column reads like an ordinary single-column page.
function Tab:_layoutColumns()
    local left, right = self.Left, self.Right
    if not left or not right or not self.columnsRow then
        return
    end

    local window = self.window
    local pageWidth = if window.size then columns.pageWidth(window.size.X.Offset, window.layout) else 0
    local stacked = columns.shouldStack(pageWidth)
    local leftUsed, rightUsed = #left.elements > 0, #right.elements > 0

    left.main.Visible = leftUsed
    right.main.Visible = rightUsed
    self.stacked = stacked

    if stacked or not (leftUsed and rightUsed) then
        self.columnsLayout.FillDirection = Enum.FillDirection.Vertical
        -- stacked, the right column reads as the next block down the page: the page's own
        -- element gap plus the room a section leaves above itself
        self.columnsLayout.Padding = UDim.new(0, if leftUsed and rightUsed then 20 else 0)
        left.main.Size = UDim2.fromScale(1, 0)
        right.main.Size = UDim2.fromScale(1, 0)
    else
        -- each column is half the row plus half the overlap, and the layout pulls the second
        -- back by the full overlap, so the two still span exactly the row
        self.columnsLayout.FillDirection = Enum.FillDirection.Horizontal
        self.columnsLayout.Padding = UDim.new(0, -columns.overlap)
        left.main.Size = UDim2.new(0.5, columns.overlap / 2, 0, 0)
        right.main.Size = UDim2.new(0.5, columns.overlap / 2, 0, 0)
    end
end

-- Every element a column takes, the tab takes too, and hands to props.side (left by default).
function Tab:CreateButton(properties)
    return self:_columnFor(properties):CreateButton(properties)
end

function Tab:CreateToggle(properties)
    return self:_columnFor(properties):CreateToggle(properties)
end

function Tab:CreateSwitch(properties)
    return self:CreateToggle(properties)
end

function Tab:CreateSection(properties)
    return self:_columnFor(properties):CreateSection(properties)
end

function Tab:CreateText(properties)
    return self:_columnFor(properties):CreateText(properties)
end

function Tab:CreateDivider(properties)
    return self:_columnFor(properties):CreateDivider(properties)
end

function Tab:CreateProgress(properties)
    return self:_columnFor(properties):CreateProgress(properties)
end

function Tab:CreateConsole(properties)
    return self:_columnFor(properties):CreateConsole(properties)
end

function Tab:CreateStat(properties)
    return self:_columnFor(properties):CreateStat(properties)
end

function Tab:CreateSlider(properties)
    return self:_columnFor(properties):CreateSlider(properties)
end

function Tab:CreateDropdown(properties)
    return self:_columnFor(properties):CreateDropdown(properties)
end

function Tab:CreateInput(properties)
    return self:_columnFor(properties):CreateInput(properties)
end

function Tab:CreateKeybind(properties)
    return self:_columnFor(properties):CreateKeybind(properties)
end

function Tab:CreateColorPicker(properties)
    return self:_columnFor(properties):CreateColorPicker(properties)
end

-- Group (layout container). A row that wraps by default; pass direction="column" for a
-- column. Nest a row of columns for a grid. Add elements via group:CreateX.
function Tab:CreateGroup(properties)
    return self:_columnFor(properties):CreateGroup(properties)
end

function Tab:Remove()
    local window = self.window

    -- search reparents elements into its results page; close it first so this tabs
    -- units go home before their page is destroyed under them
    if window._searching then
        search.close(window, { showTabs = true, jumpTo = window.selectedTab and window.selectedTab.tabPage })
    end

    local idx = table.find(window.tabs, self)
    if idx then
        table.remove(window.tabs, idx)
    end

    -- If this was the active tab, hand selection to the next visible tab
    if window.selectedTab == self then
        window.selectedTab = nil
        for _, tab in ipairs(window.tabs) do
            if not tab.neglectSelector then
                tab:Select()
                break
            end
        end
    end

    -- Tear every element down (flags + connections) so nothing points at, or fires on, what
    -- we're about to destroy. Groups nest, so walk their children too.
    teardownElements(window, self.elements)

    -- Tear down the UI; nil the refs so _applyVisual (which guards on self.topbarItem)
    -- no-ops instead of touching a destroyed instance.
    for _, connection in self.connections do
        window:Disconnect(connection)
    end
    self.connections = {}

    if self.topbarItem then
        window:DestroySubtree(self.topbarItem)
    end
    if self.tabPage then
        window:DestroySubtree(self.tabPage)
    end
    self.topbarItem = nil
    self.tabPage = nil
    self.columnsRow = nil
    self.elements = {}
    for _, column in { self.Left, self.Right } do
        column.elements = {}
    end
end

return Tab
