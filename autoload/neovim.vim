function neovim#load()
    " Load Windows Config
    if has("win32") || has("win64")
        call windows#load()
    endif

    " Load Neovim Utils
    lua require("utils.async")

    " Load Neovim Plugins
    lua require("defines")
    lua require("packages")
    lua require("plugins")
endfunction
