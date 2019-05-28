#!/bin/bash -eu

cd $(dirname $0)

if [[ ! -e "/usr/local/bin/brew" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

ln -is ".Brewfile" $HOME

brew bundle --global
