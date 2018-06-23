" General

set autoread " Auto-reload changed files
set number " Line numbers

" Status Line

function! NoxStatusCurrentMode() abort
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
