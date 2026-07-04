vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })

        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({count = -1, float = true})
        end)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({count = 1, float = true})
        end)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {
        "*.rs",
        "*.go",
        "*.js", "*.ts", "*.jsx", "*.tsx",
    },
    callback = function()
        vim.lsp.buf.format({ async = false })
        vim.snippet.stop()
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.s", "*.S" },
    callback = function()
        vim.bo.filetype = "asm"
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "OilActionsPost",
    callback = function(args)
        local action = args.data.action
        if action and action.type == "delete" then
            local entry_path = action.entry.path or action.entry.name

            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                local buf_name = vim.api.nvim_buf_get_name(bufnr)
                if buf_name == entry_path then
                    vim.api.nvim_buf_delete(bufnr, { force = true })
                    break
                end
            end
        end
    end,
})
