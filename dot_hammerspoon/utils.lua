local module = {}

module.pressFn = function(mods, key)
    if key == nil then
        key = mods
        mods = {}
    end
    return function()
        hs.eventtap.keyStroke(mods, key, 1000)
    end
end

module.remap = function(mods, key, pressFn)
    hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

module.setMethod = function(name)
    return function()
        hs.keycodes.setMethod(name)
        -- hs.alert.show(hs.keycodes.currentMethod())
    end
end

module.launchApp = function(hyper, key, app)
    hyper:bind({}, key, function()
        hs.application.launchOrFocus(app)
    end)
end

return module
