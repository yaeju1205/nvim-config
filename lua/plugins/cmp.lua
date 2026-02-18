local cmp = plugin.install("hrsh7th/nvim-cmp")("cmp")
plugin.install("hrsh7th/cmp-cmdline")("cmp_cmdline")
plugin.install("hrsh7th/cmp-path")("cmp_path")
plugin.install("hrsh7th/cmp-buffer")("cmp_buffer")
plugin.install("hrsh7th/cmp-nvim-lsp")("cmp_nvim_lsp")
plugin.install("folke/lazydev.nvim")("lazydev").setup({
	library = {
		{
			path = "${3rd}/luv/library",
			words = { "vim%.uv" },
		},
	},
})

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local tab_comp = false

cmp.setup({
	completion = {
		keyword_length = 1,
		completeopt = "menu,menuone,noselect,noinsert",
		autocomplete = { cmp.TriggerEvent.TextChanged },
	},
	preselect = cmp.PreselectMode.None,
	performance = {
		debounce = 0,
		throttle = 0,
		fetching_timeout = 100,
		filtering_context_budget = 3,
		confirm_resolve_timeout = 80,
		async_budget = 1,
		max_view_entries = 50,
	},
	mapping = cmp.mapping.preset.insert({
		["<Down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				tab_comp = true
			else
				fallback()
				tab_comp = false
			end
		end, { "i", "s" }),
		["<Up>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				tab_comp = true
			else
				fallback()
				tab_comp = false
			end
		end, { "i", "s" }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				if tab_comp and cmp.get_selected_entry() then
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>u", true, true, true), "n", false)
					cmp.confirm({ select = false })
					tab_comp = false
				else
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				end
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			end
		end,
		["<CR>"] = function(fallback)
			if cmp.get_selected_entry() then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-g>u", true, true, true), "n", false)
				cmp.confirm({ select = false })
				tab_comp = false
			else
				fallback()
			end
		end,
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.close(),
	}),
	window = {
		completion = cmp.config.window.bordered({
			border = "none",
		}),
		documentation = cmp.config.window.bordered({
			border = "none",
		}),
	},
	view = {
		entries = "custom",
	},
	formatting = {
		fields = { "abbr", "kind" },
		format = function(_, item)
			item.kind = icons[item.kind] or ""
			return item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 2 },
		{ name = "lazydev", group_index = 0 },
	},
	sorting = {
		priority_weight = 1000,
		comparators = {
			cmp.config.compare.score,
			cmp.config.compare.exact,
			cmp.config.compare.offset,
			cmp.config.compare.sort_text,
			cmp.config.compare.kind,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

cmp.setup.filetype("luau", {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 2 },
	},
})
