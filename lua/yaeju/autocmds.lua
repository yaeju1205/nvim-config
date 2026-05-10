vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })

        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({count = -1, float = true})
        end)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({count = 1, float = true})
        end)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true })
    end,
})
