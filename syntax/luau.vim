" Vim syntax file
" Language:	Luau
" Maintainer:	None yet
" Last Change:	

if exists("b:current_syntax")
  finish
endif

syn match luauNumber "\<[0-9_]\+\>"
syn match luauNumber "\<[0-9_]\+\.[0-9_]*\%([eE][-+]\=[0-9_]\+\)\="
syn match luauNumber "\.[0-9_]\+\%([eE][-+]\=[0-9_]\+\)\=\>"
syn match luauNumber "\<[0-9_]\+[eE][-+]\=[0-9_]\+\>"

syn match luauNumber "\<0[xX][0-9a-fA-F_]\+\>"
syn match luauNumber "\<0[bB][01_]\+\>"

hi def link luauNumber Number

syn region luauString
  \ start=/"/
  \ end=/"/
  \ contains=luauEscape
  \ skip=/\\./

syn region luauString
  \ start=/'/
  \ end=/'/
  \ contains=luauEscape
  \ skip=/\\./

syn region luauLongString
  \ start=/\[\[\|\[\[==*\[/
  \ end=/\]\]\|]\]==*\]/

syn region luauComplexString
  \ start=/`/
  \ end=/`/
  \ skip=/\\`/
  \ contains=luauComplexStringInterior,luauComplexEscape,luauEscape
  \ keepend

syn region luauComplexStringInterior
  \ transparent
  \ start=+{+
  \ end=+}+
  \ contained
  \ containedin=luauComplexString
  \ contains=TOP

hi def link luauString String
hi def link luauLongString String
hi def link luauComplexString String

syn match luauEscape display contained /\\[abfnrtv'"\\]/
syn match luauEscape display contained /\\x[0-9a-fA-F][0-9a-fA-F]/
syn match luauEscape display contained /\\[0-9]\{1,3\}/
syn match luauEscape display contained /\\z[ \t\n]/
syn match luauComplexEscape display contained /\\`\|\\./

hi def link luauEscape SpecialChar
hi def link luauComplexEscape SpecialChar

syn keyword luauConstant true false nil

hi def link luauConstant Constant

syn region luauTableBlock
  \ transparent
  \ matchgroup=luauTable
  \ start="{"
  \ end="}"
  \ contains=TOP,luauStatement

hi def link luauTable Structure
hi def link luauStatement Statement

" support luau if expression
" use keyword (not region)

syn keyword luauKeyword 
  \ return
  \ break
  \ continue
  \ do
  \ end
  \ if
  \ then
  \ else
  \ elseif
  \ while
  \ for
  \ in
  \ repeat
  \ until
  \ local
  \ const
  \ function
  \ export
  \ type
  \ self
  \ and
  \ or
  \ not
  \ __add
  \ __call
  \ __concat
  \ __div
  \ __eq
  \ __index
  \ __le
  \ __len
  \ __lt
  \ __metatable
  \ __mod
  \ __mode
  \ __mul
  \ __newindex
  \ __pow
  \ __sub
  \ __tostring
  \ __unm

hi def link luauKeyword Keyword

syn match luauOperator "[<>=~^*/+-]\|\.\{2,3}"

hi def link luauOperator Operator

syn match luauAttribute /@\S*/

hi def link luauAttribute Type

syn match luauColon /:/

hi def link luauColon Identifier

syn match luauTypeCast /::/

syn match luauTypeOperator /?/
syn match luauTypeOperator /&/
syn match luauTypeoperator /|/

hi def link luauTypeOperator Operator
hi def link luauTypeCast Operator

syn region luauCommentCodeBlock
  \ transparent
  \ keepend
  \ start="```luau"
  \ end="```"
  \ contained
  \ containedin=luauComment
  \ contains=TOP
" LuauCodeBlock how to...

syn match luauComment "--.*$" contains=@Spell,luauAttribute
syn region luauComment
  \ matchgroup=luauCommentDelimiter
  \ start="--\[\z(=*\)\["
  \ end="\]\z1\]"
  \ contains=@Spell,luauAttribute,luauCommentCodeBlock

hi def link luauComment Comment
hi def link luauCommentDelimiter Comment

syn keyword luauStandardLibrary 
  \ assert
  \ collectgarbage
  \ error
  \ gcinfo
  \ getfenv
  \ getmetatable
  \ ipairs
  \ loadstring
  \ newproxy
  \ next
  \ pairs
  \ pcall
  \ print
  \ rawequal
  \ rawset
  \ require
  \ select
  \ setfenv
  \ setmetatable
  \ tonumber
  \ tostring
  \ type
  \ typeof
  \ unpack
  \ xpcall
  \ _G
  \ _VERSION

