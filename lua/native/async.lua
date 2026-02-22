--- @param callback any
function _G.async(callback)
    if type(callback) == "string" then
        return async(function()
            require(callback)
        end)
    end

    vim.schedule(callback)
end
