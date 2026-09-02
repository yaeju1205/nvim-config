return {
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                bindingModeHints = { enabled = true },
                closureCaptureHints = { enabled = true },
                closureReturnTypeHints = { enable = "always" },
                discriminantHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
                typeHints = { enable = true },
            },
        },
    },
}
