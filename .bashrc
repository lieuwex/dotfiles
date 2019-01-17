PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
PATH="~/bin:${PATH}"
PATH="/usr/local/heroku/bin:${PATH}"
PATH="/usr/local/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"
export PATH

export GOPATH=$HOME/go
export PATH="${PATH}:$GOPATH/bin"

alias git=hub
export EDITOR='/usr/local/bin/vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
