" Nox Airline Theme

let s:red = {"gui': "#ec7979", "cterm": 210}
let s:orange = {"gui': "#e4a281", "cterm": 180}
let s:yellow = {"gui': "#e4c381", "cterm": 186}
let s:green = {"gui': "#a7d590", "cterm": 150}
let s:cyan = {"gui': "#81d4e4", "cterm": 116}
let s:blue = {"gui': "#79b2ec", "cterm": 111}
let s:purple = {"gui': "#c381e4", "cterm": 176}
let s:white = {"gui': "#85a0ad", "cterm": 109}
let s:black = {"gui': "#141b1f", "cterm": 16}

let g:airline#themes#Nox#palette = {}

let s:palette = [s:black.gui, s:blue.gui, s:black.cterm, s:blue.cterm]
let g:airline#themes#Nox#palette.normal = airline#themes#generate_color_map(s:palette, s:palette, s:palette)

for item in ['insert', 'replace', 'visual', 'inactive', 'ctrlp']
  exe "let g:airline#themes#Nox#palette." . item . " = g:airline#themes#Nox#palette.normal"
  for suf in ['_modified', '_paste']
    exe "let g:airline#themes#Nox#palette." . item . suffix " = g:airline#themes#Nox#palette.normal"
  endfor
endfor
