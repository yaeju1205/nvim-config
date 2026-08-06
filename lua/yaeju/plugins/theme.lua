vim.plugin.namespace("yaeju-theme", function()
    vim.plugin.namespace("yaeju-theme-blossom", function()
        vim.plugin.install("yaeju1205/blossom.vim", {
            requires = {
                { origin = "ibhagwan/fzf-lua" },
            }
        })(function()
            vim.cmd.colorscheme("blossom")

            local function fg(group)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
                return ok and hl.fg and string.format("#%06x", hl.fg) or nil
            end

            local function bg(group)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
                return ok and hl.bg and string.format("#%06x", hl.bg) or nil
            end

            require("fzf-lua").setup({
                fzf_opts = {
                    ["--color"] = table.concat({
                        "fg:" .. (fg("Normal")),
                        "bg:-1",
                        "hl:" .. (fg("Keyword") or fg("Statement")),
                        "fg+:" .. (fg("Normal")),
                        "bg+:" .. (bg("Visual") or bg("CursorLine")),
                        "hl+:" .. (fg("Function") or fg("Keyword")),
                        "pointer:" .. (fg("Identifier")),
                        "info:" .. (fg("Comment")),
                        "prompt:" .. (fg("Keyword")),
                        "marker:" .. (fg("String")),
                    }, ",")
                },
            })
        end)

        vim.plugin.install("yaeju1205/transparent.nvim")(function()
            require("transparent").setup({
                groups = {
                    "Normal",
                    "Comment",
                },
            })
        end)
    end)

    vim.plugin.disable_namespace("yaeju-theme-koda")
    vim.plugin.namespace("yaeju-theme-koda", function()
        vim.plugin.install("oskarnurm/koda.nvim")(function()
            vim.cmd.colorscheme("koda")
        end)
    end)

    vim.plugin.disable_namespace("yaeju-theme-mellifluous")
    vim.plugin.namespace("yaeju-theme-mellifluous", function()
        vim.plugin.install("ramojus/mellifluous.nvim")(function()
            vim.cmd.colorscheme("mellifluous")
        end)
    end)

    vim.plugin.disable_namespace("yaeju-theme-kanagawa")
    vim.plugin.namespace("yaeju-theme-kanagawa", function()
        vim.plugin.install("rebelot/kanagawa.nvim")(function()
            vim.cmd.colorscheme("kanagawa-dragon")
        end)
    end)

    vim.plugin.disable_namespace("yaeju-theme-github")
    vim.plugin.namespace("yaeju-theme-github", function()
        vim.plugin.install("projekt0n/github-nvim-theme")(function()
            vim.cmd.colorscheme("github_dark_high_contrast")
        end)
    end)

    vim.plugin.disable_namespace("yaeju-theme-niri-desktop")
    vim.plugin.namespace("yaeju-theme-niri-desktop", function()
        vim.plugin.install("yukazakiri/inir.nvim")(function()
            vim.cmd.colorscheme("inir")
        end)
    end)
end)
