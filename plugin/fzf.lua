if vim.fn.executable("fzf") == 1 then
    packages.plugin.install("ibhagwan/fzf-lua")("fzf-lua").setup({
        winopts = {
            height = 0.85,
            width = 0.80,
        },
    })

    vim.keymap.set(
        "n", 
        "<leader>f", 
        "<cmd>FzfLua live_grep<CR>", 
        { desc = "FZF Live Grep" }
    )
end

