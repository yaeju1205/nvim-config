function neovim#boot()
    " Load Neovim Utils
    lua require("utils.async")

    " Load Neovim Plugins
    lua require("defines")
    lua require("packages")
    lua require("plugins")
endfunction
