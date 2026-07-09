local diagnostic_text = vim.g.icons_style == "ascii" and
    {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.HINT]  = "",
        [vim.diagnostic.severity.INFO]  = "",
    }
or
    {
        [vim.diagnostic.severity.ERROR] = "E",
        [vim.diagnostic.severity.WARN]  = "W",
        [vim.diagnostic.severity.HINT]  = "H",
        [vim.diagnostic.severity.INFO]  = "I",
    }

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        active = true,
        severity = { min = vim.diagnostic.severity.WARN },
        text = diagnostic_text,
    },
})

