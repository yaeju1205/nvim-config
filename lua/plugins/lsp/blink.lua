-- Blink
plugin
    .install("saghen/blink.cmp", {
        version = "v1.9.1",
    })("blink.cmp")
    .setup({
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
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
        },

        signature = {
            enabled = true,
        },
    })