syn match luauStandardLibrary /\<bit32\.arshift\>/
syn match luauStandardLibrary /\<bit32\.band\>/
syn match luauStandardLibrary /\<bit32\.bnot\>/
syn match luauStandardLibrary /\<bit32\.bor\>/
syn match luauStandardLibrary /\<bit32\.btest\>/
syn match luauStandardLibrary /\<bit32\.bxor\>/
syn match luauStandardLibrary /\<bit32\.extract\>/
syn match luauStandardLibrary /\<bit32\.lrotate\>/
syn match luauStandardLibrary /\<bit32\.lshift\>/
syn match luauStandardLibrary /\<bit32\.replace\>/
syn match luauStandardLibrary /\<bit32\.rrotate\>/
syn match luauStandardLibrary /\<bit32\.rshift\>/
syn match luauStandardLibrary /\<bit32\.countlz\>/
syn match luauStandardLibrary /\<bit32\.countrz\>/
syn match luauStandardLibrary /\<bit32\.byteswap\>/

syn match luauStandardLibrary /\<coroutine\.create\>/
syn match luauStandardLibrary /\<coroutine\.isyieldable\>/
syn match luauStandardLibrary /\<coroutine\.resume\>/
syn match luauStandardLibrary /\<coroutine\.running\>/
syn match luauStandardLibrary /\<coroutine\.status\>/
syn match luauStandardLibrary /\<coroutine\.wrap\>/
syn match luauStandardLibrary /\<coroutine\.yield\>/
syn match luauStandardLibrary /\<coroutine\.close\>/

syn match luauStandardLibrary /\<debug\.info\>/
syn match luauStandardLibrary /\<debug\.loadmodule\>/
syn match luauStandardLibrary /\<debug\.profilebegin\>/
syn match luauStandardLibrary /\<debug\.profileend\>/
syn match luauStandardLibrary /\<debug\.traceback\>/

syn match luauStandardLibrary /\<math\.abs\>/
syn match luauStandardLibrary /\<math\.acos\>/
syn match luauStandardLibrary /\<math\.asin\>/
syn match luauStandardLibrary /\<math\.atan\>/
syn match luauStandardLibrary /\<math\.atan2\>/
syn match luauStandardLibrary /\<math\.ceil\>/
syn match luauStandardLibrary /\<math\.clamp\>/
syn match luauStandardLibrary /\<math\.cos\>/
syn match luauStandardLibrary /\<math\.cosh\>/
syn match luauStandardLibrary /\<math\.deg\>/
syn match luauStandardLibrary /\<math\.exp\>/
syn match luauStandardLibrary /\<math\.floor\>/
syn match luauStandardLibrary /\<math\.fmod\>/
syn match luauStandardLibrary /\<math\.frexp\>/
syn match luauStandardLibrary /\<math\.ldexp\>/
syn match luauStandardLibrary /\<math\.log\>/
syn match luauStandardLibrary /\<math\.log10\>/
syn match luauStandardLibrary /\<math\.max\>/
syn match luauStandardLibrary /\<math\.min\>/
syn match luauStandardLibrary /\<math\.modf\>/
syn match luauStandardLibrary /\<math\.noise\>/
syn match luauStandardLibrary /\<math\.pow\>/
syn match luauStandardLibrary /\<math\.rad\>/
syn match luauStandardLibrary /\<math\.random\>/
syn match luauStandardLibrary /\<math\.randomseed\>/
syn match luauStandardLibrary /\<math\.round\>/
syn match luauStandardLibrary /\<math\.sign\>/
syn match luauStandardLibrary /\<math\.sin\>/
syn match luauStandardLibrary /\<math\.sinh\>/
syn match luauStandardLibrary /\<math\.sqrt\>/
syn match luauStandardLibrary /\<math\.tan\>/
syn match luauStandardLibrary /\<math\.tanh\>/

syn match luauStandardLibrary /\<os\.clock\>/
syn match luauStandardLibrary /\<os\.date\>/
syn match luauStandardLibrary /\<os\.difftime\>/
syn match luauStandardLibrary /\<os\.time\>/

