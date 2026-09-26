--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Whatever someone pastes, as something an ImageLabel can show. Takes:
--   a Tenor, Giphy or Imgur page link   ("https://tenor.com/view/…", "https://giphy.com/gifs/…")
--   a direct image or GIF link          (Discord, Tenor, Giphy, Imgur, anywhere the executor can reach)
--   a file name in workspace/RayfieldColumns/Nameplate   ("cat.gif")
-- GIFs are decoded and packed into a sprite sheet here, on the player's machine (see gifSheet);
-- PNGs and JPGs are used as they are. Results are cached on disk by link, so a GIF is only ever
-- converted once.

local variables = require(script.Parent.variables)
local network = require(script.Parent.network)
local filesystem = require(script.Parent.filesystem)
local path = require(script.Parent.path)
local gifSheet = require(script.Parent.gifSheet)

local mediaLoader = {}

-- cell size per shape: a banner fills the card, a square fills the logo spot
mediaLoader.fits = {
    banner = Vector2.new(256, 64),
    square = Vector2.new(128, 128),
}

local MAX_BYTES = 8 * 1024 * 1024

-- The folder players drop their own files into.
function mediaLoader.folder(): string
    return path.join(variables.fileSystemManager:getRootFolder(), "Nameplate")
end

local function hash(text: string): string
    local h1, h2 = 5381, 52711
    for index = 1, #text do
        local byte = string.byte(text, index)
        h1 = bit32.band(h1 * 33 + byte, 0xFFFFFFFF)
        h2 = bit32.band(h2 * 31 + byte, 0xFFFFFFFF)
    end
    return string.format("%08x%08x", h1, h2)
end

-- Page links to the image they show. Needs a fetch for Tenor (its media ids aren't in the page
-- URL); Giphy and Imgur can be worked out from the link alone.
function mediaLoader.direct(link: string, get): (string?, string?)
    link = link:gsub("^%s+", ""):gsub("%s+$", "")
    local giphy = link:match("^https?://giphy%.com/gifs/[%w%-]*%-(%w+)/?$")
        or link:match("^https?://giphy%.com/gifs/(%w+)/?$")
    if giphy then
        return `https://i.giphy.com/media/{giphy}/giphy.gif`
    end
    local imgur = link:match("^https?://imgur%.com/(%w+)/?$")
    if imgur then
        return `https://i.imgur.com/{imgur}.gif`
    end
    local gifv = link:match("^(https?://i%.imgur%.com/%w+)%.gifv$") or link:match("^(https?://i%.imgur%.com/%w+)%.mp4$")
    if gifv then
        return gifv .. ".gif"
    end
    if link:match("^https?://tenor%.com/") or link:match("^https?://www%.tenor%.com/") then
        local ok, page = get(link)
        if not ok then
            return nil, "Couldn't open that Tenor page."
        end
        local found = page:match('"(https://media%d*%.tenor%.com/[^"]-%.gif)"')
            or page:match("(https://media%d*%.tenor%.com/[^\"'%s<>]-%.gif)")
        if not found then
            return nil, "Couldn't find the GIF on that Tenor page."
        end
        return found
    end
    return link
end

local function defaultGet(url: string): (boolean, string)
    local requestFn = network.getRequestFn()
    if not requestFn then
        return false, "This executor can't make web requests."
    end
    local ok, response = pcall(requestFn, { Url = url, Method = "GET" })
    if not ok or type(response) ~= "table" then
        return false, "Couldn't download that."
    end
    local code = tonumber(response.StatusCode) or 0
    if code < 200 or code >= 300 or type(response.Body) ~= "string" then
        return false, "Couldn't download that (" .. tostring(code) .. ")."
    end
    return true, response.Body
end

-- The executor pieces, swappable for tests.
mediaLoader.io = {
    get = defaultGet,
    isfile = function(file)
        return filesystem.isfile(file)
    end,
    read = function(file)
        return filesystem.readfile(file)
    end,
    write = function(file, content)
        filesystem.ensureFolder(variables.fileSystemManager:getRootFolder())
        filesystem.ensureFolder(variables.fileSystemManager:getAssetsFolder())
        filesystem.writefile(file, content)
    end,
    asset = function(file)
        local getcustomasset = getfenv().getcustomasset
        if type(getcustomasset) ~= "function" then
            return nil
        end
        local ok, uri = pcall(getcustomasset, file)
        return if ok and type(uri) == "string" then uri else nil
    end,
}

