vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = true,
        severity = { min = vim.diagnostic.severity.WARN },
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "󰟃",
            [vim.diagnostic.severity.INFO]  = "",
        },
    },
})
