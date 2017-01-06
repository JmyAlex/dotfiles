function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	set fish_color_error red --bold
	set fish_color_ok green --bold
	set fish_color_cwd blue --bold
	set fish_color_git yellow

	set git_branch_symbol ' '
	set promt_symbol '❯ '

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	set_color $fish_color_git
	printf '%s ' (__fish_git_prompt)
	set_color normal

	if not test $last_status -eq 0
		set_color $fish_color_error
	else
		set_color $fish_color_ok
	end

	echo -n $promt_symbol

	set_color normal
end
