" Syntax

if has("termguicolors")
	set termguicolors
endif

hi clear
syntax reset
set background=light

let g:colors_name="nox-light"

let s:shade0 = "#f9fafb"
let s:shade1 = "#d6dce0"
let s:shade2 = "#abb6bf"
let s:shade3 = "#8293a1"
let s:shade4 = "#5e707d"
let s:shade5 = "#334d61"
let s:shade6 = "#19252f"
let s:red = "#a15959"
let s:orange = "#a17359"
let s:yellow = "#a19659"
let s:green = "#729664"
let s:cyan = "#59a182"
let s:blue = "#5183a9"
let s:purple = "#916496"
let s:none = "NONE"

function! s:h(type, ...)
   let l:fg = get(a:, 1, s:none)
	let l:bg = get(a:, 2, s:none)
	let l:style = get(a:, 3, s:none)
	exec "hi " . a:type . " gui=" . l:style . " guibg=" . l:bg . " guifg=" . l:fg
endfunction

call s:h("User1", s:shade0, s:shade4)
call s:h("User2", s:shade6, s:shade2)
call s:h("User3", s:shade4)
call s:h("User4", s:shade3)

call s:h("Cursor", s:shade0, s:shade6)
call s:h("iCursor", s:shade6)
call s:h("CursorLine", s:shade4, s:shade1)
call s:h("Directory", s:blue)
call s:h("IncSearch", s:shade0, s:yellow)
call s:h("LineNr", s:shade2)
call s:h("NonText", s:shade2)
call s:h("MatchParen", s:shade4, "NONE", "underline")
call s:h("Pmenu", s:shade4, s:shade1)
call s:h("PmenuSel", s:shade0, s:shade4)
call s:h("PmenuSbar", s:shade0, s:shade0)
call s:h("PmenuThumb", s:shade4, s:shade4)
call s:h("Substitute", s:shade0, s:yellow)
call s:h("Search", s:shade0, s:yellow)
call s:h("VertSplit", s:shade4)
call s:h("Visual", s:shade4, s:shade1)
call s:h("WildMenu", s:shade0, s:yellow)
call s:h("SignColumn", s:shade0)

call s:h("Normal", s:shade4)
call s:h("NormalFloat", s:shade4, s:shade1)
call s:h("Identifier", s:shade4)

call s:h("Function", s:blue)

call s:h("Comment", s:shade3)
call s:h("Operator", s:shade3)

call s:h("Constant", s:orange)
call s:h("Number", s:orange)
call s:h("Boolean", s:orange)
call s:h("Float", s:orange)

call s:h("String", s:green)
call s:h("Character", s:green)

call s:h("Statement", s:purple)
call s:h("Conditional", s:purple)
call s:h("Repeat", s:purple)
call s:h("Label", s:purple)
call s:h("Keyword", s:purple)
call s:h("Exception", s:purple)
call s:h("PreProc", s:purple)
call s:h("Include", s:purple)
call s:h("Define", s:purple)
call s:h("Macro", s:purple)
call s:h("PreCondit", s:purple)
call s:h("StorageClass", s:purple)

call s:h("Type", s:yellow)
call s:h("Structure", s:yellow)
call s:h("Typedef", s:yellow)

call s:h("Special", s:red)
call s:h("SpecialChar", s:red)
call s:h("Tag", s:red)
call s:h("Delimiter", s:red)
call s:h("SpecialComment", s:red)
call s:h("Debug", s:red)

call s:h("Underlined", s:blue)
call s:h("Error", s:shade4)
call s:h("Todo", s:shade0)

" HTML
call s:h("htmlBold", s:shade4)
call s:h("htmlBoldUnderline", s:shade4)
call s:h("htmlBoldUnderlineItalic", s:shade4)
call s:h("htmlUnderline", s:shade4)
call s:h("htmlUnderlineItalic", s:shade4)
call s:h("htmlItalic", s:shade4)
call s:h("htmlTitle", s:shade4)
call s:h("htmlH1", s:shade4)
call s:h("htmlH2", s:shade4)
call s:h("htmlH3", s:shade4)
call s:h("htmlH4", s:shade4)
call s:h("htmlH5", s:shade4)
call s:h("htmlH6", s:shade4)

" JS
call s:h("jsArrowFunction", s:purple)
call s:h("jsFunction", s:purple)
call s:h("jsOperatorKeyword", s:purple)
call s:h("jsFuncName", s:blue)
call s:h("jsFuncCall", s:blue)
call s:h("jsUndefined", s:orange)

" Finder
let $FZF_DEFAULT_OPTS="--layout=reverse --no-multi --bind tab:down --bind btab:up --margin=1,3 --color 'border:" . s:shade1 . "' --color 'gutter:" . s:shade0 . "' --color 'pointer:" . s:shade2 . "' --color 'hl:" . s:green . "' --color 'hl+:" . s:green . "' --color 'fg+:" . s:shade4 . "' --color 'bg+:" . s:shade1 . "'"
