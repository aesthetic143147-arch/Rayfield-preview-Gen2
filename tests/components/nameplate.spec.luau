local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

-- Nameplates against fake players and characters, and a fake relay for check-ins. The animation
-- is driven by hand through _step, so the entrance can be checked frame by frame.
return function()
    local Window = helpers.requireComponent("window")
    local variables = helpers.requireUtility("variables")

    describe("component nameplate", function()
        local window

        local function makeWindow()
            window = Window.new({
                name = "Omnity",
                configuration = { autoSave = false, autoLoad = false },
            })
            return window
        end

        local function character()
            local model = Instance.new("Model")
            local head = Instance.new("Part")
            head.Name = "Head"
            head.Parent = model
            local humanoid = Instance.new("Humanoid")
            humanoid.Parent = model
            return model, head, humanoid
        end

        local function fakePlayer(id, name)
            local model = character()
            return { UserId = id, Name = name, DisplayName = name, Character = model }
        end

        local function plateFor(props, badge)
            local w = makeWindow()
            props = props or {}
            props.showSelf = false
            local plates = w:CreateNameplate(props)
            local player = fakePlayer(77, "Friend")
            plates:Add(player, badge)
            return plates, plates.plates[player], player
        end

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("floats a plate over your own head, with the hub's name, @username and badge", function()
            local w = makeWindow()
            local me = variables.localPlayer
            local model, head = character()
            me.Character = model

            local plates = w:CreateNameplate({ badge = "Developer" })
            local entry = plates.plates[me]
            me.Character = nil

            expect(entry).to.be.ok()
            expect(entry.gui.ClassName).to.equal("BillboardGui")
            expect(entry.gui.Adornee).to.equal(head)
            expect(entry.gui.AlwaysOnTop).to.equal(false)
            expect(entry.parts.title.Text).to.equal("OMNITY")
            expect(entry.parts.subtitle.Text).to.equal("@SpecUser")
            expect(entry.parts.badge.Visible).to.equal(true)
            expect(entry.parts.badgeText.Text).to.equal("DEVELOPER")
            -- the Omnity look by default: the real logo and the galaxy
            expect(plates.style.logo).to.equal("omnity-logo.png")
            expect(plates.style.backdrop).to.equal("nameplate-galaxy.png")
        end)

        it("plays its entrance in order: mark, then card, then words", function()
            local plates, entry = plateFor({}, "VIP")
            local parts = entry.parts
            local born = entry.born
            local logoScale = plates.style.logoScale

            plates:_step(born)
            expect(parts.monogram.TextTransparency).to.equal(1)
            expect(parts.wipe.Enabled).to.equal(true)
            expect(parts.title.TextTransparency).to.equal(1)
            expect(parts.badgeScale.Scale).to.equal(0)

            -- the mark overshoots its size on the way in, before the words have arrived
            local peak = 0
            for i = 1, 14 do
                plates:_step(born + i * 0.03)
                peak = math.max(peak, parts.monogram.Size.X.Scale)
            end
            expect(peak > logoScale).to.equal(true)
            expect(parts.title.TextTransparency > 0.9).to.equal(true)

            -- partway: the card is wiping open, the title on its way
            plates:_step(born + 0.55)
            expect(parts.wipe.Enabled).to.equal(true)
            expect(parts.title.TextTransparency < 1).to.equal(true)
            expect(parts.title.Position.X.Scale > entry.layout.textLeft).to.equal(true)

            -- done: everything in place, the wipe switched off
            plates:_step(born + 2)
            expect(parts.wipe.Enabled).to.equal(false)
            expect(parts.card.GroupTransparency < 0.01).to.equal(true)
            expect(parts.title.TextTransparency < 0.01).to.equal(true)
            expect(math.abs(parts.title.Position.X.Scale - entry.layout.textLeft) < 0.001).to.equal(true)
            expect(math.abs(parts.badgeScale.Scale - 1) < 0.001).to.equal(true)
            expect(math.abs(parts.monogram.Size.X.Scale - logoScale) < 0.001).to.equal(true)
        end)

        it("keeps moving at rest: bob, spinning mark, orbiting sparks", function()
            local plates, entry = plateFor()
            local born = entry.born
            local heights, rotations = {}, {}
            for i = 0, 12 do
                plates:_step(born + 2 + i * 0.25)
                table.insert(heights, entry.gui.StudsOffset.Y)
                table.insert(rotations, entry.parts.monogram.Rotation)
            end
            expect(math.max(table.unpack(heights)) > 2.5).to.equal(true)
            expect(math.min(table.unpack(heights)) < 2.5).to.equal(true)
            expect(rotations[1] ~= rotations[#rotations]).to.equal(true)

            expect(#entry.parts.sparks).to.equal(7)
            local spark = entry.parts.sparks[1].frame
            local before = spark.Position
            plates:_step(born + 6)
            expect(spark.Position ~= before).to.equal(true)
            expect(spark.BackgroundTransparency < 1).to.equal(true)
        end)

        it("takes any style setting, presets included, and rebuilds on SetStyle", function()
            local plates, entry = plateFor({
                style = { sparkles = 2, accent = Color3.fromRGB(255, 0, 0), size = Vector2.new(4, 1), bob = false },
            })
            expect(#entry.parts.sparks).to.equal(2)
            expect(entry.parts.badge.BackgroundColor3).to.equal(Color3.fromRGB(255, 0, 0))
            expect(entry.gui.Size).to.equal(UDim2.fromScale(4, 1))
            plates:_step(entry.born + 3)
            expect(entry.gui.StudsOffset.Y).to.equal(2.5)

            local oldGui = entry.gui
            plates:SetStyle("Mono")
            expect(plates.style.backdrop).to.equal(false)
            expect(plates.style.sparkles).to.equal(2) -- overrides survive a preset change
            expect(entry.gui).never.to.equal(oldGui)

            plates:SetStyle({ sparkles = 0, entrance = "none" })
            expect(#entry.parts.sparks).to.equal(0)
            plates:_step(entry.born)
            expect(entry.parts.title.TextTransparency).to.equal(0)
            expect(entry.parts.wipe.Enabled).to.equal(false)
        end)

        it("fades out and cleans up when a player leaves, and restores their Roblox name", function()
            local plates, entry, friend = plateFor({}, "Staff")
            local humanoid = friend.Character:FindFirstChild("Humanoid")
            expect(humanoid.DisplayDistanceType).to.equal(Enum.HumanoidDisplayDistanceType.None)
            expect(entry.parts.badgeText.Text).to.equal("STAFF")

            plates:Remove(friend)
            expect(plates.plates[friend]).to.equal(nil)
            expect(humanoid.DisplayDistanceType).never.to.equal(Enum.HumanoidDisplayDistanceType.None)
            expect(#plates._dying).to.equal(1)
            plates:_step(os.clock() + 1)
            expect(#plates._dying).to.equal(0)
        end)

        it("shows plates over everyone the relay says runs the script in this server", function()
            local w = makeWindow()
            local calls = {}
            local alice = fakePlayer(501, "Alice")
            local bob = fakePlayer(502, "Bob")
            local plates = w:CreateNameplate({
                autoCheckIn = false,
                transport = function(method, path, body)
                    table.insert(calls, { method = method, path = path, body = body })
                    return true, { users = { { id = 501, badge = "VIP" }, { id = 12345 } } }
                end,
            })
            plates._listPlayers = function()
                return { variables.localPlayer, alice, bob }
            end

            expect(plates:CheckIn()).to.equal(true)
            expect(calls[1].method).to.equal("POST")
            expect(calls[1].path).to.equal("/v1/presence")
            expect(calls[1].body.user.id).to.equal(12345)
            expect(calls[1].body.jobId).to.be.a("string")

            expect(plates.plates[alice]).to.be.ok()
            expect(plates.plates[alice].parts.badgeText.Text).to.equal("VIP")
            expect(plates.plates[bob]).to.equal(nil)
            expect(plates.users[12345]).to.be.ok()

            plates:Destroy()
            expect(plates._alive).to.equal(false)
        end)

        it("hides and shows every plate, and renames them", function()
            local plates, entry = plateFor()
            plates:_step(entry.born + 2)
            expect(entry.parts.card.GroupTransparency < 0.01).to.equal(true)

            plates:SetEnabled(false)
            plates:_step(entry.born + 2.1)
            expect(entry.parts.card.GroupTransparency).to.equal(1)
            plates:SetEnabled(true)

            plates:SetTitle("OMNITY HUB")
            expect(entry.parts.title.Text).to.equal("OMNITY HUB")
            -- no custom assets in the test runtime: the lettered mark stands in for the logo
            expect(entry.parts.monogram.Visible).to.equal(true)
            expect(entry.parts.monogram.Text).to.equal("O")
        end)
    end)
end
