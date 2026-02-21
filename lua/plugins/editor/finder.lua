if vim.fn.executable("rg") == 1 then
    vim.opt.grepprg = "rg --vimgrep --smart-case --column"
    vim.opt.grepformat = "%f:%l:%c:%m"
end

if vim.fn.executable("fzf") == 1 then
    packages.plugin.install("ibhagwan/fzf-lua")("fzf-lua").setup({
        winopts = {
            height = 0.85,
            width = 0.80,
        },
    })

    local has_grep = pcall(function()
        vim.fn.execute("grep")
    end)

    if has_grep then
        vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<CR>", { desc = "FZF Live Grep" })
    end
end
