vim.plugin.namespace("yaeju-theme", function()
    -- vim.plugin.disable_namespace("yaeju-theme-sakura")
    vim.plugin.namespace("yaeju-theme-sakura", function()
        vim.plugin.install("anAcc22/sakura.nvim", {
            requires = {
                { origin = "rktjmp/lush.nvim" },
                { origin = "nvim-lualine/lualine.nvim" }
            }
        })(function()
            vim.cmd.colorscheme("sakura")

            require("lualine").setup({
                options = require("lualine.themes.sakura"),
                sections = {
                    lualine_c = {
                        { "filename", path = 3 }
                    }
                }
            })

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
end)
