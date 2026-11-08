return {
    cmd = { "rust-analyzer" },
    root_markers = {
        "rust-project.json",
        ".git"
    },
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                bindingModeHints = { enabled = true },
                -- closureCaptureHints = { enabled = true },
                -- closureReturnTypeHints = { enable = "always" },
                -- discriminantHints = { enable = "always" },
                -- lifetimeElisionHints = { enable = "always" },
                typeHints = { enable = true },
            },

            cargo = {
                allTargets = false,
            },
            check = {
                allTargets = false,
                extraArgs = { "--target", "aarch64-unknown-none-softfloat" },
            },
        },
    },
}
