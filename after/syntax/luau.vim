syntax region complexString
    \ start=+`+
    \ end=+`+
    \ skip="\\`"
    \ contains=complex
    \ keepend

syntax region complex 
    \ start=+{+
    \ end=+}+
    \ contained
    \ contains=ALL

highlight link complexString String
