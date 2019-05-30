# plenv
if [ -d $HOME/.plenv/ ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
    eval "$(plenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

xport PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

vs () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

eval "$(anyenv init -)"

export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/Library/Android/sdk/build-tools"


alias emulator=/Users/hodaka.suzuki/Library/Android/sdk/emulator/emulator

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"