#!/bin/bash -eu

cd $(dirname $0)

if [[ ! -e "/usr/local/bin/brew" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# .BrewfileのsymlinkをHOMEに配置して、` brew bundle --global `を実行すると、
# 'Error: Too many levels of symbolic links @ rb_sysopen - ~/.Brewfile'と怒られるので、
# --fileで.Brewfileを直指定する
brew bundle --file=.Brewfile

# gitのdiffを見やすくするために、diff-highlightにパスを通す
# cf. https://qiita.com/takyam/items/d6afacc7934de9b0e85e
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
