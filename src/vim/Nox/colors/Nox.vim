" Syntax

if has('termguicolors')
  set termguicolors
endif

set background=dark
syntax reset

let g:colors_name="Nox"

let s:red = {'gui': '#ec9393', 'cterm': 210}
let s:orange = {'gui': '#ecb093', 'cterm': 180}
let s:yellow = {'gui': '#ecce93', 'cterm': 186}
let s:green = {'gui': '#b5df9f', 'cterm': 150}
let s:cyan = {'gui': '#8cf2ea', 'cterm': 116}
let s:blue = {'gui': '#8cd0f2', 'cterm': 111}
let s:purple = {'gui': '#cc99e6', 'cterm': 176}
let s:white = {'gui': '#7594a3', 'cterm': 109}
let s:black = {'gui': '#1f292e', 'cterm': 16}

let s:fg = s:white
let s:bg = s:black

let s:comment_fg  = {"gui": "#5c7a8a"}
let s:gutter_bg   = {"gui": "#1f292e"}
let s:gutter_fg   = {"gui": "#5c7a8a"}

let s:cursor_line = {"gui": "#7594a3"}
let s:color_col   = {"gui": "#7594a3"}

let s:selection   = {"gui": "#33444d"}
let s:vertsplit   = {"gui": "#33444d"}


function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui
  else
    exec "hi " . a:group . " guifg=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui
  else
    exec "hi " . a:group . " guibg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE"
  endif
endfun


call s:h("Normal", s:fg, s:bg, "")
call s:h("NonText", s:fg, "", "")

call s:h("Cursor", s:bg, s:blue, "")
call s:h("CursorColumn", "", s:cursor_line, "")
call s:h("CursorLine", "", s:cursor_line, "")

call s:h("LineNr", s:gutter_fg, s:gutter_bg, "")
call s:h("CursorLineNr", s:fg, "", "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", s:yellow, "", "")
call s:h("DiffDelete", s:red, "", "")
call s:h("DiffText", s:blue, "", "")

call s:h("IncSearch", s:bg, s:yellow, "")
call s:h("Search", s:bg, s:yellow, "")

call s:h("ErrorMsg", s:fg, "", "")
call s:h("ModeMsg", s:fg, "", "")
call s:h("MoreMsg", s:fg, "", "")
call s:h("WarningMsg", s:red, "", "")
call s:h("Question", s:purple, "", "")

call s:h("Pmenu", s:bg, s:fg, "")
call s:h("PmenuSel", s:fg, s:blue, "")
call s:h("PmenuSbar", "", s:selection, "")
call s:h("PmenuThumb", "", s:fg, "")

call s:h("SpellBad", s:red, "", "")
call s:h("SpellCap", s:yellow, "", "")
call s:h("SpellLocal", s:yellow, "", "")
call s:h("SpellRare", s:yellow, "", "")

call s:h("StatusLine", s:blue, s:cursor_line, "")
call s:h("StatusLineNC", s:comment_fg, s:cursor_line, "")
call s:h("TabLine", s:comment_fg, s:cursor_line, "")
call s:h("TabLineFill", s:comment_fg, s:cursor_line, "")
call s:h("TabLineSel", s:fg, s:bg, "")

call s:h("Visual", "", s:selection, "")
call s:h("VisualNOS", "", s:selection, "")

call s:h("ColorColumn", "", s:color_col, "")
call s:h("Conceal", s:fg, "", "")
call s:h("Directory", s:blue, "", "")
call s:h("VertSplit", s:vertsplit, s:vertsplit, "")
call s:h("Folded", s:fg, "", "")
call s:h("FoldColumn", s:fg, "", "")
call s:h("SignColumn", s:fg, "", "")

call s:h("MatchParen", s:white, "", "underline")
call s:h("SpecialKey", s:fg, "", "")
call s:h("Title", s:black, "", "")
call s:h("WildMenu", s:fg, "", "")

call s:h("Comment", s:comment_fg, "", "")
call s:h("Constant", s:orange, "", "")
call s:h("String", s:green, "", "")
call s:h("Character", s:green, "", "")
call s:h("Number", s:orange, "", "")
call s:h("Boolean", s:orange, "", "")
call s:h("Float", s:orange, "", "")

call s:h("Identifier", s:purple, "", "")
call s:h("Function", s:purple, "", "")
call s:h("Statement", s:purple, "", "")

call s:h("Conditional", s:purple, "", "")
call s:h("Repeat", s:purple, "", "")
call s:h("Label", s:white, "", "")
call s:h("Operator", s:fg, "", "")
call s:h("Keyword", s:purple, "", "")
call s:h("Exception", s:purple, "", "")

call s:h("PreProc", s:purple, "", "")
call s:h("Include", s:purple, "", "")
call s:h("Define", s:purple, "", "")
call s:h("Macro", s:purple, "", "")
call s:h("PreCondit", s:purple, "", "")

call s:h("Type", s:purple, "", "")
call s:h("StorageClass", s:purple, "", "")
call s:h("Structure", s:purple, "", "")
call s:h("Typedef", s:purple, "", "")

call s:h("Special", s:blue, "", "")
call s:h("SpecialChar", s:fg, "", "")
call s:h("Tag", s:fg, "", "")
call s:h("Delimiter", s:fg, "", "")
call s:h("SpecialComment", s:fg, "", "")
call s:h("Debug", s:fg, "", "")
call s:h("Underlined", s:fg, "", "")
call s:h("Ignore", s:fg, "", "")
call s:h("Error", s:red, s:gutter_bg, "")
call s:h("Todo", s:purple, "", "")

call s:h("gitcommitComment", s:comment_fg, "", "")
call s:h("gitcommitUnmerged", s:red, "", "")
call s:h("gitcommitOnBranch", s:fg, "", "")
call s:h("gitcommitBranch", s:purple, "", "")
call s:h("gitcommitDiscardedType", s:red, "", "")
call s:h("gitcommitSelectedType", s:green, "", "")
call s:h("gitcommitHeader", s:fg, "", "")
call s:h("gitcommitUntrackedFile", s:cyan, "", "")
call s:h("gitcommitDiscardedFile", s:red, "", "")
call s:h("gitcommitSelectedFile", s:green, "", "")
call s:h("gitcommitUnmergedFile", s:yellow, "", "")
call s:h("gitcommitFile", s:fg, "", "")
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile
