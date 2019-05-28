#!/bin/bash -eu

# https://github.com/anyenv/anyenv

if [[ -e "~/.anyenv" ]]; then
    echo "anyenv has already set up"
    exit 0
fi

git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init
anyenv install --init https://github.com/foo/anyenv-install.git

anyenv install plenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
anyenv install goenv
anyenv install jenv

exec $SHELL -l
