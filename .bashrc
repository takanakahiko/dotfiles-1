
export LANG=ja_JP.UTF-8

# キーバインド
set -o emacs

# alias
alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -l'
alias tmux='tmux -u'

# ヒストリー設定
HISTFILE=$HOME/.bash_history # 履歴をファイルに保存する
HISTSIZE=100000              # メモリ内の履歴の数
HISTCONTROL=ignoreboth       # 空白から始まるコマンドと重複コマンドは保存しない
SAVEHIST=100000              # 保存される履歴の数

bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# Mac Terminal のタイトル
case "${TERM}" in
    xterm-256color)
        precmd() {
            echo -ne "\033]0;\u@$\h:\w\007"
        }
        ;;
esac

export PS1='\[\e[0;36m\][\u@\h][\w]\[\e[00m\]$(parse_git_branch)\n\[\e[0;36m\]\$\[\e[00m\] '
export LSCOLORS=exfxcxdxbxegedabagacad

function parse_git_branch {
    branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'`
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color='0;37'
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color='0;34'
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color='0;31'
    else
        color='0;31'
    fi
    echo -e "\033[${color}m${branch}\033[00m"
}

# alias
[[ -f "${HOME}/.aliases" ]] && source ${HOME}/.aliases
