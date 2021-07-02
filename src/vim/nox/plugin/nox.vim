" General

set autoread
set number
set hidden
set inccommand=nosplit
set path+=**
set wildmenu
set wildoptions+=pum
set wildignore+=*.o,*.so,.DS_Store,*/.git/*,*/node_modules/*
set expandtab tabstop=3 shiftwidth=3

filetype plugin indent on

" Explorer

let g:netrw_banner=0
let g:netrw_fastbrowse=0

" Finder

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }

" Status Line

function! NoxStatusCurrentMode()
	return toupper(mode())
endfunction

function! NoxStatusCurrentBranch()
   let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

   if matchstr(l:branch, "\_s*") == l:branch
      return ""
   else
      return "➜" . l:branch
   endif
endfunction

function! NoxStatusBuffers()
   return join(map(copy(getbufinfo({'buflisted': 1})), "(v:val.bufnr == bufnr('%') ? '%3*' : '%4*') . fnamemodify(v:val.name, ':t') . '%4*'"), " ")
endfunction

set laststatus=2
set statusline=%1*\ %{fnamemodify(getcwd(),':t')}%{NoxStatusCurrentBranch()}\ %4* " directory➜branch
set statusline+=%2*\ %{NoxStatusCurrentMode()}\ %4* " mode
set statusline+=\ %{%NoxStatusBuffers()%} " buffers

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

function! NoxSeekClear(char)
	" Clear the seek search.
	let g:NoxSeekSearch = []

	return a:char
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
	let l:col = getline(".")[0:col(".")]
	if matchstr(l:col, "\\s*") == l:col
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

function! NoxFormat()
	" Format a file
	let w = winsaveview()
	normal! gggqG
	call winrestview(w)
endfunction

lua << EOF
local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true }
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

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
noremap <silent> <expr> f NoxSeekClear("f")
noremap <silent> <expr> F NoxSeekClear("F")
noremap <silent> <expr> t NoxSeekClear("t")
noremap <silent> <expr> T NoxSeekClear("T")

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

" Leader + w for writing files
nnoremap <Leader>w :w<CR>

" Leader + e for exploring files
nnoremap <Leader>e :Explore<CR>

" Leader + f for searching files
nnoremap <Leader>f :Files<CR>

" Leader + / for commenting lines
nnoremap <silent> <Leader>/ :call NoxComment()<CR>
xnoremap <silent> <Leader>/ :call NoxComment()<CR>

" Leader + p for formatting files
nnoremap <silent> <Leader>p :call NoxFormat()<CR><CR>

" jk for exiting insert and terminal mode
inoremap jk <Esc>
tnoremap jk <Esc>

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
augroup NoxRemoveTrailingWhitespace
	autocmd!
	autocmd BufWritePre * :%s/\s\+$//ge
augroup END

" Formatting programs
augroup NoxFormatProgram
	autocmd!
	autocmd FileType html setlocal formatprg=prettier\ --parser\ html\ --tab-width\ 3
	autocmd FileType css setlocal formatprg=prettier\ --parser\ css\ --tab-width\ 3
	autocmd FileType javascript,javascriptreact setlocal formatprg=prettier\ --parser\ babel\ --no-semi\ --tab-width\ 3
augroup END
