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

exec $SHELL -l

echo 'installed envs are...'
anyenv envs
