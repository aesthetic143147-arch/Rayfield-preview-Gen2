local helpers = (_G :: any).__RAYFIELD_TEST_HELPERS

-- GIFs decoded and packed on the player's machine, against real GIF files (made with sharp and
-- embedded here), with the executor's file and network functions stood in for.
return function()
    local gifSheet = helpers.requireUtility("gifSheet")
    local mediaLoader = helpers.requireUtility("mediaLoader")

    local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local function fromBase64(text)
        local lookup = {}
        for i = 1, #alphabet do
            lookup[alphabet:sub(i, i)] = i - 1
        end
        local out, bits, value = {}, 0, 0
        for i = 1, #text do
            local digit = lookup[text:sub(i, i)]
            if digit then
                value = bit32.bor(bit32.lshift(value, 6), digit)
                bits += 6
                if bits >= 8 then
                    bits -= 8
                    table.insert(out, string.char(bit32.band(bit32.rshift(value, bits), 0xFF)))
                end
            end
        end
        return table.concat(out)
    end

    -- three 64x32 frames: red, green, blue
    local solid = fromBase64(
        "R0lGODlhQAAgAIAAAExpcf8AACH/C05FVFNDQVBFMi4wAwEAAAAh+QQFCAAAACwAAAAAQAAgAAACLYyPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gvH8kzX9o3n+s73/g8MCoekAgAh+QQFCAAAACwAAAAAQAAgAIBMaXEA/wACLYyPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gvH8kzX9o3n+s73/g8MCoekAgAh+QQFCAAAACwAAAAAQAAgAIBMaXEAAP8CLYyPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gvH8kzX9o3n+s73/g8MCoekAgA7"
    )
    -- 40x40, left half magenta, right half transparent
    local alpha = fromBase64(
        "R0lGODlhKAAoAIAAAExpcf8A/yH/C05FVFNDQVBFMi4wAwEAAAAh+QQFEAAAACwAAAAAKAAoAAACXIyPmcDt/5SUsNaJj90tZ855GLiJE2mZFAqpCtu6CBzJGt3ZBp7rPKPb/YKBH4BoRA6DSebS97Q1oTxl1Xml4qxbbFdL44a9YzBMfCanzSx0W/1mo9xzeF1OopMKADs="
    )

    local function pixel(frame, width, x, y)
        local at = (y * width + x) * 4
        return buffer.readu8(frame.pixels, at),
            buffer.readu8(frame.pixels, at + 1),
            buffer.readu8(frame.pixels, at + 2),
            buffer.readu8(frame.pixels, at + 3)
    end

    describe("utility gifSheet", function()
        it("decodes every frame of a GIF, with its colours and timing", function()
            local decoded = gifSheet.decode(solid)
            expect(decoded.width).to.equal(64)
            expect(decoded.height).to.equal(32)
            expect(#decoded.frames).to.equal(3)
            local r, g, b, a = pixel(decoded.frames[1], 64, 10, 10)
            expect(r == 255 and g == 0 and b == 0 and a == 255).to.equal(true)
            r, g, b = pixel(decoded.frames[3], 64, 60, 30)
            expect(r == 0 and g == 0 and b == 255).to.equal(true)
            expect(decoded.frames[2].delay).to.equal(0.08)
        end)

        it("keeps transparency", function()
            local decoded = gifSheet.decode(alpha)
            local _, _, _, left = pixel(decoded.frames[1], 40, 5, 20)
            local _, _, _, right = pixel(decoded.frames[1], 40, 35, 20)
            expect(left).to.equal(255)
            expect(right).to.equal(0)
        end)

        it("packs frames into a sprite sheet PNG at the GIF's speed", function()
            local sheet = gifSheet.pack(gifSheet.decode(solid), 256, 64)
            expect(sheet.frames).to.equal(3)
            expect(sheet.columns).to.equal(3)
            expect(math.abs(sheet.fps - 12.5) < 0.01).to.equal(true)
            expect(sheet.png:sub(1, 8)).to.equal("\137PNG\r\n\26\n")
            -- IHDR: 768 x 64
            expect(string.unpack(">I4", sheet.png, 17)).to.equal(768)
            expect(string.unpack(">I4", sheet.png, 21)).to.equal(64)
            expect(sheet.png:sub(-8, -5)).to.equal("IEND")
        end)

        it("refuses things that aren't GIFs", function()
            expect(pcall(gifSheet.decode, "not a gif at all")).to.equal(false)
        end)
    end)

    describe("utility mediaLoader", function()
        local original
        local files, fetched

        beforeEach(function()
            original = mediaLoader.io
            files, fetched = {}, {}
            mediaLoader.io = {
                get = function(url)
                    table.insert(fetched, url)
                    if url == "https://tenor.com/view/cat-gif-1" then
                        return true, '<html><img src="https://media1.tenor.com/m/abc/cat.gif"></html>'
                    elseif url:find("%.gif$") then
                        return true, solid
                    elseif url:find("%.png$") then
                        return true, "\137PNG\r\n\26\n....."
                    end
                    return false, "404"
                end,
                isfile = function(file)
                    return files[file] ~= nil
                end,
                read = function(file)
                    return files[file]
                end,
                write = function(file, content)
                    files[file] = content
                end,
                asset = function(file)
                    return "rbxasset://custom/" .. file
                end,
            }
        end)

        afterEach(function()
            mediaLoader.io = original
        end)

        it("turns page links into the image they show", function()
            local get = mediaLoader.io.get
            expect(mediaLoader.direct("https://giphy.com/gifs/cat-dance-xT9IgG50Lg7russbD6", get)).to.equal(
                "https://i.giphy.com/media/xT9IgG50Lg7russbD6/giphy.gif"
            )
            expect(mediaLoader.direct("https://imgur.com/abc123", get)).to.equal("https://i.imgur.com/abc123.gif")
            expect(mediaLoader.direct("https://i.imgur.com/abc123.gifv", get)).to.equal(
                "https://i.imgur.com/abc123.gif"
            )
            expect(mediaLoader.direct("https://tenor.com/view/cat-gif-1", get)).to.equal(
                "https://media1.tenor.com/m/abc/cat.gif"
            )
        end)

        it("loads a GIF link as a sprite sheet, once", function()
            local visual = mediaLoader.load("https://tenor.com/view/cat-gif-1", "banner")
            expect(visual.sheet.frames).to.equal(3)
            expect(visual.sheet.frameWidth).to.equal(256)
            expect(visual.uri:find("rbxasset://custom/", 1, true)).to.be.ok()
            local downloads = #fetched

            local again = mediaLoader.load("https://tenor.com/view/cat-gif-1", "banner")
            expect(again.uri).to.equal(visual.uri)
            expect(#fetched).to.equal(downloads) -- straight from disk the second time
        end)

        it("uses a PNG as it is, and reads files from the Nameplate folder", function()
            local still = mediaLoader.load("https://i.imgur.com/me.png")
            expect(still.sheet).to.equal(nil)
            expect(still.uri:find("%.png$")).to.be.ok()

            files[mediaLoader.folder() .. "/dance.gif"] = solid
            local fromFile = mediaLoader.load("dance.gif", "square")
            expect(fromFile.sheet.frameWidth).to.equal(128)
        end)

        it("says what went wrong", function()
            local _, missing = mediaLoader.load("nope.gif")
            expect(missing:find("No file", 1, true)).to.be.ok()
            local _, notImage = mediaLoader.load("https://example.com/page")
            expect(notImage).to.be.a("string")
            local _, empty = mediaLoader.load("   ")
            expect(empty:find("Paste", 1, true)).to.be.ok()
        end)
    end)
end
