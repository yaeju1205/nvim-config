vim.plugin.namespace("yaeju-signcolumn", function()
    vim.plugin.install("lewis6991/gitsigns.nvim")(function()
        require("gitsigns").setup({
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "┃" },
                topdelete = { text = "┃" },
                changedelete = { text = "┃" },
                untracked = { text = "┆" },
            },
            signs_staged = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "┃" },
                topdelete = { text = "┃" },
                changedelete = { text = "┃" },
                untracked = { text = "┆" },
            },
            signs_staged_enable = false,
            signcolumn = false,
        })
    end)
end)
