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

	# Let's leave sudo behind nicely.
	sudo -k
end
