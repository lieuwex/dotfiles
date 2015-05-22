source ~/.config/fish/z-fish/z.fish

set PATH /usr/local/bin /usr/local/sbin ~/bin $PATH
set EDITOR vim

alias l 'la'
alias cd.. 'cd ..'
alias diff 'git diff'
alias beep 'tput bel'
alias ms 'meteor shell'
alias mm 'meteor mongo'

function clear # Clear with command(s).
	command clear
	eval $argv
end

function mupd # Better and cooler mup deploys.
	mup deploy
	beep
end

function short # The best shorter EUW
	curl "http://www.lieuwex.me/short" -d $argv -s | pbcopy
end

function ip # Prints current IP using Tom Smeding's website.
	curl -s "http://tomsmeding.nl/ip.php"
end

function serve # Serves the current folder on the given port (defualt 3000) using Python's SimpleHTTPServer, silently.
	if test "$argv"
		python -m SimpleHTTPServer $argv > /dev/null 2>&1
	else
		python -m SimpleHTTPServer 3000 > /dev/null 2>&1
	end
end

function updateall
	# Trigger sudo for later
	sudo -v
	echo "😗 🎶"

	sudo npm-update-global

	sudo softwareupdate -i -a

	brew update
	brew upgrade --all
	brew cleanup
	brew cask cleanup

	gem update --system
	gem update
	gem cleanup

	for pip in pip pip3
		for package in (eval $pip list | awk '{print $1}')
			eval $pip install --upgrade $package
		end
	end

	vim +"PlugUpgrade | PlugClean! | PlugInstall | PlugUpdate | qa"

	fish_update_completions

	# Let's leave sudo behind nicely.
	sudo -k
end

function vakantie
	if test "$argv"
		curl -s "http://vakantie.lieuwex.me/$argv" | jq -r ".friendly"
	else
		curl -s "http://vakantie.lieuwex.me/wassenaar" | jq -r ".friendly"
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

# === Git stuff.

alias git hub
alias s 'git status -s'
alias suno 's -uno'
alias b 'git branch'
alias st 'git stash'
alias sta 'st apply'
alias sts 'st save'
alias stls 'st list'
alias gs 'git show'

function gc # Better and cooler git checkouts.
	if test $argv = "dev"
		git checkout develop
	else
		git checkout $argv
	end
end

function gp # Better and cooler git pushes.
	git push $argv
	beep
end

function mupdsh # simplyHomework flow specific push
	set -lx branch git rev-parse --abbrev-ref HEAD
	set -lx changes git status --porcelain -uno | wc -l | tr -d '[[:space:]]'

	if test $branch = "develop"
		if $changes -gt 0
			git stash save
		end
		git push
		git checkout master
		git merge develop
		git push
		mup deploy
		git checkout develop
		if $changes -gt 0
			git stash apply
			git stash drop
		end
		clear
		git status
	else
		echo "You aren't on branch 'develop' but on branch " + $branch + "."
	end

	beep
end
