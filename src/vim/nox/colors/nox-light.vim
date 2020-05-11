" Syntax

if has("termguicolors")
	set termguicolors
endif

hi clear
syntax reset
set background=dark

let g:colors_name="nox-light"

let s:black = {"gui": "#3a6478", "cterm": 16}
let s:gray = {"gui": "#6b838e", "cterm": 109}
let s:lightgray = {"gui": "#a5b4bb", "cterm": 109}
let s:white = {"gui": "#f9fafb", "cterm": 109}
let s:red = {"gui": "#9b4b4b", "cterm": 210}
let s:orange = {"gui": "#9b654b", "cterm": 180}
let s:yellow = {"gui": "#9b8e4b", "cterm": 186}
let s:green = {"gui": "#6d8363", "cterm": 150}
let s:cyan = {"gui": "#4b9b8e", "cterm": 116}
let s:blue = {"gui": "#4b809b", "cterm": 111}
let s:purple = {"gui": "#836383", "cterm": 176}

function! s:h(type, fg, bg, ...)
	let l:style = get(a:, 1, "none")
	exec "hi " . a:type . " cterm=" . l:style . " ctermbg=" . a:bg.cterm . " ctermfg=" . a:fg.cterm . " gui=" . l:style . " guibg=" . a:bg.gui . " guifg=" . a:fg.gui
endfunction

call s:h("User1", s:white, s:gray)
call s:h("User2", s:white, s:lightgray)
call s:h("User3", s:gray, s:white)

call s:h("Cursor", s:white, s:black)
call s:h("iCursor", s:black, s:white)
call s:h("CursorLine", s:white, s:lightgray)
call s:h("Directory", s:blue, s:white)
call s:h("IncSearch", s:white, s:yellow)
call s:h("LineNr", s:lightgray, s:white)
call s:h("NonText", s:lightgray, s:white)
call s:h("MatchParen", s:black, s:white, "underline")
call s:h("Pmenu", s:black, s:lightgray)
call s:h("PmenuSel", s:white, s:black)
call s:h("PmenuSbar", s:white, s:white)
call s:h("PmenuThumb", s:black, s:black)
call s:h("Substitute", s:white, s:yellow)
call s:h("Search", s:white, s:yellow)
call s:h("VertSplit", s:black, s:white)
call s:h("Visual", s:white, s:black)
call s:h("WildMenu", s:white, s:yellow)

call s:h("Normal", s:black, s:white)
call s:h("Identifier", s:black, s:white)
call s:h("Function", s:blue, s:white)

call s:h("Comment", s:lightgray, s:white)

call s:h("Constant", s:orange, s:white)
call s:h("String", s:green, s:white)
call s:h("Character", s:green, s:white)
call s:h("Number", s:orange, s:white)
call s:h("Boolean", s:orange, s:white)
call s:h("Float", s:orange, s:white)

call s:h("Statement", s:purple, s:white)
call s:h("Conditional", s:purple, s:white)
call s:h("Repeat", s:purple, s:white)
call s:h("Label", s:purple, s:white)
call s:h("Operator", s:black, s:white)
call s:h("Keyword", s:purple, s:white)
call s:h("Exception", s:purple, s:white)
call s:h("PreProc", s:purple, s:white)
call s:h("Include", s:purple, s:white)
call s:h("Define", s:purple, s:white)
call s:h("Macro", s:purple, s:white)
call s:h("PreCondit", s:purple, s:white)

call s:h("Type", s:yellow, s:white)
call s:h("StorageClass", s:purple, s:white)
call s:h("Structure", s:yellow, s:white)
call s:h("Typedef", s:yellow, s:white)

call s:h("Special", s:red, s:white)
call s:h("SpecialChar", s:red, s:white)
call s:h("Tag", s:red, s:white)
call s:h("Delimiter", s:red, s:white)
call s:h("SpecialComment", s:red, s:white)
call s:h("Debug", s:red, s:white)

call s:h("Underlined", s:blue, s:white)
call s:h("Error", s:black, s:red)
call s:h("Todo", s:white, s:yellow)

" HTML
call s:h("htmlBold", s:black, s:white)
call s:h("htmlBoldUnderline", s:black, s:white)
call s:h("htmlBoldUnderlineItalic", s:black, s:white)
call s:h("htmlUnderline", s:black, s:white)
call s:h("htmlUnderlineItalic", s:black, s:white)
call s:h("htmlItalic", s:black, s:white)
call s:h("htmlTitle", s:black, s:white)
call s:h("htmlH1", s:black, s:white)
call s:h("htmlH2", s:black, s:white)
call s:h("htmlH3", s:black, s:white)
call s:h("htmlH4", s:black, s:white)
call s:h("htmlH5", s:black, s:white)
call s:h("htmlH6", s:black, s:white)

" JS
call s:h("jsArrowFunction", s:purple, s:white)
call s:h("jsFunction", s:purple, s:white)
call s:h("jsFuncName", s:blue, s:white)
call s:h("jsFuncCall", s:blue, s:white)
call s:h("jsUndefined", s:orange, s:white)
