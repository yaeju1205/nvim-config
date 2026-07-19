vim.plugin.namespace("yaeju-theme", function()
    vim.plugin.namespace("yaeju-theme-sakura", function()
        vim.plugin.install("anAcc22/sakura.nvim", {
            requires = {
                { origin = "rktjmp/lush.nvim" },
                { origin = "ibhagwan/fzf-lua" },
            }
        })(function()
            vim.cmd.colorscheme("sakura")

            require("fzf-lua").setup({
                fzf_opts = {
                    ["--color"] = ([[
                        fg:#B49FA3,
                        bg:-1,
                        hl:#B38B9B,
                        fg+:#D6C1C5,
                        bg+:#302D31,
                        hl+:#C58EA7,
                        pointer:#A381A3,
                        info:#665B66,
                        prompt:#B38B9B,
                        marker:#C07BC0
                    ]]):gsub("\n", ""):gsub(" ", "")
                }
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
