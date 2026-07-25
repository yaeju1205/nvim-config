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
                show_all_diags_on_cursor = false,
                show_diags_only_under_cursor = false,
            },
        })
    end)
end)
