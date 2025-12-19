function! packages#load()
    if has('nvim')
        lua require("packages")
    endif
endfunction
