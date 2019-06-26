#!/bin/bash -eu

# https://github.com/anyenv/anyenv

anyenv init
anyenv install --init

anyenv install plenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
anyenv install goenv
anyenv install jenv

# plugin

# anyenv-update: provides `anyenv update` command to update target envs
#                https://github.com/znz/anyenv-update
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

echo 'installed envs are...'
anyenv envs

exec $SHELL -l

