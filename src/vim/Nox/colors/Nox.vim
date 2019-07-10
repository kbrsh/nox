" Syntax

if has("termguicolors")
	set termguicolors
endif

hi clear
syntax reset
set background=dark

let g:colors_name="Nox"

let s:black = {"gui": "#19272f", "cterm": 16}
let s:gray = {"gui": "#335261", "cterm": 109}
let s:lightgray = {"gui": "#8ea0a9", "cterm": 109}
let s:white = {"gui": "#abb9bf", "cterm": 109}
let s:red = {"gui": "#b06969", "cterm": 210}
let s:orange = {"gui": "#b08069", "cterm": 180}
let s:yellow = {"gui": "#b0a469", "cterm": 186}
let s:green = {"gui": "#879c7c", "cterm": 150}
let s:cyan = {"gui": "#69b0a4", "cterm": 116}
let s:blue = {"gui": "#6998b0", "cterm": 111}
let s:purple = {"gui": "#9c7c9c", "cterm": 176}

function! s:h(type, fg, bg, ...)
	let l:style = get(a:, 1, "none")
	exec "hi " . a:type . " cterm=" . l:style . " ctermbg=" . a:bg.cterm . " ctermfg=" . a:fg.cterm . " gui=" . l:style . " guibg=" . a:bg.gui . " guifg=" . a:fg.gui
endfunction

call s:h("Cursor", s:black, s:white)
call s:h("iCursor", s:white, s:black)
call s:h("CursorLine", s:black, s:lightgray)
call s:h("Directory", s:blue, s:black)
call s:h("IncSearch", s:black, s:yellow)
call s:h("LineNr", s:gray, s:black)
call s:h("NonText", s:gray, s:black)
call s:h("MatchParen", s:white, s:black, "underline")
call s:h("Pmenu", s:black, s:gray)
call s:h("PmenuSel", s:black, s:white)
call s:h("PmenuSbar", s:black, s:black)
call s:h("PmenuThumb", s:white, s:white)
call s:h("Substitute", s:black, s:yellow)
call s:h("Search", s:black, s:yellow)
call s:h("VertSplit", s:white, s:black)
call s:h("Visual", s:black, s:white)
call s:h("WildMenu", s:black, s:yellow)

call s:h("Normal", s:white, s:black)
call s:h("Identifier", s:white, s:black)
call s:h("Function", s:blue, s:black)

call s:h("Comment", s:gray, s:black)

call s:h("Constant", s:orange, s:black)
call s:h("String", s:green, s:black)
call s:h("Character", s:green, s:black)
call s:h("Number", s:orange, s:black)
call s:h("Boolean", s:orange, s:black)
call s:h("Float", s:orange, s:black)

call s:h("Statement", s:purple, s:black)
call s:h("Conditional", s:purple, s:black)
call s:h("Repeat", s:purple, s:black)
call s:h("Label", s:purple, s:black)
call s:h("Operator", s:white, s:black)
call s:h("Keyword", s:purple, s:black)
call s:h("Exception", s:purple, s:black)
call s:h("PreProc", s:purple, s:black)
call s:h("Include", s:purple, s:black)
call s:h("Define", s:purple, s:black)
call s:h("Macro", s:purple, s:black)
call s:h("PreCondit", s:purple, s:black)

call s:h("Type", s:yellow, s:black)
call s:h("StorageClass", s:purple, s:black)
call s:h("Structure", s:yellow, s:black)
call s:h("Typedef", s:yellow, s:black)

call s:h("Special", s:red, s:black)
call s:h("SpecialChar", s:red, s:black)
call s:h("Tag", s:red, s:black)
call s:h("Delimiter", s:red, s:black)
call s:h("SpecialComment", s:red, s:black)
call s:h("Debug", s:red, s:black)

call s:h("Underlined", s:blue, s:black)
call s:h("Error", s:white, s:red)
call s:h("Todo", s:white, s:yellow)

" HTML
call s:h("htmlBold", s:white, s:black)
call s:h("htmlBoldUnderline", s:white, s:black)
call s:h("htmlBoldUnderlineItalic", s:white, s:black)
call s:h("htmlUnderline", s:white, s:black)
call s:h("htmlUnderlineItalic", s:white, s:black)
call s:h("htmlItalic", s:white, s:black)
call s:h("htmlTitle", s:white, s:black)
call s:h("htmlH1", s:white, s:black)
call s:h("htmlH2", s:white, s:black)
call s:h("htmlH3", s:white, s:black)
call s:h("htmlH4", s:white, s:black)
call s:h("htmlH5", s:white, s:black)
call s:h("htmlH6", s:white, s:black)

" JS
call s:h("jsArrowFunction", s:purple, s:black)
call s:h("jsFunction", s:purple, s:black)
call s:h("jsFuncName", s:blue, s:black)
call s:h("jsFuncCall", s:blue, s:black)
call s:h("jsUndefined", s:orange, s:black)
