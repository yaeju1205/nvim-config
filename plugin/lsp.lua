local lsp_servers = {
	"clangd",
	"lua_ls",
	"rust_analyzer",
	"vimls",
	"luau_lsp",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
capabilities.workspace = {
    didChangeWatchedFiles = {
        dynamicRegistration = true,
    }
}

vim.lsp.config("*", {
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 200,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_buf_conf", { clear = true }),
	callback = function(event_context)
		local client = vim.lsp.get_client_by_id(event_context.data.client_id)

		if not client then
			return
		end

		local bufnr = event_context.buf

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition({
				on_list = function(options)
					local unique_defs = {}
					local def_loc_hash = {}

					for _, def_location in pairs(options.items) do
						local hash_key = def_location.filename .. def_location.lnum

						if not def_loc_hash[hash_key] then
							def_loc_hash[hash_key] = true
							table.insert(unique_defs, def_location)
						end
					end

					options.items = unique_defs

					vim.fn.setloclist(0, {}, " ", options)

					if #options.items > 1 then
						vim.cmd.lopen()
					else
						vim.cmd([[silent! lfirst]])
					end
				end,
			})
		end, {
			silent = true,
			buffer = bufnr,
			desc = "go to definition",
		})

		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "solid",
				max_height = 20,
				max_width = 130,
				close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
			})
		end, {
			silent = true,
			buffer = event_context.buf,
		})

		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
			silent = true,
			buffer = bufnr,
		})
	end,
	nested = true,
})

local function lsp_attach()
	for i = 1, #lsp_servers do
		local server_name = lsp_servers[i]

		vim.lsp.config(server_name, {
			capabilities = capabilities,
			flags = { debounce_text_changes = 300 },
		})

		vim.lsp.enable(server_name)
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		lsp_attach()
	end,
})
