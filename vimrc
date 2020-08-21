" Thirumalesh vim config

set nocompatible                                " be iMproved, required
filetype off                                    " required

set encoding=utf-8

" avoid rtags Error detected while processing function rtags#InitPython:
" DeprecationWarning: the imp module is deprecated in favour of importlib; 
" see the module's documentation for alternative uses
if has('python3')
        silent! python3 1
endif


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

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'ycm-core/YouCompleteMe'
" Plug 'tmhedberg/SimplyFold'

" Initialize plugin system
call plug#end()


colorscheme gruvbox
set background=dark

let loaded_matchparen = 1
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

" split windows
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" Indentation
"
" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" C/C++
au BufNewFile,BufRead *.c,*h,*cpp
    \ set tabstop=8
    \ set softtabstop=8
    \ set shiftwidth=8
    \ set textwidth=80
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" syntastic prefered settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

