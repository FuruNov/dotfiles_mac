local alert = require("hs.alert")
local DoublePress = require("DoublePress")

DoublePress.new("ctrl", function()
    alert("You double tapped " .. "ctrl" .. "!")
end)
DoublePress.new("cmd")
DoublePress.new("alt")
DoublePress.new("shift")

local function pressFn(mods, key)
    if key == nil then
        key = mods
        mods = {}
    end
    return function()
        hs.eventtap.keyStroke(mods, key, 1000)
    end
end

local function remap(mods, key, pressFn)
    hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

-- Key Bind Config

-- hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
--   hs.reload()
-- end)

-- START HYPER KEY CONFIG

hyper = hs.hotkey.modal.new({}, nil)
hyper.pressed = function()
    hyper:enter()
end
hyper.released = function()
    hyper:exit()
end
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)
hyper:bind({}, 'g', function()
    hs.alert.show("Hyper Key pressed")
end)
hyper:bind({}, "R", function()
    hs.reload()
end)

--- END HYPER KEY CONFIG

--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim:disableForApp('Code'):disableForApp('zoom.us'):disableForApp('iTerm'):disableForApp('iTerm2'):disableForApp(
    'Terminal')

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("Courier New")

-- Enter normal mode by typing a key sequence
vim:enterWithSequence('jk')

-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
-- vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })

--------------------------------
-- END VIM CONFIG
--------------------------------

hs.alert.show("Config loaded")
