function nox-theme
	begin
		set -l hour (date +"%H")
		if test $hour -gt 7; and test $hour -lt 19
			if test $NOX_THEME != "light"
				set -g NOX_THEME "light"
				echo -e "\033]50;SetProfile=nox-light\a"
				set fish_color_normal "5e707d" # Shade 4
				set fish_color_command "916496" # Magenta
				set fish_color_quote "729664" # Green
				set fish_color_redirection "5e707d" # Shade 4
				set fish_color_end "5e707d" # Shade 4
				set fish_color_error "a15959" # Red
				set fish_color_param "5183a9" # Blue
				set fish_color_comment "8293a1" # Shade 3
				set fish_color_match "5e707d" # Shade 4
				set fish_color_selection --background="d6dce0" # Shade 1
				set fish_color_search_match --background="d6dce0" # Shade 1
				set fish_color_operator "5e707d" # Shade 4
				set fish_color_escape "a17359" # Orange
				set fish_color_autosuggestion "d6dce0" # Shade 1
				set fish_color_cancel "a15959" # Red
				set fish_pager_color_prefix "5e707d" --bold --underline # Shade 4
				set fish_pager_color_completion "5e707d" --bold # Shade 4
				set fish_pager_color_description "a19659" # Yellow
				set fish_pager_color_progress "59a182" # Cyan
			end
		else
			if test $NOX_THEME != "dark"
				set -g NOX_THEME "dark"
				echo -e "\033]50;SetProfile=nox-dark\a"
				set fish_color_normal "abb6bf" # Shade 4
				set fish_color_command "8b6b8e" # Magenta
				set fish_color_quote "758e6b" # Green
				set fish_color_redirection "abb6bf" # Shade 4
				set fish_color_end "abb6bf" # Shade 4
				set fish_color_error "a15959" # Red
				set fish_color_param "5682a4" # Blue
				set fish_color_comment "8293a1" # Shade 3
				set fish_color_match "abb6bf" # Shade 4
				set fish_color_selection --background="334d61" # Shade 1
				set fish_color_search_match --background="334d61" # Shade 1
				set fish_color_operator "abb6bf" # Shade 4
				set fish_color_escape "a17359" # Orange
				set fish_color_autosuggestion "334d61" # Shade 1
				set fish_color_cancel "a15959" # Red
				set fish_pager_color_prefix "abb6bf" --bold --underline # Shade 4
				set fish_pager_color_completion "abb6bf" --bold # Shade 4
				set fish_pager_color_description "a19659" # Yellow
				set fish_pager_color_progress "59a182" # Cyan
			end
		end
	end
end
