--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- GIFs, played in Roblox without any server. Roblox can't show a GIF, so this decodes one (LZW,
-- transparency, disposal and interlacing included), cuts each frame to a cell, packs the cells into
-- one sprite sheet and writes that out as a PNG, which the executor can load as a custom asset.
-- Everything runs on `buffer`s, and the slow loops yield now and then so a big GIF never freezes
-- the game.

local gifSheet = {}

local MAX_SIDE = 1024
local MAX_FRAMES = 48

local band, bor, bxor, lshift, rshift, bnot = bit32.band, bit32.bor, bit32.bxor, bit32.lshift, bit32.rshift, bit32.bnot

local function breathe(counter)
    -- a yield every so often keeps the game responsive while a big GIF decodes
    if counter % 2 == 0 and task and task.wait then
        task.wait()
    end
end

-- GIF -------------------------------------------------------------------------------------------

local function readSubBlocks(data, pos)
    local parts = {}
    while true do
        local size = buffer.readu8(data, pos)
        pos += 1
        if size == 0 then
            break
        end
        table.insert(parts, buffer.readstring(data, pos, size))
        pos += size
    end
    return table.concat(parts), pos
end

local function readColorTable(data, pos, count)
    local colors = table.create(count)
    for index = 0, count - 1 do
        local at = pos + index * 3
        colors[index] = { buffer.readu8(data, at), buffer.readu8(data, at + 1), buffer.readu8(data, at + 2) }
    end
    return colors, pos + count * 3
end

-- LZW-decode one frame's pixel indices into a buffer of `count` bytes.
local function lzw(code: string, minSize: number, count: number)
    local out = buffer.create(count)
    local clear = lshift(1, minSize)
    local stop = clear + 1
    local prefix = table.create(4096, 0)
    local suffix = table.create(4096, 0)
    local stack = table.create(4097, 0)
    for index = 0, clear - 1 do
        suffix[index] = index
    end
    local size = minSize + 1
    local mask = lshift(1, size) - 1
    local nextCode = clear + 2
    local old = -1
    local first = 0
    local written = 0
    local bits, value = 0, 0
    local length = #code
    local pos = 1

    while written < count do
        while bits < size do
            if pos > length then
                return out
            end
            value = bor(value, lshift(string.byte(code, pos), bits))
            pos += 1
            bits += 8
        end
        local current = band(value, mask)
        value = rshift(value, size)
        bits -= size

        if current == clear then
            size = minSize + 1
            mask = lshift(1, size) - 1
            nextCode = clear + 2
            old = -1
        elseif current == stop then
            break
        else
            local incoming = current
            local top = 0
            if old == -1 then
                buffer.writeu8(out, written, suffix[current])
                written += 1
                old = current
                first = suffix[current]
                continue
            end
            if current >= nextCode then
                top += 1
                stack[top] = first
                current = old
            end
            while current >= clear do
                top += 1
                stack[top] = suffix[current]
                current = prefix[current]
            end
            first = suffix[current]
            top += 1
            stack[top] = first
            while top > 0 and written < count do
                buffer.writeu8(out, written, stack[top])
                written += 1
                top -= 1
            end
            if nextCode < 4096 then
                prefix[nextCode] = old
                suffix[nextCode] = first
                nextCode += 1
                if nextCode > mask and size < 12 then
                    size += 1
                    mask = lshift(1, size) - 1
                end
            end
            old = incoming
        end
    end
    return out
end

