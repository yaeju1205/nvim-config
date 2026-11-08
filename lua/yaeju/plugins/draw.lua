vim.plugin.namespace("yaeju-draw", function()
    vim.plugin.install("jbyuki/venn.nvim")(function()
        vim.api.nvim_create_user_command("Venn", function()
            local venn_enabled = vim.b.venn_enabled
            if not venn_enabled then
                vim.b.venn_enabled = true

                vim.cmd("setlocal ve=all")

                vim.keymap.set("n", "J", "<C-v>j:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "K", "<C-v>k:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "L", "<C-v>l:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "H", "<C-v>h:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("v", "f", ":VBox<CR>", { noremap = true, silent = true })
            else
                vim.cmd("setlocal ve=")

                vim.keymap.del("n", "J")
                vim.keymap.del("n", "K")
                vim.keymap.del("n", "L")
                vim.keymap.del("n", "H")
                vim.keymap.del("v", "f")

                vim.b.venn_enabled = false
            end
        end, {})
    end)
end)

