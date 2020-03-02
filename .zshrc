# 日本語を使用
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors && colors

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# alias
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ll='ls -lF'
alias la='ls -alF'
alias grep='grep --color'
alias tm='tmux'
alias tml='tmux ls'
alias tms='tmux new -s' # 名前をつけて新規セッション開始
alias tmr='tmux a -t' # 名前を指定してアタッチ

# git completionの設定
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)

# 保管機能を有効にして、実行する
autoload -Uz compinit && compinit
