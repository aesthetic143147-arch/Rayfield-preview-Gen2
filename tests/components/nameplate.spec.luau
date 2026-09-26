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
            expect(math.abs(parts.card.Size.X.Scale - entry.layout.closedWidth) < 0.0001).to.equal(true)
            expect(parts.card.BackgroundTransparency).to.equal(1)
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

            -- partway: the card is unfolding (its contents keep full width), the title on its way
            plates:_step(born + 0.55)
            local width = parts.card.Size.X.Scale
            expect(width > entry.layout.closedWidth and width < 1).to.equal(true)
            expect(math.abs(parts.content.Size.X.Scale * width - 1) < 0.001).to.equal(true)
            expect(parts.title.TextTransparency < 1).to.equal(true)
            expect(parts.title.Position.X.Scale > entry.layout.textLeft).to.equal(true)

            -- done: everything in place, every layer at its resting look
            plates:_step(born + 2)
            expect(parts.card.Size.X.Scale).to.equal(1)
            expect(math.abs(parts.card.BackgroundTransparency - plates.style.cardTransparency) < 0.001).to.equal(true)
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
            local lift = plates.style.lift
            expect(math.max(table.unpack(heights)) > lift).to.equal(true)
            expect(math.min(table.unpack(heights)) < lift).to.equal(true)
            expect(rotations[1] ~= rotations[#rotations]).to.equal(true)

            expect(#entry.parts.sparks).to.equal(4)
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
            expect(math.abs(entry.gui.StudsOffset.Y - plates.style.lift) < 0.001).to.equal(true)

            local oldGui = entry.gui
            plates:SetStyle("Mono")
            expect(plates.style.backdrop).to.equal(false)
            expect(plates.style.sparkles).to.equal(2) -- overrides survive a preset change
            expect(entry.gui).never.to.equal(oldGui)

            plates:SetStyle({ sparkles = 0, entrance = "none" })
            expect(#entry.parts.sparks).to.equal(0)
            plates:_step(entry.born)
            expect(entry.parts.title.TextTransparency).to.equal(0)
            expect(entry.parts.card.Size.X.Scale).to.equal(1)
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

        it("plays a sprite sheet: the frames step through the grid at its speed", function()
            local plates, entry = plateFor({
                style = {
                    backdrop = {
                        sheet = "rbxassetid://123",
                        frames = 6,
                        columns = 3,
                        frameSize = Vector2.new(320, 80),
                        fps = 10,
                    },
                },
            })
            local backdrop = entry.parts.backdrop
            expect(backdrop.Image).to.equal("rbxassetid://123")
            expect(backdrop.ImageRectSize).to.equal(Vector2.new(320, 80))
            expect(backdrop.Visible).to.equal(true)

            local seen = {}
            for i = 0, 11 do
                plates:_step(entry.born + 2 + i * 0.1)
                seen[tostring(backdrop.ImageRectOffset)] = true
            end
            local count = 0
            for _ in seen do
                count += 1
            end
            expect(count).to.equal(6) -- every cell of the 3 x 2 grid shows up
        end)

        it("plays a list of frames, and a GIF link goes through the relay", function()
            local calls = {}
            local plates, entry = plateFor({
                endpoint = "https://relay.example.com",
                autoCheckIn = false,
                transport = function(method, path, body)
                    table.insert(calls, { method = method, path = path, body = body })
                    return true,
                        {
                            id = "abcdef0123456789",
                            frames = 4,
                            columns = 2,
                            frameWidth = 160,
                            frameHeight = 160,
                            fps = 8,
                        }
                end,
                style = {
                    logo = "https://media.tenor.com/spin.gif",
                    backdrop = { images = { 1, 2, 3 }, fps = 4 },
                },
            })
            -- the test stands in for downloads
            plates._download = function(_, _kind, source, fileName)
                return "rbxasset://fake/" .. (fileName or source)
            end
            plates:SetStyle({})

            expect(calls[1].path).to.equal("/v1/media")
            expect(calls[1].body.url).to.equal("https://media.tenor.com/spin.gif")
            expect(calls[1].body.fit).to.equal("square")
            expect(entry.parts.logo.Image).to.equal("rbxasset://fake/media_abcdef0123456789.png")
            expect(entry.parts.logo.ImageRectSize).to.equal(Vector2.new(160, 160))

            local images = {}
            for i = 0, 3 do
                plates:_step(entry.born + 2 + i * 0.25)
                images[entry.parts.backdrop.Image] = true
            end
            expect(images["rbxassetid://1"] and images["rbxassetid://2"] and images["rbxassetid://3"]).to.equal(true)
        end)

        it("shows a player's own GIF on their plate, and lets you set yours", function()
            local w = makeWindow()
            local calls = {}
            local alice = fakePlayer(501, "Alice")
            local plates = w:CreateNameplate({
                endpoint = "https://relay.example.com",
                autoCheckIn = false,
                transport = function(method, path, body)
                    table.insert(calls, { method = method, path = path, body = body })
                    if path == "/v1/profile" then
                        return true,
                            {
                                ok = true,
                                token = "secret",
                                media = {
                                    id = "1111111111111111",
                                    frames = 2,
                                    columns = 2,
                                    frameWidth = 160,
                                    frameHeight = 160,
                                    fps = 5,
                                    slot = "logo",
                                },
                            }
                    end
                    return true,
                        {
                            users = {
                                {
                                    id = 501,
                                    media = {
                                        id = "2222222222222222",
                                        frames = 3,
                                        columns = 3,
                                        frameWidth = 320,
                                        frameHeight = 80,
                                        fps = 6,
                                        slot = "backdrop",
                                    },
                                },
                            },
                        }
                end,
            })
            plates._download = function(_, _kind, source, fileName)
                return "rbxasset://fake/" .. (fileName or source)
            end
            plates._listPlayers = function()
                return { alice }
            end

            plates:CheckIn()
            local entry = plates.plates[alice]
            expect(entry.parts.backdrop.Image).to.equal("rbxasset://fake/media_2222222222222222.png")
            expect(entry.parts.backdrop.ImageRectSize).to.equal(Vector2.new(320, 80))

            -- a dev can turn players' images off
            plates.playerMedia = false
            plates:_applyImages(entry)
            expect(entry.parts.backdrop.Image).never.to.equal("rbxasset://fake/media_2222222222222222.png")
            plates.playerMedia = true

            -- setting your own: sent with the slot, the token kept for next time
            local ok = plates:SetMedia("https://media.tenor.com/me.gif", "logo")
            expect(ok).to.equal(true)
            local put = calls[#calls]
            expect(put.method).to.equal("PUT")
            expect(put.body.media.slot).to.equal("logo")
            expect(put.body.media.url).to.equal("https://media.tenor.com/me.gif")
            expect(plates:_token()).to.equal("secret")
            expect(plates.users[12345].media.id).to.equal("1111111111111111")

            expect(plates:ClearMedia()).to.equal(true)
            expect(calls[#calls].method).to.equal("DELETE")
            expect(calls[#calls].body.token).to.equal("secret")
            expect(plates.users[12345].media).to.equal(nil)
        end)

        it("says why when custom images can't work", function()
            local plates = plateFor()
            local ok, reason = plates:SetMedia("https://media.tenor.com/x.gif")
            expect(ok).to.equal(false)
            expect(reason:find("relay", 1, true)).to.be.ok()
            expect(plates:ClearMedia()).to.equal(false)
        end)

        it("hides and shows every plate, and renames them", function()
            local plates, entry = plateFor()
            plates:_step(entry.born + 2)
            expect(entry.parts.title.TextTransparency < 0.01).to.equal(true)
            expect(entry.parts.card.BackgroundTransparency < 1).to.equal(true)

            plates:SetEnabled(false)
            plates:_step(entry.born + 2.1)
            expect(entry.parts.card.BackgroundTransparency).to.equal(1)
            expect(entry.parts.title.TextTransparency).to.equal(1)
            expect(entry.parts.borderStroke.Transparency).to.equal(1)
            plates:SetEnabled(true)

            plates:SetTitle("OMNITY HUB")
            expect(entry.parts.title.Text).to.equal("OMNITY HUB")
            -- no custom assets in the test runtime: the lettered mark stands in for the logo
            expect(entry.parts.monogram.Visible).to.equal(true)
            expect(entry.parts.monogram.Text).to.equal("O")
        end)
    end)
end
