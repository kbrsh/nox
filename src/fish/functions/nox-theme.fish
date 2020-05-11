function nox-theme
	begin
		set -l hour (date +"%H")
		if test $hour -gt 7; and test $hour -lt 19
			if test $NOX_THEME = "dark"
				set -U NOX_THEME "light"
				echo -e "\033]50;SetProfile=nox-light\a"
				set fish_color_normal "3a6478" # Black
				set fish_color_command "836383" # Magenta
				set fish_color_quote "6d8363" # Green
				set fish_color_redirection "3a6478" # Black
				set fish_color_end "3a6478" # Black
				set fish_color_error "9b4b4b" # Red
				set fish_color_param "4b809b" # Blue
				set fish_color_comment "a5b4bb" # Light Gray
				set fish_color_match "3a6478" # Black
				set fish_color_selection --background="a5b4bb" # Light Gray
				set fish_color_search_match --background="a5b4bb" # Light Gray
				set fish_color_operator "3a6478" # Black
				set fish_color_escape "9b654b" # Orange
				set fish_color_autosuggestion "a5b4bb" # Light Gray
				set fish_color_cancel "9b4b4b" # Red
				set fish_pager_color_prefix "3a6478" --bold --underline # Black
				set fish_pager_color_completion "3a6478" --bold # Black
				set fish_pager_color_description "9b8e4b" # Yellow
				set fish_pager_color_progress "4b9b8e" # Cyan
			end
		else
			if test $NOX_THEME = "light"
				set -U NOX_THEME "dark"
				echo -e "\033]50;SetProfile=nox-dark\a"
				set fish_color_normal "99aab2" # White
				set fish_color_command "9c7c9c" # Magenta
				set fish_color_quote "879c7c" # Green
				set fish_color_redirection "99aab2" # White
				set fish_color_end "99aab2" # White
				set fish_color_error "b06969" # Red
				set fish_color_param "6998b0" # Blue
				set fish_color_comment "335261" # Gray
				set fish_color_match "99aab2" # White
				set fish_color_selection --background="335261" # Gray
				set fish_color_search_match --background="335261" # Gray
				set fish_color_operator "99aab2" # White
				set fish_color_escape "b08069" # Orange
				set fish_color_autosuggestion "335261" # Gray
				set fish_color_cancel "b06969" # Red
				set fish_pager_color_prefix "99aab2" --bold --underline # White
				set fish_pager_color_completion "99aab2" --bold # White
				set fish_pager_color_description "b0a469" # Yellow
				set fish_pager_color_progress "69b0a4" # Cyan
			end
		end
	end
end
