-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Stamps the bundle `make bundle` writes into the file that ships: a header saying what it is,
-- how to load it, who made what it's built on, and the licence it comes under. loadstring
-- ignores comments, so none of this costs anything at runtime.
--
--   lune run scripts/dist.luau -- <bundle> <output>

local fs = require("@lune/fs")
local process = require("@lune/process")

local input = process.args[1] or "build/bundled.luau"
local output = process.args[2] or "dist/RayfieldColumns.luau"

local repository = "aesthetic143147-arch/Rayfiend-preview-Gen2"
local upstreamVersion = "1.2.0"

local function trim(text: string): string
    return (string.gsub(text, "^%s+", ""):gsub("%s+$", ""))
end

assert(fs.isFile(input), `No bundle at {input} - run make bundle first`)
local version = trim(fs.readFile("version.txt"))
assert(version ~= "", "version.txt is empty")

local header = table.concat({
    `-- Rayfield Columns v{version}`,
    "-- A fan-made two-column edition of Rayfield Gen2. Unofficial: not made, endorsed or supported by Sirius.",
    "--",
    `-- local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/{repository}/main/{output}"))()`,
    "--",
    `-- Built on Rayfield Gen2 {upstreamVersion} by Sirius - https://sirius.menu - https://github.com/SiriusSoftwareLtd/rayfield-gen2`,
    "-- Copyright (c) 2026 Corridon Capital",
    "-- This Source Code Form is subject to the terms of the Mozilla Public",
    "-- License, v. 2.0. If a copy of the MPL was not distributed with this",
    "-- file, You can obtain one at https://mozilla.org/MPL/2.0/.",
    "--",
    `-- Source: https://github.com/{repository}`,
    "--",
    "",
}, "\n")

local slash = string.find(output, "/[^/]*$")
if slash then
    fs.writeDir(string.sub(output, 1, slash - 1))
end
fs.writeFile(output, header .. fs.readFile(input))
print(`wrote {output} (Rayfield Columns v{version})`)
