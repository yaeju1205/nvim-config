local nvim_plugin_manager_path = vim.fn.expand(vim.fn.stdpath("data") .. "/nvim-plugins/lib")

if vim.fn.isdirectory(nvim_plugin_manager_path) == 0 then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/yaeju1205/nvim-plugin-manager",
        nvim_plugin_manager_path
    })

    if vim.v.shell_error ~= 0 then
        vim.notify("Faild to clone yaeju1205/nvim-plugin-manager:\n" .. out, vim.log.levels.ERROR)
    end
end

vim.opt.rtp:append(nvim_plugin_manager_path)

require("plugin-manager")

require("yaeju.plugins.cmp")
require("yaeju.plugins.lsp")
require("yaeju.plugins.tools")
require("yaeju.plugins.pairs")
require("yaeju.plugins.fold")
require("yaeju.plugins.signcolumn")
require("yaeju.plugins.finder")
require("yaeju.plugins.search")
require("yaeju.plugins.diagnostic")
require("yaeju.plugins.theme")
require("yaeju.plugins.discord")
