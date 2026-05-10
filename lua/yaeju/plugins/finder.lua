vim.plugin.namespace("yaeju-finder", function()
    vim.plugin.install("ibhagwan/fzf-lua")(function()
        require("fzf-lua").setup({
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
            fzf_opts = {
                ["--color"] = ([[
                    fg:#B49FA3,
                    bg:-1,
                    hl:#B38B9B,
                    fg+:#D6C1C5,
                    bg+:#302D31,
                    hl+:#C58EA7,
                    pointer:#A381A3,
                    info:#665B66,
                    prompt:#B38B9B,
                    marker:#C07BC0
                ]]):gsub("\n", ""):gsub(" ", "")
            }
        })

        local fzf_lua = require("fzf-lua")

        vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, { desc = "FZF Live Grep" })
        vim.keymap.set("n", "<leader>ff", fzf_lua.files, { desc = "FZF Files" })
    end)
end)
