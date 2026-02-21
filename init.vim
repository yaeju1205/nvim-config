" File Format
set encoding=UTF-8
set fileformat=unix
set fileformats=unix

" Mouse Support
set mouse=a

" 24Bit Terminal Colors
set termguicolors

" CursorLine Support
set nowrap
set cursorline
set scrolloff=10

" Internal UpdateTime
set updatetime=500

" Always active StatusLine
set laststatus=2

" Search Support
set incsearch
set ignorecase
set smartcase
set showmatch

" Tab Support
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" Support NumberLine 
set number
set relativenumber
set noequalalways

" Set word point
set iskeyword-=- 

" Set whitespace chars
set list
set listchars=tab:│\ ,space:\ ,trail:\ 

" Disable Swapfile
set noswapfile
set hidden
set shadafile=NONE

" Enable signcolumn
set signcolumn=yes

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set default clipboard (ssh clipboard ref plugin/clipboard.lua)
set clipboard=unnamed,unnamedplus

set shortmess+=c
set shortmess+=I

" Remember undo point
set undofile
execute 'set undodir=' .. luaeval("vim.fn.stdpath('state') .. '/undo'")

" Set ignore files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Set leader key (default: space)
let g:mapleader=' '

" Mappings
nnoremap <silent> <A-Right> :wincmd l<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-l> :wincmd l<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-j> :wincmd j<CR>

nnoremap <silent> <A-<> <C-w><
nnoremap <silent> <A->> <C-w>>

nnoremap <silent> <C-Right> w
nnoremap <silent> <C-Left> b
nnoremap <silent> <S-Up> <C-u>
nnoremap <silent> <S-Down> <C-d>

inoremap <silent> , ,<C-g>u
inoremap <silent> . .<C-g>u
inoremap <silent> ! !<C-g>u
inoremap <silent> ? ?<C-g>u
inoremap <silent> <CR> <CR><C-g>u
inoremap <silent> <space> <space><C-g>u
inoremap <silent> <C-r> <C-g>u<C-r>

imap <silent><expr> <C-l> copilot#Accept()
imap <silent><expr> <NL> copilot#Accept()

vnoremap <silent> < <gv
vnoremap <silent> > >gv

tnoremap <silent> <ESC> <C-\><C-n>

" Boot native modules
call native#boot()

" Require Spped Upgrade
lua async(vim.loader.enable)

" Load Configs
if exists("g:vscode")
    " Load Vscode Neovim Config
    call vscode#load()
else
    if exists("g:neovide")
        " Load Neovide Config
        call neovide#load()
    endif

    "Load Neovim Config
    call neovim#load()
endif

" Colors 
colorscheme mellifluous

highlight! link NvimTreeRootFolder NvimTreeHighlights
