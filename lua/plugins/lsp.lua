-- TreeSitter
plugin.install("nvim-treesitter/nvim-treesitter")("nvim-treesitter").setup()

-- Syntax
plugin.install("kimpure/blink-syntax.vim")
plugin.install("kimpure/luau-syntax.vim")

-- Lsp
local vscode_settings = plugin.install("kimpure/vscode-settings.nvim")("vscode-settings")
plugin.install("lopi-py/luau-lsp.nvim")("luau-lsp").setup(vim.tbl_deep_extend("force", {
        platform = {
            type = "roblox",
        },
        types = {
            roblox_security_level = "PluginSecurity",
        },
        completion = {
            imports = {
                enabled = true,
            },
        },
        sourcemap = {
            enabled = true,
            autogenerate = true,
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json",
        },
}, vscode_settings.get_settings()["luau-lsp"] or {}))

plugin.install("neovim/nvim-lspconfig")
plugin.install("mason-org/mason.nvim")("mason").setup()

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			completion = {
				dynamicRegistration = false,
				completionItem = {
					snippetSupport = true,
					commitCharactersSupport = true,
					deprecatedSupport = true,
					preselectSupport = true,
					tagSupport = {
						valueSet = {
							1,
						},
					},
					insertReplaceSupport = true,
					resolveSupport = {
						properties = {
							"documentation",
							"additionalTextEdits",
							"insertTextFormat",
							"insertTextMode",
							"command",
						},
					},
					insertTextModeSupport = {
						valueSet = {
							1,
							2,
						},
					},
					labelDetailsSupport = true,
				},
				contextSupport = true,
				insertTextMode = 1,
				completionList = {
					itemDefaults = {
						"commitCharacters",
						"editRange",
						"insertTextFormat",
						"insertTextMode",
						"data",
					},
				},
			},
		},
	},
	flags = {
		debounce_text_changes = 200,
	},
})

vim.lsp.enable(vim.lsp.servers)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

        if client.server_capabilities.semanticTokensProvider then
            async(function()
                vim.lsp.semantic_tokens.start(args.buf, client.id)
            end)
        end

        if client.server_capabilities.documentHighlightProvider then
            async(function()
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end)
        end
	end,
})

