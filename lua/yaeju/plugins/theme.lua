vim.plugin.namespace("yaeju-theme", function()
    vim.plugin.install("anAcc22/sakura.nvim", {
        requires = {
            { origin = "rktjmp/lush.nvim" },
            { origin = "nvim-lualine/lualine.nvim" }
        }
    })(function()
        vim.cmd.colorscheme("sakura")

        require("lualine").setup({
            options = require("lualine.themes.sakura")
        })
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
