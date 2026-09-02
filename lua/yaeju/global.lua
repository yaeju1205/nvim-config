vim.g.mapleader = " "
vim.g.editorconfig = true

vim.g.cord_defer_startup = true

vim.g.icons_style = "glyph"
vim.g.border_style = "single"

vim.g.project_directory = vim.fn.expand("~/Projects")

if vim.env.TERMUX_VERSION then
    vim.g.icons_style = "ascii"
end

vim.g.find_ignore_files = {
    ".git",
    ".direnv",
    ".trash",
    ".zig-cache",
    "zig-out",
    "target",
    "node_modules",
}
