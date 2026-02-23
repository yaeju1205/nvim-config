vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.luau",
    callback = function(args)
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
            if client.name == "luau_lsp" then
                client.notify("workspace/didChangeConfiguration", {})
            end
        end
    end,
})
