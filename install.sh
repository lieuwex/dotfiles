#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew tap caskroom/cask
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/python
brew tap homebrew/science

brew install aspell --with-lang-nl --with-lang-en --with-lang-de
brew install asciidoc

brew install bitlbee
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.bitlbee.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.bitlbee.plist

brew install boost
brew install brew-cask
brew install calc
brew install cmatrix
brew install colordiff
brew install coreutils
brew install cowsay
brew install emacs-mac --with-spacemacs-icon --with-gnutls
brew install exercism
brew install eye-d3
brew install ffind
brew install findutils
brew install fish
brew install flow
brew install gcc
brew install gist
brew install git
brew install gnu-sed
brew install gnu-time
brew install gpm
brew install grep

brew install htop-osx
sudo chown root:wheel /usr/local/Cellar/htop-osx/*/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/*/bin/htop

brew install hub
brew install imagemagick
brew install iojs
brew install jq
brew install libmpdclient
brew install libssh2
brew install links
brew install luajit
brew install macvim --with-cscope --with-lua --HEAD --override-system-vim --with-python
brew install mathomatic
brew install mercurial
brew install mobile-shell
brew install mono
brew install neovim
brew install ngircd
brew install ngrep
brew install node
brew install opencv --with-opengl --with-ffmpeg --with-cuda
brew install ossp-uuid
brew install p7zip
brew install pandoc
brew install postgresql
brew install pstree
brew install pup
brew install pypy

brew install python --override-system-python
brew install python3
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools

brew install reattach-to-user-namespace
brew install ruby
brew install rust
brew install s-lang
brew install sdl
brew install sl
brew install the_silver_searcher
brew install tmux
brew install tree
brew install tty-clock
brew install w3m
brew install weechat --with-aspell --with-lua --with-curl --with-perl --with-python --with-ruby
brew install wget
brew install youtube-dl

brew cask install alfred
brew cask install atom
brew cask install warsow

brew cleanup
brew cask cleanup

fish -c "updateall"
