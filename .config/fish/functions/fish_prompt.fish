set -g __fish_prompt_normal (set_color normal)

function fish_prompt --description "Write out the prompt"
	switch $USER
		case root
			if not set -q __fish_prompt_cwd
				if set -q fish_color_cwd_root
					set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
				else
					set -g __fish_prompt_cwd (set_color $fish_color_cwd)
				end
			end

			echo -n -s (set_color 666666)(date +%H:%M:%S)" $__fish_prompt_cwd"(prompt_pwd)(set_color $fish_color_normal)'#'"$__fish_prompt_normal"' '

		case '*'
			if not set -q __fish_prompt_cwd
				set -g __fish_prompt_cwd (set_color $fish_color_cwd)
			end

			echo -n -s (set_color 666666)(date +%H:%M:%S)" $__fish_prompt_cwd"(prompt_pwd)(set_color $fish_color_normal)'>'"$__fish_prompt_normal"' '
	end
end
