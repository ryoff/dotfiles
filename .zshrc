# 日本語を使用
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors && colors

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# alias
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ll='ls -lGF'
alias la='ls -alGF'
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

# prompt
PROMPT="[%m@%n][%~]$ "

# git prompt(右側prompt)
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX=" ]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
RPROMPT='$(git_super_status)'

# rbenv installにて表示されたコマンド
# For compilers to find readline you may need to set:
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

# For pkg-config to find readline you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# ==> ruby-build
# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
#
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your ~/.zshrc:
#   export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
#
# Note: this may interfere with building old versions of Ruby (e.g <2.4) that use
# OpenSSL <1.1.
