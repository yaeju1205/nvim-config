vim.keymap.set("i", ",", ",<C-g>u", { silent = true })
vim.keymap.set("i", ".", ".<C-g>u", { silent = true })
vim.keymap.set("i", "!", "!<C-g>u", { silent = true })
vim.keymap.set("i", "?", "?<C-g>u", { silent = true })
vim.keymap.set("i", "<CR>", "<CR><C-g>u", { silent = true })
vim.keymap.set("i", "<space>", "<space><C-g>u", { silent = true })
vim.keymap.set("i", "<C-r>", "<C-g>u<C-r>", { silent = true })

vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { silent = true })
