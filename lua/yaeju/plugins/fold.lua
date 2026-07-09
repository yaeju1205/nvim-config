vim.plugin.namespace("yaeju-fold", function()
    vim.plugin.install("kevinhwang91/nvim-ufo", {
        requires = {
            { origin = "kevinhwang91/promise-async" }
        }
    })(function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        vim.opt.fillchars = {
            fold = " ",
            foldsep = " ",
            foldinner = " ",
            foldopen = "",
            foldclose = "",
        }

        if vim.g.icons_style == "ascii" then
            vim.opt.fillchars = {
                fold = " ",
                foldsep = " ",
                foldinner = " ",
                foldopen = "O",
                foldclose = "C",
            }
        end

        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end
        })
    end)
end)
