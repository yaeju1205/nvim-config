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
            -- Use Clippy for diagnostics on save instead of cargo check
            checkOnSave =  true,
            procMacro = {
                enable = true,           -- Enable support for procedural macros
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
