--- @param callback any
function _G.async(callback)
    coroutine.resume(coroutine.create(callback))
end
