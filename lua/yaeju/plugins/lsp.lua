vim.plugin.namespace("yaeju-lsp", function()
    vim.lsp.servers = { "clangd", "lua_ls", "rust_analyzer", "qmlls", "luau_lsp" }

    vim.plugin.install("mason-org/mason.nvim")(function()
        require("mason").setup()
    end)

    vim.plugin.install("neovim/nvim-lspconfig")(function()
        vim.lsp.config("qmlls", {
            cmd = {
                "qmlls6",

                "-I", "/usr/lib/qt6/qml",
                "-I", vim.fn.getcwd(),
            },
            on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        })
        vim.lsp.enable(vim.lsp.servers)
    end)
end)