-- Decode a GIF into full-canvas RGBA frames: { width, height, frames = { { pixels, delay } } }.
function gifSheet.decode(data: string)
    local buf = buffer.fromstring(data)
    local header = buffer.readstring(buf, 0, 6)
    if header ~= "GIF87a" and header ~= "GIF89a" then
        error("not a GIF")
    end
    local width = buffer.readu16(buf, 6)
    local height = buffer.readu16(buf, 8)
    local packed = buffer.readu8(buf, 10)
    local pos = 13
    local globalColors = nil
    if band(packed, 0x80) ~= 0 then
        globalColors, pos = readColorTable(buf, pos, lshift(1, band(packed, 7) + 1))
    end

    local canvas = buffer.create(width * height * 4)
    local frames = {}
    local delay, disposal, transparent = 0.1, 0, nil
    local previous = nil
    local total = buffer.len(buf)

    while pos < total and #frames < 400 do
        local block = buffer.readu8(buf, pos)
        pos += 1
        if block == 0x3B then
            break
        elseif block == 0x21 then
            local label = buffer.readu8(buf, pos)
            pos += 1
            if label == 0xF9 then
                local flags = buffer.readu8(buf, pos + 1)
                disposal = band(rshift(flags, 2), 7)
                local centis = buffer.readu16(buf, pos + 2)
                delay = if centis > 1 then centis / 100 else 0.1
                transparent = if band(flags, 1) ~= 0 then buffer.readu8(buf, pos + 4) else nil
            end
            local _, after = readSubBlocks(buf, pos + (if label == 0xF9 then 0 else 0))
            pos = after
        elseif block == 0x2C then
            local left = buffer.readu16(buf, pos)
            local top = buffer.readu16(buf, pos + 2)
            local frameWidth = buffer.readu16(buf, pos + 4)
            local frameHeight = buffer.readu16(buf, pos + 6)
            local flags = buffer.readu8(buf, pos + 8)
            pos += 9
            local colors = globalColors
            if band(flags, 0x80) ~= 0 then
                colors, pos = readColorTable(buf, pos, lshift(1, band(flags, 7) + 1))
            end
            local minSize = buffer.readu8(buf, pos)
            local code
            code, pos = readSubBlocks(buf, pos + 1)
            local indices = lzw(code, minSize, frameWidth * frameHeight)

            if disposal == 3 then
                previous = buffer.create(buffer.len(canvas))
                buffer.copy(previous, 0, canvas)
            end

            -- interlaced rows arrive in four passes
            local rows = table.create(frameHeight)
            if band(flags, 0x40) ~= 0 then
                local row = 0
                for _, pass in { { 0, 8 }, { 4, 8 }, { 2, 4 }, { 1, 2 } } do
                    for y = pass[1], frameHeight - 1, pass[2] do
                        rows[row] = y
                        row += 1
                    end
                end
            else
                for y = 0, frameHeight - 1 do
                    rows[y] = y
                end
            end

            for row = 0, frameHeight - 1 do
                local y = top + rows[row]
                if y < height then
                    for x = 0, frameWidth - 1 do
                        local cx = left + x
                        if cx < width then
                            local index = buffer.readu8(indices, row * frameWidth + x)
                            if index ~= transparent and colors and colors[index] then
                                local color = colors[index]
                                local at = (y * width + cx) * 4
                                buffer.writeu8(canvas, at, color[1])
                                buffer.writeu8(canvas, at + 1, color[2])
                                buffer.writeu8(canvas, at + 2, color[3])
                                buffer.writeu8(canvas, at + 3, 255)
                            end
                        end
                    end
                end
            end

            local snapshot = buffer.create(buffer.len(canvas))
            buffer.copy(snapshot, 0, canvas)
            table.insert(frames, { pixels = snapshot, delay = delay })

            -- what happens to this frame before the next one draws
            if disposal == 2 then
                for y = top, math.min(top + frameHeight, height) - 1 do
                    buffer.fill(canvas, (y * width + left) * 4, 0, math.min(frameWidth, width - left) * 4)
                end
            elseif disposal == 3 and previous then
                buffer.copy(canvas, 0, previous)
            end
            delay, disposal, transparent = 0.1, 0, nil
            breathe(#frames)
        else
            break -- unknown block: stop with what we have
        end
    end

    if #frames == 0 then
        error("the GIF has no frames")
    end
    return { width = width, height = height, frames = frames }
end

-- Sheet -----------------------------------------------------------------------------------------

-- Scale `source` (w x h RGBA) to cover a cell, cropping the overflow evenly, into `sheet` at (dx, dy).
local function drawCover(source, width, height, sheet, sheetWidth, dx, dy, cellWidth, cellHeight)
    local scale = math.max(cellWidth / width, cellHeight / height)
    local offsetX = (width * scale - cellWidth) / 2
    local offsetY = (height * scale - cellHeight) / 2
    for y = 0, cellHeight - 1 do
        local sy = math.clamp((y + offsetY + 0.5) / scale - 0.5, 0, height - 1)
        local y0 = math.floor(sy)
        local y1 = math.min(y0 + 1, height - 1)
        local fy = sy - y0
        for x = 0, cellWidth - 1 do
            local sx = math.clamp((x + offsetX + 0.5) / scale - 0.5, 0, width - 1)
            local x0 = math.floor(sx)
            local x1 = math.min(x0 + 1, width - 1)
            local fx = sx - x0
            local a = (y0 * width + x0) * 4
            local b = (y0 * width + x1) * 4
            local c = (y1 * width + x0) * 4
            local d = (y1 * width + x1) * 4
            local at = ((dy + y) * sheetWidth + dx + x) * 4
            for channel = 0, 3 do
                local top = buffer.readu8(source, a + channel) * (1 - fx) + buffer.readu8(source, b + channel) * fx
                local bottom = buffer.readu8(source, c + channel) * (1 - fx) + buffer.readu8(source, d + channel) * fx
                buffer.writeu8(sheet, at + channel, math.floor(top * (1 - fy) + bottom * fy + 0.5))
            end
        end
    end
end

-- Pack decoded frames into a sheet of `cellWidth` x `cellHeight` cells, no bigger than 1024 a
-- side. Long GIFs keep an evenly spaced selection, played slower so the loop keeps its length.
function gifSheet.pack(decoded, cellWidth: number, cellHeight: number)
    local columns = math.max(math.floor(MAX_SIDE / cellWidth), 1)
    local capacity = math.min(columns * math.max(math.floor(MAX_SIDE / cellHeight), 1), MAX_FRAMES)
    local total = #decoded.frames
    local count = math.min(total, capacity)
    columns = math.min(columns, count)
    local rows = math.ceil(count / columns)
    local sheetWidth, sheetHeight = columns * cellWidth, rows * cellHeight
    local sheet = buffer.create(sheetWidth * sheetHeight * 4)

    local duration = 0
    for _, frame in decoded.frames do
        duration += frame.delay
    end
    for index = 0, count - 1 do
        local frame = decoded.frames[math.floor(index * total / count) + 1]
        drawCover(
            frame.pixels,
            decoded.width,
            decoded.height,
            sheet,
            sheetWidth,
            (index % columns) * cellWidth,
            (index // columns) * cellHeight,
            cellWidth,
            cellHeight
        )
        breathe(index)
    end

    return {
        png = gifSheet.encodePng(sheetWidth, sheetHeight, sheet),
        frames = count,
        columns = columns,
        frameWidth = cellWidth,
        frameHeight = cellHeight,
        fps = if count > 1 and duration > 0 then math.clamp(count / duration, 1, 30) else 0,
    }
end

-- PNG -------------------------------------------------------------------------------------------

local crcTable = nil
local function crc32(data, start, length)
    if not crcTable then
        crcTable = table.create(256)
        for n = 0, 255 do
            local c = n
            for _ = 1, 8 do
                c = if band(c, 1) ~= 0 then bxor(0xEDB88320, rshift(c, 1)) else rshift(c, 1)
            end
            crcTable[n] = c
        end
    end
    local crc = 0xFFFFFFFF
    for index = start, start + length - 1 do
        crc = bxor(crcTable[band(bxor(crc, buffer.readu8(data, index)), 0xFF)], rshift(crc, 8))
    end
    return bnot(crc)
end

local function writeu32be(data, at, value)
    buffer.writeu8(data, at, band(rshift(value, 24), 0xFF))
    buffer.writeu8(data, at + 1, band(rshift(value, 16), 0xFF))
    buffer.writeu8(data, at + 2, band(rshift(value, 8), 0xFF))
    buffer.writeu8(data, at + 3, band(value, 0xFF))
end

-- An RGBA PNG. Stored (uncompressed) deflate: bigger files, but no compressor to run in Luau, and
-- it only ever lands on the player's own disk.
function gifSheet.encodePng(width: number, height: number, pixels): string
    local rowBytes = width * 4 + 1
    local rawLength = rowBytes * height
    local blocks = math.max(math.ceil(rawLength / 65535), 1)
    local idatLength = 2 + rawLength + blocks * 5 + 4
    local total = 8 + (12 + 13) + (12 + idatLength) + 12
    local out = buffer.create(total)
    local at = 0

    buffer.writestring(out, 0, "\137PNG\r\n\26\n")
    at = 8

    -- IHDR
    writeu32be(out, at, 13)
    buffer.writestring(out, at + 4, "IHDR")
    writeu32be(out, at + 8, width)
    writeu32be(out, at + 12, height)
    buffer.writeu8(out, at + 16, 8) -- bit depth
    buffer.writeu8(out, at + 17, 6) -- RGBA
    writeu32be(out, at + 21, crc32(out, at + 4, 17))
    at += 25

    -- IDAT: zlib header, stored deflate blocks of the filtered rows, adler32
    writeu32be(out, at, idatLength)
    buffer.writestring(out, at + 4, "IDAT")
    local dataStart = at + 4
    at += 8
    buffer.writeu8(out, at, 0x78)
    buffer.writeu8(out, at + 1, 0x01)
    at += 2

    -- the filtered image stream: each row prefixed with filter type 0, copied in bulk
    local raw = buffer.create(rawLength)
    local stride = width * 4
    for row = 0, height - 1 do
        buffer.copy(raw, row * rowBytes + 1, pixels, row * stride, stride)
    end
    local s1, s2 = 1, 0
    for index = 0, rawLength - 1 do
        s1 += buffer.readu8(raw, index)
        if s1 >= 65521 then
            s1 -= 65521
        end
        s2 += s1
        if s2 >= 65521 then
            s2 -= 65521
        end
        if index % 262144 == 0 then
            breathe(index // 262144)
        end
    end

    local remaining = rawLength
    local offset = 0
    for block = 1, blocks do
        local length = math.min(remaining, 65535)
        buffer.writeu8(out, at, if block == blocks then 1 else 0)
        buffer.writeu16(out, at + 1, length)
        buffer.writeu16(out, at + 3, bxor(length, 0xFFFF))
        buffer.copy(out, at + 5, raw, offset, length)
        at += 5 + length
        offset += length
        remaining -= length
    end
    writeu32be(out, at, bor(lshift(s2, 16), s1))
    at += 4
    writeu32be(out, at, crc32(out, dataStart, at - dataStart))
    at += 4

    -- IEND
    writeu32be(out, at, 0)
    buffer.writestring(out, at + 4, "IEND")
    writeu32be(out, at + 8, crc32(out, at + 4, 4))

    return buffer.tostring(out)
end

return gifSheet
