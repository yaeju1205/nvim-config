local notify = plugin.install("rcarriga/nvim-notify")("notify")
notify.setup({
    timeout = 0,
    stages = "fade",
    minimum_width = 30,
    top_down = false,
})
vim.notify = notify

-- Pairs
plugin.install("windwp/nvim-autopairs")("nvim-autopairs").setup()
plugin.install("kimpure/warp.nvim")("warp").setup()

-- Terminal
plugin.install("willothy/flatten.nvim")("flatten").setup()

-- Tabline
plugin.install("lukas-reineke/indent-blankline.nvim")("ibl").setup()

-- Scroll
plugin.install("lewis6991/satellite.nvim")("satellite").setup({
    current_only = false,
    winblend = 0,
    handlers = {
        marks = {
            enable = false,
        },
        gitsigns = {
            enable = true,
            signs = {
                add = "│",
                change = "│",
                delete = "│",
            },
        },
    },
})

-- Cmdline
plugin.install("kimpure/cmdhistory.nvim")("cmdhistory").setup({
    mute = {
        "q",
        "qa",
        "wq",
        "wqa",
        "wincmd h",
        "wincmd j",
        "wincmd k",
        "wincmd l",
        "w",
        "wa",
    },
})

-- Git
plugin.install("lewis6991/gitsigns.nvim")("gitsigns").setup({
    signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┆" },
    },
    signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┆" },
    },
})

-- Colorscheme
plugin.install("ramojus/mellifluous.nvim")("mellifluous").setup({
    style = "mountain",
    dim_inactive = true,
})
