function! plugins#load()
    if has('nvim')
        lua require("plugins")
    endif
endfunction
