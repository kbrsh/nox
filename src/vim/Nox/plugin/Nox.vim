" General

set autoread
set number
set hidden
set inccommand=nosplit
set path+=**
set wildmenu
set wildoptions+=pum
set wildignore+=*.o,*.so,.DS_Store,*/.git/*,*/node_modules/*
set noexpandtab tabstop=3 softtabstop=3 shiftwidth=3

let g:netrw_banner=0

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

hi User1 guifg=#19272f guibg=#718894
hi User2 guifg=#19272f guibg=#335261
hi User3 guifg=#718894 guibg=#19272f

" Key Maps

let mapleader = "\<Space>"
let g:NoxSeekSearch = []

function! NoxEnter()
	" Clear search if there is a term, or else move forward a paragraph.
	if getreg("/") != ""
		let @/ = ""
		return ":noh\<CR>"
	else
		return "}"
	endif
endfunction

function! NoxSeek(...)
	" Seek forwards.
	if a:0 == 0
		let l:char1 = nr2char(getchar())
		let l:char2 = nr2char(getchar())
	else
		let l:char1 = a:1
		let l:char2 = a:2
	endif

	let l:col = col(".")
	let l:seek = stridx(getline(".")[l:col:], l:char1 . l:char2)

	if a:0 == 0
		let g:NoxSeekSearch = [function("NoxSeek"), function("NoxSeekBack"), l:char1, l:char2]
	endif

	if l:seek != -1
		let l:seek = l:col + l:seek

		if l:seek == 0
			normal! 0
		else
			execute "normal! 0" . l:seek . "l"
		endif
	endif
endfunction

function! NoxSeekBack(...)
	" Seek backwards.
	if a:0 == 0
		let l:char1 = nr2char(getchar())
		let l:char2 = nr2char(getchar())
	else
		let l:char1 = a:1
		let l:char2 = a:2
	endif

	let l:col = col(".") - 2

	if l:col != -1
		let l:seek = strridx(getline(".")[:l:col], l:char1 . l:char2)

		if a:0 == 0
			let g:NoxSeekSearch = [function("NoxSeekBack"), function("NoxSeek"), l:char1, l:char2]
		endif

		if l:seek == 0
			normal! 0
		elseif l:seek != -1
			execute "normal! 0" . l:seek . "l"
		endif
	endif
endfunction

function! NoxSeekNext()
	" If there is a seek search, execute it. Otherwise go to the next search.
	if empty(g:NoxSeekSearch)
		normal! ;
	else
		call g:NoxSeekSearch[0](g:NoxSeekSearch[2], g:NoxSeekSearch[3])
	endif
endfunction

function! NoxSeekPrevious()
	" If there is a seek search, execute it backwards. Otherwise go to the next
	" search.
	if empty(g:NoxSeekSearch)
		normal! ,
	else
		call g:NoxSeekSearch[1](g:NoxSeekSearch[2], g:NoxSeekSearch[3])
	endif
endfunction

function! NoxSeekClear()
	" Clear the seek search.
	let g:NoxSeekSearch = []
endfunction

function! NoxSkip(char)
	" Skip a character if it is already the next one.
	if getline(".")[col(".") - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

function! NoxTab()
	" Tab for indentation if at the beginning of a line, or else provide
	" auto-completion.
	let l:col = col(".") - 2
	if l:col == -1 || getline(".")[l:col] == "\t"
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction

function! NoxComment()
	" Comment out lines.
	let l:line = getline(".")
	let l:content = substitute(l:line, "^\\s*", "", "")
	let l:indent = matchstr(l:line, "^\\s*")
	let l:commentstring = substitute(&commentstring, "%s", " %s", "")
	let l:match = matchlist(l:content, substitute(escape(l:commentstring, ".*"), "%s", "\\\\(.*\\\\)", ""))

	if empty(l:match)
		call setline(".", l:indent . printf(l:commentstring, l:content))
	else
		call setline(".", l:indent . l:match[1])
	endif
endfunction

" H and L for moving to the start or end of a line
noremap ^ H
noremap $ L
noremap H ^
noremap L $

" s and S to seek forwards and backwards in a line
noremap <silent> s :call NoxSeek()<CR>
noremap <silent> S :call NoxSeekBack()<CR>
noremap <silent> ; :call NoxSeekNext()<CR>
noremap <silent> , :call NoxSeekPrevious()<CR>
noremap <silent> f :call NoxSeekClear()<CR>f
noremap <silent> F :call NoxSeekClear()<CR>F
noremap <silent> t :call NoxSeekClear()<CR>t
noremap <silent> T :call NoxSeekClear()<CR>T

" Enter for moving forward a paragraph or clearing search
" Backspace for moving back a paragraph
nnoremap <silent> <expr> <CR> NoxEnter()
nnoremap <BS> {
xnoremap <CR> }
xnoremap <BS> {
snoremap <CR> }
snoremap <BS> {
onoremap <CR> }
onoremap <BS> {

" Y for yanking to end of line
noremap Y y$

" Tab for buffer switching
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Leader + b for listing and switching buffers
nnoremap <Leader>b :buffers<CR>:b<Space>

" Leader + e for exploring files
nnoremap <Leader>e :Explore<CR>

" Leader + f for searching files
nnoremap <Leader>f :find<Space>

" Leader + / for commenting lines
nnoremap <silent> <Leader>/ :call NoxComment()<CR>
xnoremap <silent> <Leader>/ :call NoxComment()<CR>

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
