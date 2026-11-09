vim.plugin.namespace("yaeju-tools", function()
    vim.plugin.install("saecki/crates.nvim", {
        branch = "stable"
    })(function()
        require('crates').setup()
    end)

    vim.plugin.install("lopi-py/luau-lsp.nvim")(function()
        local function rojo_project()
            return vim.fs.root(0, function(name)
                return name:match ".+%.project%.json$"
            end)
        end

        require("luau-lsp").setup({
            platform = {
                type = rojo_project() and "roblox" or "standard",
            },
        })
    end)
end)
