abbr -a git hub
abbr -a s 'git status -s'
abbr -a suno 's -uno'
abbr -a gl 'git log --oneline --decorate --graph'
abbr -a b 'git branch -vv'
abbr -a st 'git stash'
abbr -a sta 'st apply'
abbr -a stls 'st list'
abbr -a ga 'git add'
abbr -a gap 'git add -p'
abbr -a gr 'git reset'
abbr -a gs 'git show'
abbr -a gss 'git show (fch)'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'
abbr -a gck 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gfa 'git fetch --all'
abbr -a gu 'git up'
abbr -a gc 'git commit'
abbr -a gca 'gc --amend'
abbr -a gcad 'gca --date (date -R)'
abbr -a gcan 'gc --amend --no-edit'
abbr -a gcand 'gcan --date (date -R)'

function fch
	git log --color=always --pretty=oneline --abbrev-commit --reverse | fzf-tmux --tac +s +m -e --ansi --reverse | awk '{ print $1 }'
end

function gp # Better and cooler git pushes.
	git push $argv
	tput bel
end

function sti
	echo "stash@{$argv}"
end

function stai
	sta (sti $argv)
end
