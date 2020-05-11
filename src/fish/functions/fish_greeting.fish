function fish_greeting
	set -g NOX_THEME ""
	nox-theme

	set_color magenta
	echo -n "~~~~~~~"

	set_color blue
	echo -n " Shell "

	set_color magenta
	echo "~~~~~~~"
end
