vim.plugin.namespace("yaeju-cmp", function()
    vim.plugin.install("saghen/blink.cmp", {
        version = "v1.9.1",
        requires = {
            { origin = "saghen/blink.lib" },
        },
    })(function()
        local cmp = require("blink.cmp")

        local capabilities = cmp.get_lsp_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        cmp.setup({
            keymap = {
                preset = "none",
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = {
                    "select_next",
                    "accept",
                    "fallback",
                },
                ["<S-Tab>"] = {
                    "select_prev",
                    "fallback",
                },
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 300,
                },
                ghost_text = {
                    enabled = true,
                },
                menu = {
                    border = "none",
                    winblend = 0,
                    scrollbar = true,
                    draw = {
                        padding = 0,
                        gap = 1,
                        columns = {
                            { "kind_icon" },
                            { "label" }
                        }
                    }
                },
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
            appearance = {
                kind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
                nerd_font_variant = "mono",
            },
            signature = {
                enabled = true,
            },
            sources = {
                default = { "lsp" },
            },
        })
    end)
end)
