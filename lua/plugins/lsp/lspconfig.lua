-- Define Lsp Servers
vim.lsp.servers = {
    "lua_ls",
    "hls",
}

-- LspConfig
plugin.install("neovim/nvim-lspconfig")

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})
vim.lsp.enable(vim.lsp.servers)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        async(function()
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            if not client then
                return
            end

            if client.server_capabilities.semanticTokensProvider then
                vim.lsp.semantic_tokens.start(args.buf, client.id)
            end

            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end)
    end,
})
