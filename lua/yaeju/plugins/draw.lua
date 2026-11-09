vim.plugin.namespace("yaeju-draw", function()
    vim.plugin.install("jbyuki/venn.nvim")(function()
        vim.api.nvim_create_user_command("Venn", function()
            local venn_enabled = vim.b.venn_enabled
            if not venn_enabled then
                vim.b.venn_enabled = true

                vim.cmd("setlocal ve=all")

                vim.keymap.set("n", "<C-j>", "<C-v>j:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "<C-k>", "<C-v>k:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "<C-l>", "<C-v>l:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("n", "<C-h>", "<C-v>h:VBox<CR>", { noremap = true, silent = true })
                vim.keymap.set("v", "<C-F>", ":VBox<CR>", { noremap = true, silent = true })
            else
                vim.cmd("setlocal ve=")

                vim.keymap.del("n", "<C-j>")
                vim.keymap.del("n", "<C-k>")
                vim.keymap.del("n", "<C-l>")
                vim.keymap.del("n", "<C-h>")
                vim.keymap.del("v", "<C-F>")

                vim.b.venn_enabled = false
            end
        end, {})
    end)
end)

