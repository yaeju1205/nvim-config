local diagnostic = vim.diagnostic
local api = vim.api

diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	severity = { min = diagnostic.severity.WARN },
	update_in_insert = true,
	signs = {
		text = {
			[diagnostic.severity.ERROR] = "E",
			[diagnostic.severity.WARN] = "W",
			[diagnostic.severity.INFO] = "I",
			[diagnostic.severity.HINT] = "H",
		},
	},
	float = {
		source = true,
		header = "Diagnostics:",
		prefix = " ",
		border = "single",
		max_height = 10,
		max_width = 130,
		close_events = { "CursorMoved", "BufLeave", "WinLeave" },
	},
})

api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
        pcall(function()
            if #vim.diagnostic.get(0) == 0 then
                return
            end

            if not vim.b.diagnostics_pos then
                vim.b.diagnostics_pos = { nil, nil }
            end

            local cursor_pos = api.nvim_win_get_cursor(0)

            if not vim.deep_equal(cursor_pos, vim.b.diagnostics_pos) then
                diagnostic.open_float(nil, {
                    border = "none",
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    scope = "cursor",
                })
            end

            vim.b.diagnostics_pos = cursor_pos
        end)
	end,
})

api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	callback = function()
		async(vim.diagnostic.show)
	end,
})

local function get_lsp_clients(opts)
	if vim.lsp.get_clients then
		return vim.lsp.get_clients(opts)
	else
		--- @diagnostic disable-next-line
		return vim.lsp.get_active_clients(opts)
	end
end

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function(args)
		local uri = vim.uri_from_fname(args.file)

        async(function()
            for _, client in ipairs(get_lsp_clients({ bufnr = args.buf })) do
                ---@diagnostic disable-next-line
                client.notify("workspace/didChangeWatchedFiles", {
                    changes = {
                        {
                            uri = uri,
                            type = 2,
                        },
                    },
                })
            end
        end)
	end,
})
