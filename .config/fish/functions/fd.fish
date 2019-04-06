function fd
	set -l dir (find * -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux +m)
	cd "$dir"
end
