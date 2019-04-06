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

function silent # Silently executes a function
	eval $argv > /dev/null 2>&1
end

function ip # Prints current IP using httpbin.
	curl -s "https://httpbin.org/ip" | jq -r '.origin'
end

function weather
	curl wttr.in/wassenaar
end

function lopen
	open "http://localhost:$argv"
end

source ~/.config/fish/git.config.fish
