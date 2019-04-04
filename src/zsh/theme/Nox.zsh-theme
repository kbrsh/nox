# Nox ZSH Theme
local NOX_NAME="%{$fg[cyan]%}user%{$reset_color%}"
local NOX_CURRENT="%{$fg[blue]%}%~%{$reset_color%}"

local NOX_PROMPT_BLUE="%{$fg[blue]%}"
local NOX_PROMPT_GREEN="%{$fg[green]%}"

function NOX_PROMPT {
	echo "${${${KEYMAP:-main}/vicmd/${NOX_PROMPT_BLUE}}/(main|viins)/${NOX_PROMPT_GREEN}}➜%{$reset_color%}"
}

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}×%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Prompt -> Name + Current + Git Prompt
function NOX_FULL {
	echo "
${NOX_NAME} ${NOX_CURRENT} $(git_prompt_info)
$(NOX_PROMPT) "
}

PROMPT="$(NOX_FULL)"

function zle-line-init zle-keymap-select {
	PROMPT="$(NOX_FULL)"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
