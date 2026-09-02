if not string.find(vim.fn.getcwd(), vim.g.project_directory) then
    vim.plugin.disable_namespace("yaeju-discord")
end
vim.plugin.namespace("yaeju-discord", function()
    vim.plugin.install("vyfor/cord.nvim")(function()
        require("cord").setup({
            display = {
                theme = "classic",
                swap_icons = true,
            },

            editor = {
                client = "vim",
                tooltip ="연구중..",
                icon = "https://majotabi.jp/assets/special/twitter/ic/majo-tw-ic_8.png"
            },

            idle = {
                enabled = true,
                timeout = 300000,
                show_status = true,
                ignore_focus = true,
                unidle_on_focus = true,
                smart_idle = true,
                details = '골골골골..',
                state = nil,
                tooltip = '자는중',
                icon = "https://majotabi.jp/assets/special/twitter/hd/majo-tw-hd_4.jpg",
            },

            extensions = {
                persistent_timer = {
                    scope = 'global',
                    save_interval = 30,
                }
            }
        })
    end)
end)
