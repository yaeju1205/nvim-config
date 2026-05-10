vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        vim.g.cord_defer_startup = true

        require("cord").setup()
    end)
end)
