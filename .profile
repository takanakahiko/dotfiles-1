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

# pipenv

# virtual envをどこに作るか
# defaultだと$HOME/.local/share/virtualenvs/に作られてしまうので、
# これを避けて、project配下に作るためのオプションを設定する
export PIPENV_VENV_IN_PROJECT=1

