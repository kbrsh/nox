" Syntax

if has("termguicolors")
	set termguicolors
endif

hi clear
syntax reset
set background=light

let g:colors_name="nox-light"

let s:shade0 = {"gui": "#f9fafb", "cterm": 16}
let s:shade1 = {"gui": "#d6dce0", "cterm": 109}
let s:shade2 = {"gui": "#abb6bf", "cterm": 109}
let s:shade3 = {"gui": "#8293a1", "cterm": 109}
let s:shade4 = {"gui": "#5e707d", "cterm": 16}
let s:shade5 = {"gui": "#334d61", "cterm": 109}
let s:shade6 = {"gui": "#19252f", "cterm": 109}
let s:red = {"gui": "#a15959", "cterm": 210}
let s:orange = {"gui": "#a17359", "cterm": 180}
let s:yellow = {"gui": "#a19659", "cterm": 186}
let s:green = {"gui": "#729664", "cterm": 150}
let s:cyan = {"gui": "#59a182", "cterm": 116}
let s:blue = {"gui": "#5183a9", "cterm": 111}
let s:purple = {"gui": "#916496", "cterm": 176}

function! s:h(type, fg, bg, ...)
	let l:style = get(a:, 1, "none")
	exec "hi " . a:type . " cterm=" . l:style . " ctermbg=" . a:bg.cterm . " ctermfg=" . a:fg.cterm . " gui=" . l:style . " guibg=" . a:bg.gui . " guifg=" . a:fg.gui
endfunction

call s:h("User1", s:shade0, s:shade4)
call s:h("User2", s:shade6, s:shade2)
call s:h("User3", s:shade4, s:shade0)

call s:h("Cursor", s:shade0, s:shade6)
call s:h("iCursor", s:shade6, s:shade0)
call s:h("CursorLine", s:shade4, s:shade1)
call s:h("Directory", s:blue, s:shade0)
call s:h("IncSearch", s:shade0, s:yellow)
call s:h("LineNr", s:shade2, s:shade0)
call s:h("NonText", s:shade2, s:shade0)
call s:h("MatchParen", s:shade4, s:shade0, "underline")
call s:h("Pmenu", s:shade4, s:shade1)
call s:h("PmenuSel", s:shade0, s:shade4)
call s:h("PmenuSbar", s:shade0, s:shade0)
call s:h("PmenuThumb", s:shade4, s:shade4)
call s:h("Substitute", s:shade0, s:yellow)
call s:h("Search", s:shade0, s:yellow)
call s:h("VertSplit", s:shade4, s:shade0)
call s:h("Visual", s:shade4, s:shade1)
call s:h("WildMenu", s:shade0, s:yellow)

call s:h("Normal", s:shade4, s:shade0)
call s:h("Identifier", s:shade4, s:shade0)
call s:h("Function", s:blue, s:shade0)

call s:h("Comment", s:shade3, s:shade0)

call s:h("Constant", s:orange, s:shade0)
call s:h("String", s:green, s:shade0)
call s:h("Character", s:green, s:shade0)
call s:h("Number", s:orange, s:shade0)
call s:h("Boolean", s:orange, s:shade0)
call s:h("Float", s:orange, s:shade0)

call s:h("Statement", s:purple, s:shade0)
call s:h("Conditional", s:purple, s:shade0)
call s:h("Repeat", s:purple, s:shade0)
call s:h("Label", s:purple, s:shade0)
call s:h("Operator", s:shade4, s:shade0)
call s:h("Keyword", s:purple, s:shade0)
call s:h("Exception", s:purple, s:shade0)
call s:h("PreProc", s:purple, s:shade0)
call s:h("Include", s:purple, s:shade0)
call s:h("Define", s:purple, s:shade0)
call s:h("Macro", s:purple, s:shade0)
call s:h("PreCondit", s:purple, s:shade0)

call s:h("Type", s:yellow, s:shade0)
call s:h("StorageClass", s:purple, s:shade0)
call s:h("Structure", s:yellow, s:shade0)
call s:h("Typedef", s:yellow, s:shade0)

call s:h("Special", s:red, s:shade0)
call s:h("SpecialChar", s:red, s:shade0)
call s:h("Tag", s:red, s:shade0)
call s:h("Delimiter", s:red, s:shade0)
call s:h("SpecialComment", s:red, s:shade0)
call s:h("Debug", s:red, s:shade0)

call s:h("Underlined", s:blue, s:shade0)
call s:h("Error", s:shade4, s:red)
call s:h("Todo", s:shade0, s:yellow)

" HTML
call s:h("htmlBold", s:shade4, s:shade0)
call s:h("htmlBoldUnderline", s:shade4, s:shade0)
call s:h("htmlBoldUnderlineItalic", s:shade4, s:shade0)
call s:h("htmlUnderline", s:shade4, s:shade0)
call s:h("htmlUnderlineItalic", s:shade4, s:shade0)
call s:h("htmlItalic", s:shade4, s:shade0)
call s:h("htmlTitle", s:shade4, s:shade0)
call s:h("htmlH1", s:shade4, s:shade0)
call s:h("htmlH2", s:shade4, s:shade0)
call s:h("htmlH3", s:shade4, s:shade0)
call s:h("htmlH4", s:shade4, s:shade0)
call s:h("htmlH5", s:shade4, s:shade0)
call s:h("htmlH6", s:shade4, s:shade0)

" JS
call s:h("jsArrowFunction", s:purple, s:shade0)
call s:h("jsFunction", s:purple, s:shade0)
call s:h("jsOperatorKeyword", s:purple, s:shade0)
call s:h("jsFuncName", s:blue, s:shade0)
call s:h("jsFuncCall", s:blue, s:shade0)
call s:h("jsUndefined", s:orange, s:shade0)

" Finder
let $FZF_DEFAULT_OPTS="--pointer='' --layout=reverse --no-multi --bind tab:down --bind btab:up --margin=1,3 --color border:" . s:shade0.gui . " --color gutter:" . s:shade0.gui . " --color hl:" . s:green.gui . " --color hl+:" . s:green.gui . " --color bg+:" . s:shade1.gui
