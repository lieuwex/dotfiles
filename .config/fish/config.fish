set NPM_PACKAGES ~/.npm-packages
set NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
set MANPATH
set MANPATH $NPM_PACKAGES/share/man /usr/local/opt/coreutils/libexec/gnuman (manpath)
set PATH $GOPATH/bin $NPM_PACKAGES/bin /usr/local/opt/gnu-sed/libexec/gnubin /usr/local/opt/coreutils/libexec/gnubin /usr/local/bin /usr/local/sbin ~/bin $PATH
set EDITOR nvim
set -x PAGER less
set -x GO15VENDOREXPERIMENT 1

alias vim nvim
alias view 'nvim -R'

alias l 'ls -lAh'
alias ll 'ls -lAhtr'
alias cd.. 'cd ..'
alias diff 'git diff'
alias ms 'meteor shell'
alias mm 'meteor mongo'
alias remake 'make remake'
alias vimswap 'nvim (find . -type f -name ".*.swp" | sed \'s/\.swp$//\' | sed \'s/\/\./\//\')'
alias less 'less -iR'
alias cdd 'cd ~/Downloads'
alias js 'n_'
alias gdb 'gdb -q'

# set tabwidth to 4
tabs -4

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

function ip # Prints current IP using Tom Smeding's website.
	curl -s "http://tomsmeding.nl/ip.php"
end

function serve # Serves the current folder on the given port (defualt 3000) using Python's SimpleHTTPServer, silently.
	if test "$argv"
		lopen $argv
		python -m SimpleHTTPServer $argv > /dev/null 2>&1
	else
		lopen 3000
		python -m SimpleHTTPServer 3000 > /dev/null 2>&1
	end
end

function updateall
	# Trigger sudo for later
	sudo -v
	echo "😗 🎶"

	sudo softwareupdate -i -a

	npm update -g

	brew update
	brew upgrade --all
	brew cleanup
	brew cask cleanup

	gem update --system
	gem update
	gem cleanup

	for pip in pip pip3
		for package in (eval $pip list -o | awk '{print $1}')
			eval $pip install --upgrade $package
		end
	end

	nvim +"PlugUpgrade | PlugClean! | PlugInstall | PlugUpdate | qa"

	fish_update_completions

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
	set -l url "http://www.accuweather.com/en/nl/wassenaar/251522/weather-forecast/251522"
	curl -sL $url | awk -F"['\"]" '/acm_RecentLocationsCarousel\.push/{print $2": "$16", "$12"°C ( Feels like "$14"°C )" }'| head -1
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
# alias gr 'git reset head --'
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
alias gcan 'gc --amend --no-edit'

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
