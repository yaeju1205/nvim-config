-- LuauLsp
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

-- Package Manager
plugin.install("mason-org/mason.nvim")("mason").setup()
