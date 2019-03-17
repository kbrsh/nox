" General

set autoread
set number
set inccommand=nosplit
set wildmenu
set noexpandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3

filetype plugin indent off

" Status Line

function! NoxStatusCurrentMode()
	return toupper(mode())
endfunction

function! NoxStatusCurrentBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

set laststatus=2
set statusline=%1*\ user " Name
set statusline+=\ %2*\ %{NoxStatusCurrentMode()} " Mode
set statusline+=\ %3*\ %t " File
set statusline+=%=
set statusline+=%3*\ %y " File type
set statusline+=\ %2*\ %{NoxStatusCurrentBranch()} " Branch
set statusline+=\ %1*\ %l:%L\ " Position

hi User1 guifg=#33444d guibg=#7594a3
hi User2 guifg=#33444d guibg=#5c7a8a
hi User3 guifg=#7594a3 guibg=#33444d

" Key Maps

imap jk <Esc>
nnoremap <CR> :noh<CR>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
autocmd BufWritePre * :%s/\s\+$//ge
