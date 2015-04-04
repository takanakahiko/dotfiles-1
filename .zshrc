
export ZDOTDIR=${HOME} # 設定ファイル配置ディレクトリ
export LANG=ja_JP.UTF-8

# keybind
bindkey -e

# alias
alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -l'
alias tmux='tmux -u'
alias open='open `pwd`'

# nvm, node
source $HOME/.nvm/nvm.sh

# zshoption の設定
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_to_end         # 補完後、カーソル位置は補完した単語の後ろの位置に移動する
setopt auto_cd               # コマンドが省略されていたら cd とみなす
setopt auto_menu             # 補完キー連打で補完候補を自動補完
setopt auto_name_dirs        # ある変数に絶対パスのディレクトリを設定すると、即座にその変数の名前がディレクトリの名前になり、補完に反映される
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd            # cd 時に元いたディレクトリを自動的にスタックに積む
                             # スタックは dirs コマンドで確認、そして cd -<TAB> でスタックから候補が検出される
DIRSTACKSIZE=100             # スタックの上限
setopt auto_remove_slash     # 補完されたパスが/で終って、その次の単語が語分割子か/かコマンド# の後(; とか & )だったら、補完末尾の/を取る
setopt extended_glob         # 特殊文字 # ~ ^ を使って補完
                             # 例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ
setopt extended_history      # ヒストリに時刻情報もつける
setopt globdots              # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt hist_ignore_all_dups  # 重複するヒストリを持たない
setopt hist_ignore_space     # 空白ではじまるコマンドをヒストリに保持しない
setopt hist_no_functions     # 関数定義をヒストリに入れない
setopt hist_no_store         # history コマンドをヒストリに入れない
setopt hist_reduce_blanks    # 履歴から冗長な空白を除く
setopt ignore_eof            # Ctrl-D でログアウトするのを抑制する
setopt list_packed           # 補完候補が一行ごとではなく、横に詰めて表示される
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt multios               # リダイレクト先を複数指定
setopt no_promptcr           # 改行コードで終らない出力もちゃんと出力する
setopt nolistbeep            # 補完候補表示時にビープ音を鳴らさない
setopt null_glob             # グロブがマッチしないときエラーにしない
setopt numeric_glob_sort     # グロブで数字のファイル名がひっかかった時は、辞書式順ではなく数値順で表示させる
setopt prompt_subst          # プロンプト文字列で各種展開を行なう
setopt pushd_ignore_dups     # ディレクトリスタックに、同じディレクトリを入れない
setopt share_history         # 複数プロセスで履歴を共有
setopt short_loops           # loop の短縮形を許す
setopt transient_rprompt     # 右プロンプトに入力がきたら消す
# setopt correct             # コマンドのスペルチェック

# 関数読み込み
autoload -U colors && colors
autoload -U compinit && compinit

# history
HISTFILE=$HOME/.zsh_history            # 履歴をファイルに保存する
HISTSIZE=100000                        # メモリ内の履歴の数
SAVEHIST=100000                        # 保存される履歴の数
function history-all { history -E 1 }  # 全履歴の一覧を出力する

# 入力に合わせて、その入力にマッチしたヒストリーを検索する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Mac Terminal のタイトル
case "${TERM}" in
    xterm-256color)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
        ;;
esac

# PROMPT
case ${UID} in
    0) # root
        PROMPT='`git-current-branch`%F{yellow}[%n@%M]%f%# '
        ;;
    *)
        PROMPT='%F{cyan}[%n@%M][%4~]%f`git-current-branch`'$'\n''%F{cyan}%#%f '
        ;;
esac

# ブランチネームを表示する関数
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
function git-current-branch {
    local branch st color gitdir action
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [[ -z $branch ]]; then
        return
    fi
    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=%F{green}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=%B%F{red}
    else
        color=%F{red}
    fi
    echo "${color}(${branch}${action})%f%b"
}

# LSCOLORS
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34' 'ln=;35' 'so=;32' 'ex=31' 'bd=46;34' 'cd=43;34' # ls 補完にも色を付ける

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 小文字に対して大文字も補完する

# load .zshrc.mine which is a private config
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

#homebrew
export PATH="/usr/local/bin:$PATH"


# local::lib
# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
