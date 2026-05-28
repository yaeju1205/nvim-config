vim.plugin.namespace("yaeju-search", function()
    vim.plugin.install("kevinhwang91/nvim-hlslens")(function()
        local hlslens = require("hlslens")
        hlslens.setup()

        local function hlslens_next_element()
            pcall(function()
                vim.cmd("normal! " .. vim.v.count1 .. "n")
            end)
            hlslens.start()
        end

        local function hlslens_prev_element()
            pcall(function()
                vim.cmd("normal! " .. vim.v.count1 .. "N")
            end)
            hlslens.start()
        end

        vim.keymap.set("n", "n", hlslens_next_element, { silent = true, noremap = true })
        vim.keymap.set("n", "N", hlslens_prev_element, { silent = true, noremap = true })
        vim.keymap.set("n", "*", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "#", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "g*", hlslens.start, { silent = true, noremap = true })
        vim.keymap.set("n", "g#", hlslens.start, { silent = true, noremap = true })
    end)

    vim.plugin.install("hedyhli/outline.nvim")(function()
        vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

        require("outline").setup()
    end)
end)
