local alert = require("hs.alert")
local timer = require("hs.timer")
local eventtap = require("hs.eventtap")
local events = eventtap.event.types

local DoublePress = {}
function DoublePress.new(key, action)
    local module = {}
    module.timeFrame = 1
    module.key = key
    module.action = action
    if not action then
        module.action = function()
            alert(module.key .. "×2")
        end
    end
    local timeFirstControl, firstDown, secondDown = 0, false, false
    -- verify that no keyboard flags are being pressed
    local noFlags = function(ev)
        local result = true
        for k, v in pairs(ev:getFlags()) do
            if v then
                result = false
                break
            end
        end
        return result
    end
    -- verify that *only* the ctrl key flag is being pressed
    local onlyKey = function(ev)
        local result = ev:getFlags()[module.key]
        for k, v in pairs(ev:getFlags()) do
            if k ~= module.key and v then
                result = false
                break
            end
        end
        return result
    end
    -- the actual workhorse

    module.eventWatcher = eventtap.new({events.flagsChanged, events.keyDown}, function(ev)
        -- if it's been too long; previous state doesn't matter
        if (timer.secondsSinceEpoch() - timeFirstControl) > module.timeFrame then
            timeFirstControl, firstDown, secondDown = 0, false, false
        end

        if ev:getType() == events.flagsChanged then
            if noFlags(ev) and firstDown and secondDown then -- ctrl up and we've seen two, so do action
                if module.action then
                    module.action()
                end
                timeFirstControl, firstDown, secondDown = 0, false, false
            elseif onlyKey(ev) and not firstDown then -- ctrl down and it's a first
                firstDown = true
                timeFirstControl = timer.secondsSinceEpoch()
            elseif onlyKey(ev) and firstDown then -- ctrl down and it's the second
                secondDown = true
            elseif not noFlags(ev) then -- otherwise reset and start over
                timeFirstControl, firstDown, secondDown = 0, false, false
            end
        else -- it was a key press, so not a lone ctrl char -- we don't care about it
            timeFirstControl, firstDown, secondDown = 0, false, false
        end
        return false
    end):start()

    return module
end

return DoublePress
