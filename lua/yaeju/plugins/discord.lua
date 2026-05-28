vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        vim.g.cord_defer_startup = true

        require("cord").setup({
            ipc = {
                socket = "discord-ipc-1",
            },
            display = {
                theme = "classic"
            }
        })
    end)
end)
