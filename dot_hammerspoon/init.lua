local alert = require("hs.alert")
local doublePress = require("doublePress")
local hyper = require("hyper")
local utils = require("utils")
local Caffeine = hs.loadSpoon("Caffeine")
-- local vim = require("vim")
local stackline = require "stackline"
stackline:init()

-- Set eisu to toggle input method
hs.hotkey.bind({}, "eisu", utils.setMethod("Hiragana (Google)"), utils.setMethod("Alphanumeric (Google)"))
-- Set Hyper Key to F19
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

-- Start Hyper Key Config

-- hyper:bind({'shift'}, 'g', function()
--     local screen = hs.mouse.getCurrentScreen()
--     if screen:getBrightness() > 0 then
--         screen:setBrightness(0)
--         -- Caffeine:start()
--     else
--         screen:setBrightness(0.5)
--         -- Caffeine:stop()
--     end
-- end)
hyper:bind({}, "r", hs.reload)
hyper:bind({}, "escape", hs.caffeinate.systemSleep)

-- hyper:bind({}, "h", utils.pressFn({"alt"}, "left"), nil, utils.pressFn({"alt"}, "left"))
-- hyper:bind({}, "j", utils.pressFn("down"), nil, utils.pressFn("down"))
-- hyper:bind({}, "k", utils.pressFn("up"), nil, utils.pressFn("up"))
-- hyper:bind({}, "l", utils.pressFn({"alt"}, "right"), nil, utils.pressFn({"alt"}, "right"))
-- hyper:bind({}, "h", function()
--     hs.execute("open ~/")
-- end)

-- hyper:bind({}, "d", function()
--     utils.pressFn("home")()
--     utils.pressFn("home")()
--     utils.pressFn({"shift"}, "end")()
--     utils.pressFn("delete")()
--     utils.pressFn("delete")()
-- end)
-- hyper:bind({"cmd"}, "g", function()
--     hs.urlevent.openURL("https://github.com/")
-- end)

utils.launchApp(hyper, ",", "System Preferences")
for key, app in pairs({
    a = "Activity Monitor",
    c = "Visual Studio Code",
    d = "DeepL",
    f = "Floorp",
    g = "Gyazo",
    h = "Finder",
    j = "JupyterLab",
    l = "Logseq",
    m = "Mail",
    n = "Notion",
    o = "Microsoft Outlook",
    s = "Slack",
    t = "Microsoft Teams",
    v = "Vivaldi",
    z = "Zotero"
}) do
    utils.launchApp(hyper, key, app)
end

-- End Hyper Key Config

-- Start Double-pressed Key Config

for key, func in pairs({
    ctrl = nil,
    cmd = nil,
    alt = function()
        hs.application.launchOrFocus("Warp")
    end,
    shift = nil
}) do
    doublePress.new(key, func)
end

-- End Double-pressed Key Config

hs.alert.show("Config loaded")
