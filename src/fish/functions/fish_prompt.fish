function fish_prompt
	set_color cyan
	echo -n "
user "

	set_color blue
	echo -n (prompt_pwd)

	if test -d .git
		if string match -r "(M|\?\?) " (git status --porcelain) > /dev/null
			set_color red
		else if string match -r "A " (git status --porcelain) > /dev/null
			set_color yellow
		else
			set_color green
		end

		echo -n " "(git symbolic-ref --short HEAD)
	end

	switch $fish_bind_mode
		case default
			set_color magenta
		case insert
			set_color yellow
		case visual
			set_color yellow
	end
	echo -n "
➜ "
end
