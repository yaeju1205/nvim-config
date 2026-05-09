vim.plugin.namespace("yaeju-diagnostic", function()
    vim.plugin.install("rachartier/tiny-inline-diagnostic.nvim")(function()
        require("tiny-inline-diagnostic").setup({
            preset = "simple",
            options = {
                multilines = {
                    use_icons_from_diagnostic = true,
                    enabled = true,
                },
                severity = {
                    vim.diagnostic.severity.ERROR,
                    vim.diagnostic.severity.WARN,
                },
            },
        })
    end)
end)