syn match luauStandardLibrary /\<string\.byte\>/
syn match luauStandardLibrary /\<string\.char\>/
syn match luauStandardLibrary /\<string\.find\>/
syn match luauStandardLibrary /\<string\.format\>/
syn match luauStandardLibrary /\<string\.gmatch\>/
syn match luauStandardLibrary /\<string\.gsub\>/
syn match luauStandardLibrary /\<string\.len\>/
syn match luauStandardLibrary /\<string\.lower\>/
syn match luauStandardLibrary /\<string\.match\>/
syn match luauStandardLibrary /\<string\.pack\>/
syn match luauStandardLibrary /\<string\.packsize\>/
syn match luauStandardLibrary /\<string\.rep\>/
syn match luauStandardLibrary /\<string\.reverse\>/
syn match luauStandardLibrary /\<string\.split\>/
syn match luauStandardLibrary /\<string\.sub\>/
syn match luauStandardLibrary /\<string\.unpack\>/
syn match luauStandardLibrary /\<string\.upper\>/

syn match luauStandardLibrary /\<table\.concat\>/
syn match luauStandardLibrary /\<table\.create\>/
syn match luauStandardLibrary /\<table\.find\>/
syn match luauStandardLibrary /\<table\.foreach\>/
syn match luauStandardLibrary /\<table\.foreachi\>/
syn match luauStandardLibrary /\<table\.getn\>/
syn match luauStandardLibrary /\<table\.insert\>/
syn match luauStandardLibrary /\<table\.maxn\>/
syn match luauStandardLibrary /\<table\.move\>/
syn match luauStandardLibrary /\<table\.pack\>/
syn match luauStandardLibrary /\<table\.remove\>/
syn match luauStandardLibrary /\<table\.sort\>/
syn match luauStandardLibrary /\<table\.unpack\>/
syn match luauStandardLibrary /\<table\.clear\>/
syn match luauStandardLibrary /\<table\.freeze\>/
syn match luauStandardLibrary /\<table\.isfrozen\>/
syn match luauStandardLibrary /\<table\.clone\>/

syn match luauStandardLibrary /\<task\.spawn\>/
syn match luauStandardLibrary /\<task\.synchronize\>/
syn match luauStandardLibrary /\<task\.desynchronize\>/
syn match luauStandardLibrary /\<task\.wait\>/
syn match luauStandardLibrary /\<task\.defer\>/
syn match luauStandardLibrary /\<task\.delay\>/

syn match luauStandardLibrary /\<utf8\.char\>/
syn match luauStandardLibrary /\<utf8\.codepoint\>/
syn match luauStandardLibrary /\<utf8\.codes\>/
syn match luauStandardLibrary /\<utf8\.graphemes\>/
syn match luauStandardLibrary /\<utf8\.len\>/
syn match luauStandardLibrary /\<utf8\.nfcnormalize\>/
syn match luauStandardLibrary /\<utf8\.nfdnormalize\>/
syn match luauStandardLibrary /\<utf8\.offset\>/

syn match luauStandardLibrary /\<buffer\.create\>/
syn match luauStandardLibrary /\<buffer\.fromstring\>/
syn match luauStandardLibrary /\<buffer\.tostring\>/
syn match luauStandardLibrary /\<buffer\.len\>/
syn match luauStandardLibrary /\<buffer\.readi8\>/
syn match luauStandardLibrary /\<buffer\.readu8\>/
syn match luauStandardLibrary /\<buffer\.readi16\>/
syn match luauStandardLibrary /\<buffer\.readu16\>/
syn match luauStandardLibrary /\<buffer\.readi32\>/
syn match luauStandardLibrary /\<buffer\.readu32\>/
syn match luauStandardLibrary /\<buffer\.readf32\>/
syn match luauStandardLibrary /\<buffer\.readf64\>/
syn match luauStandardLibrary /\<buffer\.writei8\>/
syn match luauStandardLibrary /\<buffer\.writeu8\>/
syn match luauStandardLibrary /\<buffer\.writei16\>/
syn match luauStandardLibrary /\<buffer\.writeu16\>/
syn match luauStandardLibrary /\<buffer\.writei32\>/
syn match luauStandardLibrary /\<buffer\.writeu32\>/
syn match luauStandardLibrary /\<buffer\.writef32\>/
syn match luauStandardLibrary /\<buffer\.writef64\>/
syn match luauStandardLibrary /\<buffer\.readstring\>/
syn match luauStandardLibrary /\<buffer\.writestring\>/
syn match luauStandardLibrary /\<buffer\.copy\>/
syn match luauStandardLibrary /\<buffer\.fill\>/

hi def link luauStandardLibrary Identifier

let b:current_syntax = "luau"

" vim: nowrap sw=2 sts=2 ts=8 noet:
