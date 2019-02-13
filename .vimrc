" General
scriptencoding utf-8
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set completeopt=menu,menuone
set cursorline
set directory=~/.vim/swap " Avoids littering swap files everywhere
set hlsearch
set ignorecase " Case-insensitive search
set mouse=a
set nocompatible
set noincsearch
set ruler
set smartcase
set number
set paste

" Tab-related
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Highlight column 81
set colorcolumn=81


" Show tabs and trailing spaces
if $LANG =~ '\(UTF\|utf\)-\?8' || $LC_CTYPE =~ '\(UTF\|utf\)-\?8'
    set list listchars=tab:»\ ,trail:·
endif


" Folding
set foldmethod=syntax
set foldlevelstart=99


"COLOR:

" Syntax Highlighting
set background=dark
"set background=light

if &t_Co >= 17 || has("gui_running")
    "colorscheme jellybeans
    colorscheme PaperColor
endif

" Make misspellings a little less obnoxious
hi SpellBad ctermfg=red

" color macros
nnoremap bl :set background=light<cr>
nnoremap bd :set background=dark<cr>

" Learning vimscript
set nopaste " Need this to be able to use abbreviations
nnoremap <Tab> :tabn<Enter>
nnoremap <Tab>n :tabnew 
nnoremap vs :source $MYVIMRC<cr>
nnoremap wq :wq<cr>
nnoremap <c-u> b<esc>vU<esc>
noremap vm :tabnew $MYVIMRC<cr>
noremap qq :q<cr>
noremap ww :w<cr>
noremap go :! go run %<cr>

" folding
set foldmethod=marker
noremap ff za

nnoremap Q :q!<cr>
filetype on
execute pathogen#infect()
set guifont=*

syntax on

