vim.opt.encoding = "UTF-8"
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix"

vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.updatetime = 500

vim.opt.laststatus = 2

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.equalalways = false

vim.opt.iskeyword:remove("-")

vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    trail = '·',
}

vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.shadafile = "NONE"

vim.opt.signcolumn = "yes"

vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.timeoutlen = 500

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

vim.opt.clipboard = "unnamedplus"

vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })

vim.opt.grepprg = "rg --vimgrep --smart-case --column"
vim.opt.grepformat = "%f:%l:%c:%m"

