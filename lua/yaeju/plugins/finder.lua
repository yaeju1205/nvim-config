vim.plugin.namespace("yaeju-finder", function()
    vim.plugin.install("ibhagwan/fzf-lua")(function()
        local fzf_lua = require("fzf-lua")

        fzf_lua.setup({
            winopts = {
                backdrop = 70,
                border = "single",
                preview = {
                    border = "single",
                    delay = 5,
                    title_pos = "left",
                    vertical = "down:40%",
                    winopts = {
                        number = true,
                        relativenumber = false,
                        cursorline = true,
                        cursorlineopt = "both",
                        cursorcolumn = false,
                        signcolumn = "no",
                        list = false,
                        foldenable = false,
                        foldmethod = "manual",
                        scrolloff = 0,
                        winblend = 0,
                    }
                }
            },
        })

        vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, { desc = "FZF Live Grep" })
        vim.keymap.set("n", "<leader>ff", function()
            fzf_lua.files({
                fd_opts = string.gsub([[
                    --color=never --type f --hidden --follow
                    --exclude .git
                    --exclude target
                ]], "\n", ""),
                find_opts = string.gsub([[
                    -type f
                    -not -path '*/.git/*'
                    -not -path '*/target/*'
                ]], "\n", ""),
            })
        end, { desc = "FZF Files" })
    end)

    vim.plugin.install("stevearc/oil.nvim")(function()
        local oil = require("oil")

        oil.setup({
            view_options = {
                is_always_hidden = function(name, bufnr)
                    return 
                        name == ".git" or
                        name == "node_modules" or
                        name == "target"
                end,
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
    end)
end)
