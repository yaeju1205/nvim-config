if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --column"
    vim.opt.grepformat = "%f:%l:%c:%m"
end
