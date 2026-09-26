--!nonstrict

-- Rayfield Columns - a fan-made two-column edition of Rayfield Gen2.
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- One JSON round trip to the developer's relay (relay/ in this repo), shared by the Chat element
-- and nameplates. `owner` carries endpoint, key and an optional transport; a transport replaces
-- the HTTP call entirely (a custom backend, or a test) and returns the same (ok, data) pair.

local variables = require(script.Parent.variables)
local network = require(script.Parent.network)

local relayClient = {}

function relayClient.request(owner, method: string, path: string, body: any?): (boolean, any)
    if owner.transport then
        local ok, result, data = pcall(owner.transport, method, path, body)
        if not ok then
            return false, { error = tostring(result) }
        end
        return result, data
    end
    if type(owner.endpoint) ~= "string" then
        return false, { error = "No relay address." }
    end

    local requestFn = network.getRequestFn()
    if not requestFn then
        return false, { error = "This executor can't make web requests." }
    end

    local headers = { ["Content-Type"] = "application/json" }
    if owner.key then
        headers["X-Chat-Key"] = tostring(owner.key)
    end
    local ok, response = pcall(requestFn, {
        Url = owner.endpoint .. path,
        Method = method,
        Headers = headers,
        Body = if body ~= nil then variables.httpService:JSONEncode(body) else nil,
    })
    if not ok or type(response) ~= "table" then
        return false, { error = "No response from the relay." }
    end

    local decoded = nil
    if type(response.Body) == "string" and response.Body ~= "" then
        local parsed, value = pcall(variables.httpService.JSONDecode, variables.httpService, response.Body)
        decoded = if parsed then value else nil
    end
    local code = tonumber(response.StatusCode) or 0
    return code >= 200 and code < 300, decoded or {}
end

-- A path segment, percent-encoded (HttpService:UrlEncode isn't everywhere this runs).
function relayClient.segment(value): string
    local encoded = tostring(value):gsub("[^%w%-_%.~]", function(char)
        return string.format("%%%02X", string.byte(char))
    end)
    return encoded
end

-- Trailing slashes off a base URL, so paths join cleanly.
function relayClient.base(endpoint): string?
    if type(endpoint) ~= "string" then
        return nil
    end
    local trimmed = endpoint:gsub("/+$", "")
    return trimmed
end

return relayClient
