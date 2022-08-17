local module = hs.hotkey.modal.new({}, nil)
module.pressed = function()
    module:enter()
end
module.released = function()
    module:exit()
end

return module
