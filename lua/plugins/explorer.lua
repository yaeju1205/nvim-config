local nvim_tree = plugin.install("nvim-tree/nvim-tree.lua")("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")
local nvim_tree_view = require("nvim-tree.view")

nvim_tree.setup({
	auto_reload_on_write = true,
	renderer = {
		special_files = {},
		highlight_git = true,
		root_folder_label = ":~:s?$?",
		indent_markers = {
			enable = false,
		},
		icons = {
			webdev_colors = true,
			show = {
				git = false,
			},
		},
	},
	actions = {
		remove_file = {
			close_window = true,
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	git = {
		ignore = false,
	},
	filters = {
		custom = { "^\\.git$" },
	},
	log = {
		enable = false,
		truncate = false,
	},
	on_attach = function(bufnr)
		async(function()
			nvim_tree_api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "d", function()
				--- @type nvim_tree.api.Node
				local node = nvim_tree_api.tree.get_node_under_cursor()

				if not node or not node.absolute_path then
					return
				end

				local confirm = vim.fn.input("Remove " .. node.name .. "? y/N: ")

				if string.lower(confirm) ~= "y" then
					return
				end

				vim.fn.delete(node.absolute_path, "rf")

				local bufs = vim.fn.getbufinfo({ bufloaded = 1, buflisted = 1 })
				for _, buf in pairs(bufs) do
					if buf.name == node.absolute_path then
						vim.api.nvim_buf_delete(buf.bufnr, { force = true })
						for i = 1, #buf.windows do
							local win = buf.windows[i]
							if vim.api.nvim_win_is_valid(win) then
								vim.api.nvim_win_close(win, true)
							end
						end
						return
					end
				end

				nvim_tree_api.tree.reload()
			end, {
				desc = "nvim-tree: Delete",
				buffer = bufnr,
				noremap = true,
				silent = true,
				nowait = true,
			})

			vim.keymap.set("n", "<CR>", function()
				local node = nvim_tree_api.tree.get_node_under_cursor()

				if node or node.parent then
                    nvim_tree_api.node.open.edit()
				end

                nvim_tree_api.tree.toggle()
			end, {
				desc = "nvim-tree: Open",
				buffer = bufnr,
				noremap = true,
				silent = true,
				nowait = true,
			})
		end)
	end,
})

vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.toggle, {
	silent = true,
	desc = "Toggle nvim-tree",
})
