vim.plugin.namespace("yaeju-statusline", function()
    vim.plugin.install("nvim-mini/mini.icons")(function()
        require("mini.icons").setup({
            style = "glyph"
        })

        local icons = require("mini.icons")

        local function highlight_string(hl, str)
            return "%#" .. hl .. "#" .. str .. "%*"
        end

        vim.statusline = {}
        vim.statusline.render = function()
            local file_name = vim.fn.expand("%:t")
            local file_icon, file_icon_hl = icons.get("file", file_name)

            local file_type = vim.bo.filetype
            if file_type == "" then
                file_type = "text"
            end

            local file_icon_text = highlight_string(file_icon_hl, file_icon or "")
            local file_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")

            local diag_count = vim.diagnostic.count()

            local branch = vim.b.gitsigns_status_dict
            local branch_text = ""
            if branch and branch.head and branch.head ~= "" then
                branch_text = " " .. branch.head
            end

            return table.concat({
                "  ",
                branch_text,
                "  ",
                file_icon_text .. " " .. file_path,
                "%m%r",
                "%=",
                highlight_string("DiagnosticError", "  " .. (diag_count[1] or 0)),
                "  ",
                highlight_string("DiagnosticWarn", "  " .. (diag_count[2] or 0)),
                "  ",
                "| " .. file_icon_text .. " " .. file_type .. " ",
                "| %p%% ",
                "| %l:%c",
                "  ",
            })
        end

        vim.opt.statusline = "%!v:lua.vim.statusline.render()"
    end)
end)
