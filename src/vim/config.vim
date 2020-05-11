call plug#begin("~/.local/share/nvim/plugged")
Plug "kbrsh/nox", {"rtp": "src/vim/nox/"}
call plug#end()

let s:hour = strftime("%H")
syntax on
execute "colorscheme " . (s:hour > 7 && s:hour < 19 ? "nox-light" : "nox-dark")
