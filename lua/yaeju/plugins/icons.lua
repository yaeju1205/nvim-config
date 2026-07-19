vim.plugin.namespace("yaeju-icons", function()
    vim.plugin.install_sync("nvim-mini/mini.icons") do
        vim.icons = require("mini.icons")
        vim.icons.setup({
            style = vim.g.icons_style,
        })
    end
end)
