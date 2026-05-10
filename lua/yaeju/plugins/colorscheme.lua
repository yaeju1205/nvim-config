vim.plugin.namespace("yaeju-colorscheme", function()
    vim.plugin.install("yaeju1205/sakura.vim")(function()
        vim.cmd.colorscheme("sakura")
    end)

    vim.plugin.install("yaeju1205/transparent.nvim")(function()
        require("transparent").setup({
            groups = {
                "Normal",
                "Comment",
            },
        })
    end)
end)
