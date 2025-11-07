pack.add({
	{
		src = "github.com/folke/lazydev.nvim",
		boot = {
			"lazydev",
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},
	{ src = "github.com/onsails/lspkind.nvim" },
	{ src = "github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "github.com/hrsh7th/cmp-cmdline" },
	{ src = "github.com/hrsh7th/cmp-path" },
	{ src = "github.com/hrsh7th/cmp-buffer" },
	{ src = "github.com/hrsh7th/nvim-cmp" },

	{ src = "github.com/lopi-py/luau-lsp.nvim" },
	{ src = "github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "github.com/mason-org/mason.nvim" },
	{ src = "github.com/neovim/nvim-lspconfig" },

	{ src = "github.com/kimpure/trash.nvim" },
	{ src = "github.com/nvim-lua/plenary.nvim" },
	{ src = "github.com/nvim-tree/nvim-tree.lua" },

	{
		src = "github.com/hedyhli/outline.nvim",
		boot = {
			"outline",
		},
	},

	{
		src = "github.com/kimpure/cmdhistory.nvim",
		boot = {
			"cmdhistory",
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
		},
	},

	{
		src = "github.com/numToStr/FTerm.nvim",
		boot = {
			"FTerm",
			ft = "FTerm",
			cmd = vim.o.shell,
			border = "none",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
			auto_close = true,
		},
		keymaps = {
			["<C-\\>"] = {
				mode = { "n", "t" },
				cmd = '<CMD>lua require("FTerm").toggle()<CR>',
			},
		},
	},

	{
		src = "github.com/lewis6991/gitsigns.nvim",
		boot = {
			"gitsigns",
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
		},
	},

	{
		src = "github.com/lukas-reineke/indent-blankline.nvim",
		boot = { "ibl" },
	},

	{
		src = "github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		boot = { "nvim-autopairs" },
	},

	{ src = "github.com/samjwill/nvim-unception" },

	{
		src = "github.com/lewis6991/satellite.nvim",
		boot = {
			"satellite",
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
		},
	},

	{
		src = "github.com/vyfor/cord.nvim",
		boot = {
			"cord",
			boot = function()
				vim.cmd("Cord update")
			end,
		},
	},

	{
		src = "github.com/2KAbhishek/nerdy.nvim",
		boot = {
			"nerdy",
			max_recents = 30,
		},
	},
	{
		src = "github.com/DaikyXendo/nvim-material-icon",
		boot = {
			"nvim-web-devicons",
			override_by_filename = {
				[".luaurc"] = {
					icon = "",
					color = "#007ABF",
					name = "Luaurc",
				},
				["LICENCE"] = {
					icon = "󰄤",
					color = "#ec6237",
					cterm_color = "220",
					name = "LICENSE",
				},
				["LICENCE.md"] = {
					icon = "󰄤",
					color = "#ec6237",
					cterm_color = "220",
					name = "LICENSE",
				},
			},
		},
	},

	{
		src = "github.com/kimpure/transparent.nvim",
		boot = {
			"transparent",
		},
		disable = true,
	},
	{
		src = "github.com/kimpure/gitcolors.nvim",
		boot = {
			"gitcolors",
		},
	},
	{ src = "github.com/rktjmp/lush.nvim" },
	{
		src = "github.com/kimpure/sakura.nvim",
		boot = function()
			vim.cmd.colorscheme("sakura")
		end,
		disable = true,
	},
	{
		src = "github.com/navarasu/onedark.nvim",
		boot = function()
			require("onedark").setup({
				style = "dark",
			})

			vim.cmd("colorscheme onedark")
		end,
	},
})
