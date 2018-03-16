" General

set autoindent " Auto-indent files
set smartindent " Smart-indent files
set autoread " Auto-reload changed files
set number " Line numbers
set ruler " Position
set wildmenu " Enable wild menu

" Plugins
let g:airline_theme='Nox'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'kbrsh/nox', {'rtp': 'src/vim/Nox/'} " Nox
Plug 'vim-airline/vim-airline' " Airline
Plug 'scrooloose/nerdtree' " Tree
call plug#end()

" Syntax

if has('termguicolors')
  set termguicolors
endif
syntax on
colorscheme Nox

" Key Maps

imap jk <Esc>
