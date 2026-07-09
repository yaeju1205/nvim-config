vim.g.mapleader = " "
vim.g.editorconfig = true

vim.g.cord_defer_startup = true

vim.g.icons_style = "glyph"

if vim.env.TERMUX_VERSION then
    vim.g.icons_style = "ascii"
end
