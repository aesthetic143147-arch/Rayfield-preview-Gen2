local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

-- The chat element against a fake relay. The transport option is the seam: it stands in for the
-- HTTP call, so these run without a network and can play the server's part exactly.
return function()
    local Window = helpers.requireComponent("window")

    describe("component chat", function()
        local window

        local function makeWindow()
            window = Window.new({
                name = "Chat Window",
                configuration = { autoSave = false, autoLoad = false },
            })
            return window
        end

        -- a relay in miniature: the recent window, a version that moves on every change, and a
        -- record of what the element asked for
        local function fakeRelay()
            local relay = { version = 1, messages = {}, calls = {}, down = false, nextId = 100 }
            function relay.add(content, author)
                relay.nextId += 1
                local message = { id = tostring(relay.nextId), content = content, time = 1700000000, author = author }
                table.insert(relay.messages, message)
                relay.version += 1
                return message
            end
            function relay.transport(method, path, body)
                table.insert(relay.calls, { method = method, path = path, body = body })
                if relay.down then
                    return false, { error = "offline" }
                end
                if method == "GET" then
                    local since = tonumber(path:match("since=(%d+)"))
                    if since == relay.version then
                        return true, { version = relay.version, unchanged = true }
                    end
                    return true, { version = relay.version, messages = table.clone(relay.messages) }
                end
                if body.content:find("banned", 1, true) then
                    return false, { error = "You can't send messages here." }
                end
                local message = relay.add(body.content, { name = body.user.displayName, roblox = body.user.id })
                return true, { ok = true, message = message }
            end
            return relay
        end

        local function makeChat(relay, props)
            local w = makeWindow()
            local tab = w:CreateTab({ name = "Community" })
            props = props or {}
            props.name = props.name or "Hub chat"
            props.transport = relay.transport
            props.poll = false
            local chat = tab.Right:CreateChat(props)
            return chat, tab, w
        end

        local function rowCount(chat)
            local n = 0
            for _ in chat.rows do
                n += 1
            end
            return n
        end

        afterEach(function()
            if window and not window.unloaded then
                window:Unload()
            end
            window = nil
        end)

        it("shows the channel's recent messages from the relay", function()
            local relay = fakeRelay()
            relay.add("hello from the game", { name = "Builder", roblox = 1 })
            relay.add("welcome <:omnity:123456789> glad you're here", { name = "Mod", discord = true })

            local chat = makeChat(relay)
            expect(chat.__type).to.equal("Chat")
            expect(chat.status).to.equal("connecting")
            expect(chat:Refresh()).to.equal(true)
            expect(chat.status).to.equal("live")
            expect(rowCount(chat)).to.equal(2)
            expect(chat.emptyLabel.Visible).to.equal(false)

            local fromGame = chat.rows[relay.messages[1].id]
            expect(fromGame.avatar.Image:find("rbxthumb://type=AvatarHeadShot&id=1", 1, true)).to.be.ok()
            expect(fromGame.initial).to.equal(nil)

            -- someone on Discord: a lettered disc, a Discord marker, and custom emoji as :name:
            local fromDiscord = chat.rows[relay.messages[2].id]
            expect(fromDiscord.initial.Text).to.equal("M")
            expect(fromDiscord.nameLabel.Text:find("Discord", 1, true)).to.be.ok()
            expect(fromDiscord.contentLabel.Text).to.equal("welcome :omnity: glad you're here")
            expect(fromDiscord.contentLabel.RichText).to.equal(false)
            expect(relay.calls[1].path).to.equal("/v1/chat/general")
        end)

        it("sends as the local player and shows the message straight away", function()
            local relay = fakeRelay()
            local chat = makeChat(relay, { channel = "hub chat" })
            chat:Refresh()

            local ok = chat:Send("  gm everyone 👋  ")
            expect(ok).to.equal(true)
            local post = relay.calls[#relay.calls]
            expect(post.method).to.equal("POST")
            expect(post.path).to.equal("/v1/chat/hub%20chat")
            expect(post.body.content).to.equal("gm everyone 👋")
            expect(post.body.user.id).to.equal(12345)
            expect(post.body.user.displayName).to.equal("Spec User")
            expect(rowCount(chat)).to.equal(1)
        end)

        it("refuses empty, over-long and too-fast messages, and reports the relay's refusal", function()
            local relay = fakeRelay()
            local chat = makeChat(relay)

            expect(chat:Send("   ")).to.equal(false)
            expect(chat:Send(string.rep("a", 301))).to.equal(false)

            expect(chat:Send("first")).to.equal(true)
            local ok, reason = chat:Send("second, too soon")
            expect(ok).to.equal(false)
            expect(reason:find("Slow down", 1, true)).to.be.ok()

            chat.lastSent = -math.huge
            local sent, why = chat:Send("I am banned")
            expect(sent).to.equal(false)
            expect(why).to.equal("You can't send messages here.")
        end)

        it("follows edits and deletions made on Discord", function()
            local relay = fakeRelay()
            local keep = relay.add("keep me", { name = "A", roblox = 2 })
            local drop = relay.add("delete me", { name = "B", roblox = 3 })
            local chat = makeChat(relay)
            chat:Refresh()
            expect(rowCount(chat)).to.equal(2)

            -- nothing moved: the relay answers "unchanged" and the rows stay as they are
            local before = chat.rows[keep.id].frame
            chat:Refresh()
            expect(relay.calls[#relay.calls].path:find("since=", 1, true)).to.be.ok()
            expect(chat.rows[keep.id].frame).to.equal(before)

            -- a moderator deletes one message and edits the other
            table.remove(relay.messages, 2)
            relay.messages[1].content = "keep me (edited)"
            relay.version += 1
            chat:Refresh()
            expect(chat.rows[drop.id]).to.equal(nil)
            expect(chat.rows[keep.id].contentLabel.Text).to.equal("keep me (edited)")
        end)

        it("keeps only the newest maxMessages", function()
            local relay = fakeRelay()
            for i = 1, 8 do
                relay.add("message " .. i, { name = "P", roblox = 4 })
            end
            local chat = makeChat(relay, { maxMessages = 5 })
            chat:Refresh()
            expect(rowCount(chat)).to.equal(5)
            expect(chat.messages[1].content).to.equal("message 4")
        end)

        it("fires onMessage for new messages only, not the history it opens with", function()
            local relay = fakeRelay()
            relay.add("old news", { name = "P", roblox = 5 })
            local seen = {}
            local chat = makeChat(relay, {
                onMessage = function(message)
                    table.insert(seen, message.content)
                end,
            })
            chat:Refresh()
            expect(#seen).to.equal(0)

            relay.add("fresh", { name = "Q", discord = true })
            chat:Refresh()
            expect(#seen).to.equal(1)
            expect(seen[1]).to.equal("fresh")
        end)

        it("turns a shared server invite into a copy button", function()
            local relay = fakeRelay()
            local invite = relay.add("join us at discord.gg/omnity-hub !", { name = "P", roblox = 6 })
            local plain = relay.add("no link here", { name = "P", roblox = 6 })
            local chat = makeChat(relay)
            chat:Refresh()

            expect(chat.rows[invite.id].invite).to.equal("https://discord.gg/omnity-hub")
            expect(chat.rows[invite.id].inviteButton).to.be.ok()
            expect(chat.rows[plain.id].inviteButton).to.equal(nil)
            -- no clipboard in the test runtime: it says so rather than pretending
            expect(chat:_copy("https://discord.gg/omnity-hub")).to.equal(false)
        end)

        it("drops emoji from the picker into the message box", function()
            local chat = makeChat(fakeRelay())
            expect(#chat.picker:GetChildren() > 30).to.equal(true)
            chat:_toggleEmojiPicker()
            expect(chat.picker.Visible).to.equal(true)
            chat.input.Text = "nice"
            chat:_insert("🔥")
            expect(chat.input.Text).to.equal("nice 🔥")
        end)

        it("shows offline when the relay can't be reached, and says so when there's no relay", function()
            local relay = fakeRelay()
            relay.down = true
            local chat = makeChat(relay)
            expect(chat:Refresh()).to.equal(false)
            expect(chat.status).to.equal("offline")
            expect(chat.failures).to.equal(1)

            -- same window: a second one would be left open when the test ends
            local lonely = chat.window:CreateTab({ name = "Solo" }):CreateChat({})
            expect(lonely.status).to.equal("unconfigured")
            expect(lonely:Refresh()).to.equal(false)
        end)

        it("speaks the relay's HTTP protocol through the executor's request function", function()
            local env = getfenv()
            local original = env.request
            local sent = {}
            env.request = function(options)
                table.insert(sent, options)
                if options.Method == "POST" then
                    return {
                        StatusCode = 429,
                        Body = '{"error":"Slow down.","retryAfter":2}',
                    }
                end
                return {
                    StatusCode = 200,
                    Body = '{"version":7,"messages":[{"id":"1","content":"hi","time":1700000000,'
                        .. '"author":{"name":"Omni","discord":true}}]}',
                }
            end

            local w = makeWindow()
            local chat = w:CreateTab({ name = "Live" }):CreateChat({
                endpoint = "https://chat.example.com/",
                channel = "general",
                key = "public-key",
                poll = false,
            })
            local refreshed = chat:Refresh()
            local ok, reason = chat:Send("hello")
            env.request = original

            expect(refreshed).to.equal(true)
            expect(sent[1].Url).to.equal("https://chat.example.com/v1/chat/general")
            expect(sent[1].Method).to.equal("GET")
            expect(sent[1].Headers["X-Chat-Key"]).to.equal("public-key")
            expect(chat.version).to.equal(7)
            expect(chat.rows["1"].contentLabel.Text).to.equal("hi")

            -- a refusal from the relay comes back as the reason, and nothing is added
            expect(ok).to.equal(false)
            expect(reason).to.equal("Slow down.")
            expect(sent[2].Method).to.equal("POST")
            expect(sent[2].Body:find('"content":"hello"', 1, true)).to.be.ok()
        end)

        it("sends on enter and keeps the typed text if it doesn't go through", function()
            local relay = fakeRelay()
            local chat = makeChat(relay)
            chat.input.Text = "enter sends this"
            chat:_submit()
            task.wait()
            expect(chat.input.Text).to.equal("")
            expect(relay.messages[1].content).to.equal("enter sends this")

            relay.down = true
            chat.lastSent = -math.huge
            chat.input.Text = "this one fails"
            chat:_submit()
            task.wait()
            expect(chat.input.Text).to.equal("this one fails")

            -- switching channel starts over and fetches the new one straight away
            relay.down = false
            chat:SetChannel("off-topic")
            task.wait()
            expect(chat.channel).to.equal("off-topic")
            expect(relay.calls[#relay.calls].path).to.equal("/v1/chat/off-topic")
            expect(chat.status).to.equal("live")
            chat:Clear()
            expect(chat.emptyLabel.Visible).to.equal(true)
        end)

        it("fades every part in and out with the window, messages included", function()
            local relay = fakeRelay()
            relay.add("from the game", { name = "P", roblox = 8 })
            relay.add("from discord: discord.gg/abc", { name = "Mod", discord = true })
            local chat = makeChat(relay, { description = "Talk to the community" })
            chat:Refresh()

            chat:_setShown(true, false)
            local row = chat.rows[relay.messages[2].id]
            expect(chat.title.TextTransparency).to.equal(0)
            expect(chat.sendButton.BackgroundTransparency).to.equal(0)
            expect(row.contentLabel.TextTransparency).to.equal(0)
            expect(row.inviteButton.TextTransparency).to.equal(0)
            -- a message arriving while shown comes in visible
            relay.add("late arrival", { name = "Q", roblox = 9 })
            chat:Refresh()
            expect(chat.rows[relay.messages[3].id].contentLabel.TextTransparency).to.equal(0)

            chat:_toggleEmojiPicker(true)
            chat:_setShown(false, false)
            expect(chat.title.TextTransparency).to.equal(1)
            expect(row.contentLabel.TextTransparency).to.equal(1)
            expect(row.initial.TextTransparency).to.equal(1)
            expect(chat.picker.Visible).to.equal(false)
        end)

        it("goes in either column from the tab, and removes cleanly", function()
            local relay = fakeRelay()
            local w = makeWindow()
            local tab = w:CreateTab({ name = "Both" })
            local left = tab:CreateChat({ transport = relay.transport, poll = false })
            local right = tab:CreateChat({ transport = relay.transport, poll = false, side = "Right" })
            expect(left.main.Parent).to.equal(tab.Left.main)
            expect(right.main.Parent).to.equal(tab.Right.main)

            right:Remove()
            expect(right._alive).to.equal(false)
            expect(table.find(tab.elements, right)).to.equal(nil)
            expect(right:Refresh()).to.equal(false)
        end)
    end)
end
