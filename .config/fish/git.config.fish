alias git hub
alias s 'git status -s'
alias suno 's -uno'
alias gl 'git log --oneline --decorate --graph'
alias b 'git branch -vv'
alias st 'git stash'
alias sta 'st apply'
alias stls 'st list'
alias ga 'git add'
alias gap 'git add -p'
alias gr 'git reset'
alias gs 'git show'
alias gss 'git show (fch)'
alias gd 'git diff'
alias gds 'git diff --staged'
alias gck 'git checkout'
alias gcb 'git checkout -b'
alias gfa 'git fetch --all'
alias gu 'git up'
alias gc 'git commit'
alias gca 'gc --amend'
alias gcad 'gca --date (date -R)'
alias gcan 'gc --amend --no-edit'
alias gcand 'gcan --date (date -R)'

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
