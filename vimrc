" Thirumalesh vim config

set nocompatible                                " be iMproved, required
filetype off                                    " required

set clipboard=unnamed
let mapleader=" "

" Mapping to reload configuration
map <leader>so :source $HOME\_vimrc<CR>

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
    " set python3 path for bvim
    set pythonthreehome=C:\Python38-32\
    set pythonthreedll=C:\Python38-32\python38.dll
    " disable menubar, toolbar and scrollbar
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
  endif
endif

set ignorecase


syntax on

set noerrorbells

set tabstop=8 softtabstop=8
set shiftwidth=8
set expandtab
set smartindent

set number
set relativenumber

set smartcase
set noswapfile
set nobackup
set undodir=$HOME\.vim\undodir
set undofile

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

