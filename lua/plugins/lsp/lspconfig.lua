-- Define Lsp Servers
vim.lsp.servers = {
    "lua_ls",
    "ts_ls",
    "hls",
    "rust_analyzer"
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
                client.server_capabilities.semanticTokensProvider = nil
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

-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
