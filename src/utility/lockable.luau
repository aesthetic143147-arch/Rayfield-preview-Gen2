--!strict

-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Shared Lock/Unlock for tab elements. Call lockable(Class) once on the prototype.
--
-- A locked element does three things, and it needs all three: it dims so you can see it's out
-- of reach, it stops taking input, and its callback won't fire. The last one is the important
-- one - a lock that only greys the pixels is a lock that other libraries have shipped broken.

local function lockable<T>(class: T): T
    local target = class :: any

    -- Lock it. `reason` is an optional line shown in place of the description while locked.
    function target:Lock(reason: string?)
        self.window:_setElementLocked(self, true, reason)
    end

    function target:Unlock()
        self.window:_setElementLocked(self, false)
    end

    function target:IsLocked(): boolean
        return self.locked == true
    end

    return class
end

return lockable
