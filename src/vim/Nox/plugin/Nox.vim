" General

set autoread
set number
set inccommand=nosplit
set path+=**
set wildmenu
set noexpandtab tabstop=3 softtabstop=3 shiftwidth=3

filetype plugin indent on

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

hi User1 guifg=#293338 guibg=#7e94a0
hi User2 guifg=#293338 guibg=#52666f
hi User3 guifg=#7e94a0 guibg=#3d4b52

" Key Maps

function! NoxEnter()
	" Clear search if there is a term, or else move forward a paragraph
	if getreg("/") != ""
		let @/ = ""
		return ":noh\<CR>"
	else
		return "}"
	endif
endfunction

function! NoxSkip(char)
	" Skip a character if it is already the next one
	if getline(".")[col(".") - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

function! NoxTab()
	" Tab for indentation if at the beginning of a line, or else provide
	" auto-completion
	let l:col = col(".") - 2
	if l:col == -1 || getline(".")[l:col] == "\t"
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction

" Enter for moving forward a paragraph or clearing search
" Backspace for moving back a paragraph
nnoremap <silent> <expr> <CR> NoxEnter()
nnoremap <BS> {

" Tab for buffer switching
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Space for searching files
nnoremap <Space> :find<Space>

" Y for yanking to end of line
nnoremap Y y$

" jk for exiting insert mode
inoremap jk <Esc>

" Tab completion
inoremap <expr> <Tab> NoxTab()
inoremap <S-Tab> <C-P>

" Completion and skipping for grouping symbols
inoremap ( ()<Left>
inoremap <expr> ) NoxSkip(")")
inoremap [ []<Left>
inoremap <expr> ] NoxSkip("]")
inoremap { {}<Left>
inoremap <expr> } NoxSkip("}")
inoremap " ""<Left>
inoremap ' ''<Left>

" Remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//ge

" Override default spacing for specific languages
autocmd FileType python setlocal noexpandtab tabstop=3 softtabstop=3 shiftwidth=3
