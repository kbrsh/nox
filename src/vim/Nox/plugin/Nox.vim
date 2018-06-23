" General

set autoread " Auto-reload changed files
set number " Line numbers

" Status Line

let g:NoxModeName = {'n': 'NOR', 'v': 'VIS', 'i': 'INS', 'c': 'COM'}

function! NoxStatusCurrentMode() abort
    let l:NoxCurrentMode = mode()
    return get(g:NoxModeName, l:NoxCurrentMode, 'O')
endfunction

set laststatus=2
set statusline=%1*user
set statusline+=\ %{strftime('%H:%M\ %m/%d/%y')}
set statusline+=\ %{NoxStatusCurrentMode()}
set statusline+=%2*\ \ \ \ \ %t\ @\ %f
set statusline+=%=
set statusline+=%1*%y
set statusline+=\ %l:%L

hi User1 guifg=#33444d guibg=#7594a3
hi User2 guifg=#7594a3 guibg=#33444d

" Key Maps

imap jk <Esc>
