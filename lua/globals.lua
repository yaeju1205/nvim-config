_G.source = require("module.source")
_G.utils = require("module.utils")
_G.pack = require("module.pack")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.is_windows = utils.has("win32") or utils.has("win64")
vim.g.is_linux = utils.has("unix") or utils.has("macunix")
vim.g.is_mac = utils.has("macunix")
