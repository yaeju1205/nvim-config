if vim.g.vscode then
	return
end

require("plugins.core")
async(function()
	require("plugins.lsp")
end)
async(function()
	require("plugins.cmp")
end)
async(function()
	require("plugins.editor")
end)
async(function()
	require("plugins.explorer")
end)
async(function()
	require("plugins.finder")
end)
