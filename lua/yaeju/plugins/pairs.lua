vim.plugin.namespace("yaeju-pairs", function()
    vim.plugin.install("yaeju1205/warp.nvim")(function()
        require("warp").setup()
    end)

    vim.plugin.install("windwp/nvim-autopairs")(function()
        require("nvim-autopairs").setup()
    end)
end)
