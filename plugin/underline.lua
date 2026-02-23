vim.o.updatetime = 0
vim.wo.cursorline = true
vim.opt.cursorlineopt = "line,number"

vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true })

