set -x GOPATH ~/go/
set MANPATH
set MANPATH /usr/local/opt/coreutils/libexec/gnuman (manpath)
set PATH $HOME/.cargo/bin $HOME/bin $GOPATH/bin /usr/local/opt/gnu-sed/libexec/gnubin /usr/local/opt/coreutils/libexec/gnubin /usr/local/bin /usr/local/sbin $PATH

set -x EDITOR nvim
set -x PAGER less
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

alias vim nvim
alias view 'nvim -R'

alias l 'ls -lAh'
alias ll 'ls -lAhtr'
alias cd.. 'cd ..'
alias diff 'git diff'
alias ms 'meteor shell'
alias mm 'meteor mongo'
alias less 'less -iR'
alias cdd 'cd ~/Downloads'
alias js 'n_'
alias gdb 'gdb -q'
alias make 'make -j6'

# set tabwidth to 4
tabs -4

function remake
	make clean; and make
end

function cdm
	if test -z "$argv"
		echo 'usage: cdm <path>'
		return
	end
	mkdir -p -- $argv; and cd $argv
end

function clear # Clear with command(s).
	command clear
	eval $argv
end

function mupd # Better and cooler mup deploys.
	mup deploy
	tput bel
end

function short # The best shorter EUW
	curl "http://www.lieuwe.xyz/short" -d $argv -s | pbcopy
end

function silent # Silently executes a function
	eval $argv > /dev/null 2>&1
end

function ip # Prints current IP using httpbin.
	curl -s "https://httpbin.org/ip" | jq -r '.origin'
end

function updateall
	# Stuff using sudo
	sudo -v
	echo "😗 🎶"
	sudo softwareupdate -i -a
	#nvidia-update
	sudo gem update --system
	sudo gem update
	sudo gem cleanup
	yes | brew cu -af
	~/.tmux/plugins/tpm/bin/update_plugins all

	npm update -g

	brew update
	brew upgrade
	brew cleanup -s
	brew bundle dump -f --file=~/Brewfile

	for pip in pip2 pip3
		for package in (eval $pip list -o | awk '{print $1}')
			eval $pip install --upgrade $package
		end
	end

	nvim +"PlugUpgrade | PlugClean! | PlugInstall | PlugUpdate | qa"

	fish_update_completions

	# This should actually be done somewhere else
	rm -rf ~/.local/share/khal
	set -l file $TMPDIR/(date +%s).ics

	curl -Ls https://www.student.universiteitleiden.nl/binaries/content/assets/science/liacs/roosters/18-19/zalen-inf-2e-jaar-najaar-18-19.xls \
		| ~/studie/utils/parserooster/index.js 'Rooster Informatica 2e jaar najaar' >$file
	khal import --batch $file

	curl -Ls https://www.student.universiteitleiden.nl/binaries/content/assets/science/liacs/roosters/18-19/zalen-inf-2e-jaar-voorjaar-18-19.xls \
		| ~/studie/utils/parserooster/index.js 'Rooster Informatica 2e jaar voorjaar' >$file
	khal import --batch $file

	# Let's leave sudo behind nicely.
	sudo -k
end

function vakantie
	if test "$argv"
		curl -s "http://vakantie.lieuwe.xyz/$argv" | jq -r ".friendly"
	else
		curl -s "http://vakantie.lieuwe.xyz/wassenaar" | jq -r ".friendly"
	end
end

function weather
	curl wttr.in/wassenaar
end

function fixairplay # For when airplay sucks ass again.
	sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
	sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
	sudo -k
end

function lopen
	open "http://localhost:$argv"
end

function fd
	set -l dir (find * -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux +m)
	cd "$dir"
end

# === Git stuff.

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

function gck # Better and cooler git checkouts.
	if test $argv = "dev"
		git checkout develop
	else
		git checkout $argv
	end
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
