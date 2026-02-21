--- @param callback any
function _G.async(callback)
    if type(callback) == "string" then
        return async(function()
            require(callback)
        end)
    end

    coroutine.resume(coroutine.create(callback))
end
