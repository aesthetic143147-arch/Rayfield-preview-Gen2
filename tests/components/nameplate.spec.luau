local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

-- Nameplates against fake players and characters, and a fake relay for check-ins.
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

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("floats a plate over your own head, with the hub's name and your @username", function()
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
            expect(entry.subtitle.Text:find("@SpecUser", 1, true)).to.be.ok()
            expect(entry.subtitle.Text:find("DEVELOPER", 1, true)).to.be.ok()
        end)

        it("rises in with an overshoot, bobs, and sweeps light across", function()
            local w = makeWindow()
            local plates = w:CreateNameplate({ showSelf = false })
            local friend = fakePlayer(77, "Friend")
            plates:Add(friend)
            local entry = plates.plates[friend]
            local born = entry.born

            plates:_step(born)
            expect(entry.parts.card.GroupTransparency).to.equal(1)
            expect(entry.parts.scale.Scale).to.equal(0.8)

            -- partway in, the scale runs past 1 before settling
            local peak = 0
            for i = 1, 20 do
                plates:_step(born + i * 0.035)
                peak = math.max(peak, entry.parts.scale.Scale)
            end
            expect(peak > 1).to.equal(true)
            plates:_step(born + 2)
            expect(entry.parts.card.GroupTransparency < 0.01).to.equal(true)
            expect(math.abs(entry.parts.scale.Scale - 1) < 0.001).to.equal(true)

            -- the bob moves it up and down around its lift
            local heights = {}
            for i = 0, 10 do
                plates:_step(born + 2 + i * 0.3)
                table.insert(heights, entry.gui.StudsOffset.Y)
            end
            expect(math.max(table.unpack(heights)) > 2.5).to.equal(true)
            expect(math.min(table.unpack(heights)) < 2.5).to.equal(true)
        end)

        it("fades out and cleans up when a player leaves, and restores their Roblox name", function()
            local w = makeWindow()
            local plates = w:CreateNameplate({ showSelf = false })
            local friend = fakePlayer(88, "Leaver")
            plates:Add(friend, "Staff")
            local entry = plates.plates[friend]
            local humanoid = friend.Character:FindFirstChild("Humanoid")
            expect(humanoid.DisplayDistanceType).to.equal(Enum.HumanoidDisplayDistanceType.None)
            expect(entry.subtitle.Text:find("STAFF", 1, true)).to.be.ok()

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
            expect(plates.plates[alice].subtitle.Text:find("VIP", 1, true)).to.be.ok()
            expect(plates.plates[bob]).to.equal(nil)
            expect(plates.users[12345]).to.be.ok()

            plates:Destroy()
            expect(plates._alive).to.equal(false)
        end)

        it("hides and shows every plate, and renames them", function()
            local w = makeWindow()
            local plates = w:CreateNameplate({ showSelf = false })
            local friend = fakePlayer(90, "Pal")
            plates:Add(friend)
            local entry = plates.plates[friend]
            plates:_step(entry.born + 2)
            expect(entry.parts.card.GroupTransparency < 0.01).to.equal(true)

            plates:SetEnabled(false)
            plates:_step(entry.born + 2.1)
            expect(entry.parts.card.GroupTransparency).to.equal(1)
            plates:SetEnabled(true)

            plates:SetTitle("OMNITY HUB")
            expect(entry.parts.title.Text).to.equal("OMNITY HUB")
            -- no custom assets in the test runtime: the lettered mark stands in for the logo
            expect(entry.monogram.Visible).to.equal(true)
            expect(entry.monogram.Text).to.equal("O")
        end)
    end)
end
