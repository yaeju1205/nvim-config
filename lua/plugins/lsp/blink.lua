-- Blink
-- stylua: ignore
plugin.install("saghen/blink.cmp", {
    version = "v1.9.1",
})("blink.cmp").setup({
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
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
        },
        list = {
            selection = {
                preselect = false,
            },
        },
    },

    cmdline = {
        enabled = true,
        keymap = {
            preset = "cmdline",
        },
        completion = {
            list = {
                selection = {
                    preselect = false
                }
            },
            menu = {
                auto_show = true,
            },
            ghost_text = {
                enabled = true
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
        default = { "lsp" }
    }
})
