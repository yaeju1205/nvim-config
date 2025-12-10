local cmp = require("cmp")

require("cmp_nvim_lsp")
require("cmp_path")
require("cmp_buffer")
require("cmp_cmdline")

local lspkind = require("lspkind")

cmp.setup({
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
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm({ select = false })
            else
                fallback()
            end
        end,
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Esc>"] = cmp.mapping.close(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        {
            name = "buffer",
            keyword_length = 2,
        },
        {
            name = "lazydev",
            group_index = 0,
        },
    },
    completion = {
        keyword_length = 1,
        completeopt = "menu,menuone,noselect,noinsert",
    },
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
        format = lspkind.cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = {
                menu = 50, -- leading text (labelDetails)
                abbr = 50, -- actual suggestion item
            },
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            symbol_map = {
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
            },
        }),
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
})
