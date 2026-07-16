vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        require("cord").setup({
            display = {
                theme = "classic"
            },

            editor = {
                client = "vim",
                tooltip ="i love vscode and zed",
                icon = "https://cdn.picrew.me/shareImg/org/202606/2806659_EyV1GWtY.png"
            },

            text = {
                default = "nyang??",
                workspace = "nyaang..",
                editing = function(opts)
                    return string.format("nyang nyang in %s", opts.filename)
                end,
                file_browser = function(opts)
                    return string.format("nyangggg in %s", opts.tooltip)
                end
            },

            idle = {
                enabled = true,
                timeout = 300000,
                show_status = true,
                ignore_focus = true,
                unidle_on_focus = true,
                smart_idle = true,
                details = '자는중 골골골골..',
                state = nil,
                tooltip = '자는중',
                icon = "https://cdn.picrew.me/shareImg/org/202606/2806659_EyV1GWtY.png",
            },

            assets = {
                [".rs"] = {
                    tooltip = "i like this language",
                },
                [".hs"] = {
                    tooltip = "i like this language",
                },
            }
        })
    end)
end)
