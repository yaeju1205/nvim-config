vim.plugin.namespace("yaeju-finder", function()
    local ignore_files = {
        ".git",
        ".zig-cache",
        "target",
        "node_modules",
    }

    local fd_ignore_opt = " "
    local find_ignore_opt = " "

    for _, file in pairs(ignore_files) do
        fd_ignore_opt = fd_ignore_opt .. "--exclude " .. file .. " "
        find_ignore_opt = find_ignore_opt .. "-not -path '*/" .. file .. "/*' "
    end

    vim.plugin.install("ibhagwan/fzf-lua")(function()
        local fzf_lua = require("fzf-lua")

        fzf_lua.setup({
            winopts = {
                backdrop = 70,
                border = "single",
                width = 0.7,
                height = 0.9,
                preview = {
                    border = "single",
                    delay = 5,
                    title_pos = "left",
                    layout = "vertical",
                    vertical = "down:30%",
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
            diagnostics = {
                multiline = true,
            }
        })

        vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, { desc = "FZF Live Grep" })
        vim.keymap.set("n", "<leader>ff", function()
            fzf_lua.files({
                fd_opts = string.gsub(
                    "--color=never --type f --hidden --follow"
                    .. fd_ignore_opt,
                    "\n",
                    ""
                ),
                find_opts = string.gsub(
                    "-type f" .. find_ignore_opt,
                    "\n",
                    ""
                ),
            })
        end, { desc = "FZF Files" })
        vim.keymap.set('n', '<leader>fb', fzf_lua.diagnostics_document, { desc = "Buffer Diagnostics" })
        vim.keymap.set('n', '<leader>fd', fzf_lua.diagnostics_workspace, { desc = "Workspace Diagnostics" })
    end)

    vim.plugin.install("stevearc/oil.nvim")(function()
        local oil = require("oil")

        oil.setup({
            view_options = {
                is_always_hidden = function(name)
                    for _, file in pairs(ignore_files) do
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
    end)
end)
