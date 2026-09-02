return {
    settings = {
        ["rust-analyzer"] = {
            lru = {
                capacity = 2048,
            },

            lens = {
                enable = true,
            },

            cargo = {
                loadOutDirsFromCheck = true,
                runBuildScripts = true,

                allTargets = false,
            },

            checkOnSave = false,

            procMacro = {
                enable = true,
                ignored = {
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                },
            },

            inlayHints = {
                bindingModeHints = { enabled = true },
                closureCaptureHints = { enabled = true },
                closureReturnTypeHints = { enable = "always" },
                discriminantHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
                typeHints = { enable = true },
            },

            diagnostics = {
                enable = true,
            },
        },
    },
}
