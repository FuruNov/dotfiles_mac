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
-- End Hyper Key Config

-- Start DoublePress Key Config
doublePress.new("ctrl", function()
    alert("You double tapped ctrl")
end)
doublePress.new("cmd")
doublePress.new("alt")
doublePress.new("shift")
-- End DoublePress Key Config

hs.alert.show("Config loaded")