local function kind(bytes: string): string?
    if bytes:sub(1, 6) == "GIF87a" or bytes:sub(1, 6) == "GIF89a" then
        return "gif"
    elseif bytes:sub(1, 8) == "\137PNG\r\n\26\n" then
        return "png"
    elseif bytes:sub(1, 3) == "\255\216\255" then
        return "jpg"
    elseif bytes:sub(1, 4) == "RIFF" and bytes:sub(9, 12) == "WEBP" then
        return "webp"
    end
    return nil
end

-- Load a link or file name as a visual (see animatedImage). Yields. Returns visual or nil, reason.
function mediaLoader.load(source: string, fit: string?)
    local io = mediaLoader.io
    if type(source) ~= "string" or source:match("^%s*$") then
        return nil, "Paste a link or a file name."
    end
    source = source:gsub("^%s+", ""):gsub("%s+$", "")
    local cell = mediaLoader.fits[fit or "banner"] or mediaLoader.fits.banner
    local key = hash(source .. "|" .. tostring(cell))
    local assets = variables.fileSystemManager:getAssetsFolder()
    local sheetFile = path.join(assets, "media_" .. key .. ".png")
    local metaFile = path.join(assets, "media_" .. key .. ".json")

    -- converted before: straight from disk
    local cachedOk, cached = pcall(function()
        if io.isfile(metaFile) then
            return variables.httpService:JSONDecode(io.read(metaFile))
        end
        return nil
    end)
    if cachedOk and type(cached) == "table" and cached.file and io.isfile(cached.file) then
        local uri = io.asset(cached.file)
        if uri then
            return mediaLoader.visual(uri, cached)
        end
    end

    -- the bytes: a local file, or a download
    local bytes
    if source:match("^https?://") then
        local link, why = mediaLoader.direct(source, io.get)
        if not link then
            return nil, why
        end
        local ok, body = io.get(link)
        if not ok then
            return nil, body
        end
        bytes = body
    else
        local file = if source:find("/", 1, true) then source else path.join(mediaLoader.folder(), source)
        local ok, body = pcall(function()
            return if io.isfile(file) then io.read(file) else nil
        end)
        if not ok or not body then
            return nil, `No file called {source} in workspace/{mediaLoader.folder()}.`
        end
        bytes = body
    end
    if #bytes > MAX_BYTES then
        return nil, "That file is too big (8 MB at most)."
    end

    local format = kind(bytes)
    local meta
    if format == "gif" then
        local ok, result = pcall(function()
            return gifSheet.pack(gifSheet.decode(bytes), cell.X, cell.Y)
        end)
        if not ok then
            return nil, "That GIF couldn't be read."
        end
        meta = {
            file = sheetFile,
            frames = result.frames,
            columns = result.columns,
            frameWidth = result.frameWidth,
            frameHeight = result.frameHeight,
            fps = result.fps,
        }
        io.write(sheetFile, result.png)
    elseif format == "png" or format == "jpg" then
        meta = { file = path.join(assets, "media_" .. key .. "." .. format), frames = 1 }
        io.write(meta.file, bytes)
    elseif format == "webp" then
        return nil, "WebP isn't supported. Use a GIF, PNG or JPG link."
    else
        return nil, "That link isn't an image or a GIF."
    end
    pcall(io.write, metaFile, variables.httpService:JSONEncode(meta))

    local uri = io.asset(meta.file)
    if not uri then
        return nil, "This executor can't load custom images."
    end
    return mediaLoader.visual(uri, meta)
end

function mediaLoader.visual(uri: string, meta)
    if (meta.frames or 1) <= 1 then
        return { uri = uri }
    end
    return {
        uri = uri,
        sheet = {
            frames = meta.frames,
            columns = meta.columns,
            frameWidth = meta.frameWidth,
            frameHeight = meta.frameHeight,
            fps = meta.fps,
        },
    }
end

return mediaLoader
