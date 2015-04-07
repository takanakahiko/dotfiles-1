#!/bin/sh

cd $(dirname $0)

# install NeoBundle.git if it doesn't exist
if [ ! -d "$PWD/.vim/bundle/neobundle.vim" ]; then
    echo 'hello'
    git clone git://github.com/Shougo/neobundle.vim "$PWD/.vim/bundle/neobundle.vim"
fi

# update submodule
git submodule init
git submodule update

# create symbolic link
dotfiles=('.vim' '.vimrc' '.zshrc' '.bashrc' '.tmux.conf')
for dotfile in ${dotfiles[@]}; do
    ln -is "$PWD/$dotfile" $HOME
done

# sublime settings
rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/dotfiles/SublimeUserSettings/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Karabiner settings
ln -is ~/dotfiles/Karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
