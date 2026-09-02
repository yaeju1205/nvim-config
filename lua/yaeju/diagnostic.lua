local diagnostic_text = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN]  = "",
    [vim.diagnostic.severity.HINT]  = "",
    [vim.diagnostic.severity.INFO]  = "",
}

if vim.g.icons_style == "ascii" then
    diagnostic_text = {
        [vim.diagnostic.severity.ERROR] = "E",
        [vim.diagnostic.severity.WARN]  = "W",
        [vim.diagnostic.severity.HINT]  = "H",
        [vim.diagnostic.severity.INFO]  = "I",
    }
end

vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = false,
    signs = {
        active = true,
        severity = { min = vim.diagnostic.severity.WARN },
        text = diagnostic_text,
    },
})

