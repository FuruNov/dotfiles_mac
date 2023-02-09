local alert = require("hs.alert")
local doublePress = require("doublePress")
local hyper = require("hyper")
local utils = require("utils")
-- local vim = require("vim")
local stackline = require "stackline"
stackline:init()

-- Set eisu to toggle input method
hs.hotkey.bind({}, "eisu", utils.setMethod("Hiragana (Google)"), utils.setMethod("Alphanumeric (Google)"))
-- Set Hyper Key to F19
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

-- Start Hyper Key Config

hyper:bind({}, "r", hs.reload)
hyper:bind({}, "escape", hs.caffeinate.systemSleep)

utils.launchApp(hyper, ",", "System Preferences")
utils.launchApp(hyper, "a", "Activity Monitor")
utils.launchApp(hyper, "c", "Visual Studio Code")
utils.launchApp(hyper, "d", "DeepL")
utils.launchApp(hyper, "f", "Floorp")
utils.launchApp(hyper, "g", "Gyazo")
utils.launchApp(hyper, "h", "Finder")
utils.launchApp(hyper, "j", "JupyterLab")
utils.launchApp(hyper, "l", "Logseq")
utils.launchApp(hyper, "m", "Mail")
utils.launchApp(hyper, "n", "Notion")
utils.launchApp(hyper, "o", "Microsoft Outlook")
utils.launchApp(hyper, "s", "Slack")
utils.launchApp(hyper, "t", "Microsoft Teams")
utils.launchApp(hyper, "v", "Vivaldi")
utils.launchApp(hyper, "z", "Zotero")

-- End Hyper Key Config

-- Start Double-pressed Key Config

doublePress.new("ctrl", nil)
doublePress.new("cmd", nil)
doublePress.new("alt", function()
    hs.application.launchOrFocus("Warp")
end)
doublePress.new("shift", nil)

-- End Double-pressed Key Config

hs.alert.show("Config loaded")
