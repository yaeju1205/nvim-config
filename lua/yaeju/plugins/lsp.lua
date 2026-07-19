vim.plugin.namespace("yaeju-lsp", function()
    vim.lsp.servers = {
        "clangd",
        "lua_ls",
        "rust_analyzer",
        "tsgo",
        "eslint",
        "luau_lsp",
        "gopls",
        "perlnavigator",
        "qmlls",
        "zls"
    }

    vim.plugin.install("mason-org/mason.nvim")(function()
        require("mason").setup()
    end)

    vim.plugin.install("neovim/nvim-lspconfig")(function()
        vim.lsp.enable(vim.lsp.servers)
    end)
end)
