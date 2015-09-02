# .bashrc

# User specific aliases and functions
alias cp='cp -i'
alias grep='grep --color'
alias ll='ls -l'
alias la='ls -al'
alias mv='mv -i'
alias rm='rm -i'
#alias s='screen'
#alias sl='screen -ls'
alias tm='tmux'
alias tml='tmux ls'
alias tms='tmux new -s' # 名前をつけて新規セッション開始
alias tmr='tmux a -t' # 名前を指定してアタッチ
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias finder='find ./ -type f -name '\''*.*'\'' | xargs grep -n --color '
alias ag='ag -S'
alias diff="colordiff --side-by-side --suppress-common-lines"
alias less='less -R'
#alias elog="sudo tail -f /var/log/apache2/error.log | perl -pe '\$r=int(rand(7));s/\[error\]|DBIx::Class::ResultSet|SELECT|FROM|WHERE|UPDATE|INSERT|DELETE|GROUP|ORDER|VAR/\e\[1;3\${r}m$&\e\[0m/g'"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# git
source ~/.git-prompt.sh
source ~/.git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

#--- ステータスバー
num=31
PROMPT_COMMAND='num=`expr 31 + $((num - 30)) % 7`;'
PS1='\[\e[1;${num}m\]\][\u@\h \w] $(__git_ps1)\[\e[0m\$ '

export EDITOR='/usr/bin/vim'
export SVN_EDITOR='vi'
export TERM=xterm-256color
export HISTCONTROL=ignoredups
export HISTSIZE=10000

# 個々の環境のbash設定を読み込む
if [ -e "${HOME}/.bashrc_local" ]; then
  source "${HOME}/.bashrc_local"
fi

# ag -S hoge | peco した結果をさらにvimで開く
agvim () {
  vim $(ag "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# direnv
eval "$(direnv hook bash)"
# enhancd
if [ -f "${HOME}/.enhancd/bash/enhancd.bash" ]; then
    source "${HOME}/.enhancd/bash/enhancd.bash"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
