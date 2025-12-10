local api = require("nvim-tree.api")
local nvim_tree = require("nvim-tree")
local trash_file = require("trash").setup().trash_file

--- @param bufnr integer
local function on_attach(bufnr)
    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    local function open_node(...)
        local node = api.tree.get_node_under_cursor()

        --// Blocked root_folder_label
        if not node or not node.parent then
            return
        end

        api.node.open.edit(...)
    end

    local function root_to_node(...)
        local node = api.tree.get_node_under_cursor()

        --// Blocked root_folder_label
        if not node or not node.parent then
            return
        end

        api.tree.change_root_to_node(...)
    end

    local function remove()
        if vim.g.is_windows then
            local node = api.tree.get_node_under_cursor()
            local lower = string.lower

            if not node or not node.absolute_path then
                return
            end

            if nvim_tree.config.ui.confirm.default_yes then
                local confirm = vim.fn.input("Remove " .. node.name .. "? Y/n: ")

                if confirm ~= "" and lower(confirm) ~= "y" then
                    return
                end

                utils.fs.remove(node.absolute_path, true)

                api.tree.reload()
            else
                local confirm = vim.fn.input("Remove " .. node.name .. "? y/N: ")

                if lower(confirm) ~= "y" then
                    return
                end

                utils.fs.remove(node.absolute_path, true)

                api.tree.reload()
            end
        else
            api.fs.remove()
        end
    end

    local function trash()
        local node = api.tree.get_node_under_cursor()
        local lower = string.lower

        if not node or not node.absolute_path then
            return
        end

        if nvim_tree.config.ui.confirm.default_yes then
            local confirm = vim.fn.input("Trash " .. node.name .. "? Y/n: ")

            if confirm ~= "" and lower(confirm) ~= "y" then
                return
            end

            trash_file(node.absolute_path)
            api.tree.reload()
        else
            local confirm = vim.fn.input("Trash " .. node.name .. "? y/N: ")

            if lower(confirm) ~= "y" then
                return
            end

            trash_file(node.absolute_path)
            api.tree.reload()
        end
    end

    local keymap_set = vim.keymap.set

    keymap_set("n", ".", root_to_node, opts("CD"))
    keymap_set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))

    -- vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
    -- vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
    -- vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
    -- vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
    -- vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
    -- vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
    -- vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
    -- vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    -- vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))

    keymap_set("n", "<CR>", open_node, opts("Open"))

    keymap_set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
    keymap_set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
    keymap_set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
    -- keymap_set("n", ".", api.node.run.cmd, opts("Run Command"))
    -- keymap_set("n", "-", api.tree.change_root_to_parent, opts("Up"))
    keymap_set("n", "a", api.fs.create, opts("Create File Or Directory"))
    keymap_set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
    keymap_set("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
    keymap_set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
    keymap_set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
    keymap_set("n", "c", api.fs.copy.node, opts("Copy"))
    keymap_set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
    keymap_set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
    keymap_set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
    keymap_set("n", "d", remove, opts("Delete"))
    keymap_set("n", "D", trash, opts("Trash"))
    keymap_set("n", "E", api.tree.expand_all, opts("Expand All"))
    keymap_set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
    keymap_set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
    keymap_set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
    keymap_set("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
    keymap_set("n", "f", api.live_filter.start, opts("Live Filter: Start"))
    keymap_set("n", "g?", api.tree.toggle_help, opts("Help"))
    keymap_set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    keymap_set("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
    keymap_set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
    keymap_set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
    keymap_set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
    keymap_set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
    keymap_set("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
    keymap_set("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
    keymap_set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
    keymap_set("n", "o", api.node.open.edit, opts("Open"))
    keymap_set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
    keymap_set("n", "p", api.fs.paste, opts("Paste"))
    keymap_set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
    -- keymap_set("n", "q", api.tree.close, opts("Close"))
    keymap_set("n", "r", api.fs.rename, opts("Rename"))
    keymap_set("n", "R", api.tree.reload, opts("Refresh"))
    keymap_set("n", "s", api.node.run.system, opts("Run System"))
    keymap_set("n", "S", api.tree.search_node, opts("Search"))
    keymap_set("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
    keymap_set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
    keymap_set("n", "W", api.tree.collapse_all, opts("Collapse All"))
    keymap_set("n", "x", api.fs.cut, opts("Cut"))
    keymap_set("n", "y", api.fs.copy.filename, opts("Copy Name"))
    keymap_set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
    keymap_set("n", "<2-LeftMouse>", open_node, opts("Open"))
    keymap_set("n", "<2-RightMouse>", root_to_node, opts("CD"))
end

nvim_tree.setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_netrw = true,
    hijack_cursor = false,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    update_cwd = true,
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
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
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = "",
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = { "^\\.git$" },
        exclude = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = false,
            global = false,
            restrict_above_cwd = false,
        },
        remove_file = {
            close_window = false,
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
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
    },

    -- Use this when NvimTree is too slow.
    -- filesystem_watchers = {
    --     enable = false,
    -- },

    on_attach = on_attach,
})

vim.keymap.set("n", "<space>e", api.tree.toggle, {
    silent = true,
    desc = "toggle nvim-tree",
})
