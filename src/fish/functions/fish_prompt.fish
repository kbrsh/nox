function fish_prompt
	nox-theme
	set_color cyan
	echo -n "
$NOX_USER"

   set_color normal
   echo -n "@"
	set_color blue
	echo -n (prompt_pwd)

	if test -d .git
      set_color normal
      echo -n "➜"

		if git status --porcelain | grep "^[ MADRCU?!][MADRCU?!]" > /dev/null
			# Check for any modified files in the working area.
			set_color red
		else if git status --porcelain | grep "^[MADRCU?!]" > /dev/null
			# Check for any modified files in the staging area.
			set_color yellow
		else
			# If nothing is modified and everything is committed, default to green.
			set_color green
		end

		echo -n (git symbolic-ref --short HEAD)
	end

	switch $fish_bind_mode
		case default
			set_color blue
		case insert
			set_color yellow
		case visual
			set_color yellow
	end
	echo -n " ❯ "
end
