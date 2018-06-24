" General

let mapleader="\<Space>"
set autoread
set number 
set inccommand=nosplit 
set wildmenu
set tabstop=3
set softtabstop=3
set shiftwidth=3
set noexpandtab

" Status Line

function! NoxStatusCurrentMode()
    return toupper(mode())
endfunction

set laststatus=2
set statusline=%1*user
set statusline+=\ %{strftime('%H:%M\ %m/%d/%y')}
set statusline+=\ %{NoxStatusCurrentMode()}
set statusline+=%2*\ %t
set statusline+=%=
set statusline+=%1*%y
set statusline+=\ %l:%L

hi User1 guifg=#33444d guibg=#7594a3
hi User2 guifg=#7594a3 guibg=#33444d

" Key Maps

imap jk <Esc>
nnoremap <CR> :noh<CR>
