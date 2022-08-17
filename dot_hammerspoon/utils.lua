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

return module
