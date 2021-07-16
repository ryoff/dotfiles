# 日本語を使用
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors && colors
# ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups

# コマンドのスペルミスを指摘
setopt correct

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

# git prompt
source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX=" ]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
#RPROMPT='$(git_super_status)'

# prompt
num=0
precmd() { eval myprompt; }
myprompt() {
  # 1~7を順番にセットする。0はblackなので見えないので除く
  num=`expr 1 + $((num)) % 7`;
  PROMPT="%F{$num}[%m@%n][%~]%f $(git_super_status) $ "
}

# direnv
eval "$(direnv hook zsh)"

# rbenv
export RBENV_ROOT=$(brew --prefix rbenv) 
export PATH=$RBENV_ROOT/bin:$PATH
eval "$(rbenv init - zsh)"
export OPENSSL_ROOT=$(brew --prefix openssl)
export PATH="$OPENSSL_ROOT/bin:$PATH"
export LDFLAGS="-L$OPENSSL_ROOT/lib"
export CPPFLAGS="-I$OPENSSL_ROOT/include"
export PKG_CONFIG_PATH="$OPENSSL_ROOT/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_ROOT"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
