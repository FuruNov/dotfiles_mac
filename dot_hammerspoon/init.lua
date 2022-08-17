local alert = require("hs.alert")
local doublePress = require("doublePress")
local hyper = require("hyper")
local utils = require("utils")
-- local vim = require("vim")

hs.hotkey.bind({}, "eisu", utils.setMethod("Hiragana (Google)"), utils.setMethod("Alphanumeric (Google)"))
-- Set Hyper Key to F19
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

-- Start Hyper Key Config
-- Set Hyper Key Bindings
hyper:bind({}, 'g', function()
    alert("Hyper Key pressed")
end)
hyper:bind({}, "r", function()
    hs.reload()
end)

for key, app in pairs({
    a = "Activity Monitor",
    c = "Visual Studio Code",
    o = "Obsidian",
    s = "Slack",
    t = "Microsoft Teams",
    v = "Vivaldi",
    z = "Zotero"
}) do
    utils.launchApp(hyper, key, app)
end

-- End Hyper Key Config

-- Start DoublePress Key Config
doublePress.new("ctrl")
doublePress.new("cmd")
doublePress.new("alt", function()
    hs.application.launchOrFocus("Warp")
end)
doublePress.new("shift")
-- End DoublePress Key Config

hs.alert.show("Config loaded")
