syntax keyword luauKeyword
    \ local
    \ function
    \ if
    \ then
    \ else
    \ elseif
    \ while
    \ for
    \ in
    \ do
    \ repeat
    \ until
    \ end
    \ continue
    \ break
    \ return
    \ export
    \ type
    \ typeof

highlight link luauKeyword Keyword

syntax match luauAttribute /@\S*/

highlight link luauAttribute Type

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
    \ containedin=complexString
    \ contains=ALL
    \ keepend

highlight link complexString String
