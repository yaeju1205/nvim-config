vim.o.updatetime = 0
vim.wo.cursorline = true
vim.opt.cursorlineopt = "line,number"

vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true })

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		pcall(vim.lsp.buf.document_highlight)
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		pcall(vim.lsp.buf.clear_references)
	end,
})
