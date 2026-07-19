vim.plugin.namespace("yaeju-explorer", function()
    vim.plugin.install_sync("stevearc/oil.nvim") do
        local oil = require("oil")

        oil.setup({
            view_options = {
                is_always_hidden = function(name)
                    for _, file in pairs(vim.g.find_ignore_files) do
                        if name == file then
                            return true
                        end
                    end
                end,
                show_hidden = true,
            },
            keymaps = {
                ["<esc>"] = { "actions.close", mode = "n" },
            },
            float = {
                padding = 2,
                border = "single",
                win_options = {
                    winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
                    winblend = 0,
                },
            },
        })

        vim.keymap.set("n", "<leader>e", oil.open_float, { desc = "Oil Open Directory" })
    end
end)
