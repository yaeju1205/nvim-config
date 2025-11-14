set encoding=UTF-8
set fileformat=unix
set fileformats=unix
set clipboard=unnamedplus
set mouse+=a
set termguicolors
set background=dark
set nowrap
set cursorline
set scrolloff=10
set updatetime=500
set laststatus=2

set incsearch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

set number
set relativenumber
set cmdheight=0
set noshowmatch
set noequalalways

set shadafile=NONE
set noswapfile

set signcolumn=yes
set background=dark

set list
set listchars=tab:│\ ,space:\ ,trail:\ 

if exists("g:neovide")
    set guifont=KawaiiMono
    set mouse=a
    set termguicolors
    set mousemodel=extend
    
    autocmd VimEnter * execute 'cd ' . fnameescape(stdpath('config'))
endif

if has("win32") || has("win64")
    set shell=C:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    set shellquote=
    set shellxquote=
endif
