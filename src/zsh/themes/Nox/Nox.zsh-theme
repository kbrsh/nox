# Nox ZSH Theme
local NOX_NAME="%{$fg[cyan]%}user%{$reset_color%}"

function NOX_VIM {
	echo "%{$fg[magenta]%}${${${KEYMAP:=main}/vicmd/N}/(main|viins)/I}%{$reset_color%}"
}

local NOX_CURRENT="%{$fg[blue]%}%~%{$reset_color%}"
local NOX_PROMPT="%(?:%{$fg[green]%}➜%{$reset_color%}:%{$fg[red]%}➜%{$reset_color%})"

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}×%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Prompt -> Name + Vim Mode + Current + Git Prompt
PROMPT="
${NOX_NAME} $(NOX_VIM) ${NOX_CURRENT} $(git_prompt_info)
${NOX_PROMPT} "
