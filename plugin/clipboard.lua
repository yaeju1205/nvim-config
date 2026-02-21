local osc52 = require("vim.ui.clipboard.osc52")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        osc52.copy("+")(vim.v.event.regcontents)
        osc52.copy("*")(vim.v.event.regcontents)
    end,
})
