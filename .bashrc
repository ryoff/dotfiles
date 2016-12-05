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
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias finder='find ./ -type f -name '\''*.*'\'' | xargs grep -n --color '
alias ag='ag -S'
alias diff="colordiff --side-by-side --suppress-common-lines"

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
PS1='\[\e[1;${num}m\]\][\u@\h \w] $(__git_ps1)\[\e[0m\$'

export EDITOR='/usr/bin/vim'
export SVN_EDITOR='vi'
export TERM=xterm-256color
# コマンド履歴
# ignoredups: 続けて入力しても1つだけ
# ignorespace: 先頭にスペースを入れると履歴に残さない
# ignoreboth: ignoredups+ignorespaceの同時設定
# erasedups: 重複するコマンドを残さない
export HISTCONTROL=ignoreboth
export HISTSIZE=10000

# lessの設定
# -g  検索したとき、ヒットした全ての文字列を反転するのではなく、現在カーソルがある行のみ反転する。
# -i  検索時に全部小文字で入力したときだけ、大文字小文字を無視する。
# -M  詳しいプロンプトを表示する。
# -R  ANSI カラーエスケープシーケンスを解するようになる。
# -S  一行が長く、ターミナルの幅が狭くて表示できない場合、途中までしか表示しない。
# -W  一度に2行以上移動した場合、新たに表示した最初の行をハイライトする。
# -z-4  ウィンドウのサイズをターミナルのサイズ - 4 に設定する。
# -x4 タブを 4 つのスペースで表現する。
#
# ※一度開いた上で、折り返しを解除した場合などは、 `-S` `+S` でoptionの動的on/offが可能
export LESS='-g -i -M -R -S -W -z-4 -x4'

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
# リストをfull_path表示にする
export ENHANCD_DOT_SHOW_FULLPATH=1
# インタラクティブツールの優先度を変える
export ENHANCD_FILTER='peco:percol:gof:pick:icepick:sentaku:selecta:fzy:fzf-tmux:fzf'
if [ -f "${HOME}/.enhancd/init.sh" ]; then
  source "${HOME}/.enhancd/init.sh"
fi

# fzfを読み込む
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# command history でpecoを使用する
# http://qiita.com/yungsang/items/09890a06d204bf398eea
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi

  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

  if [ -n "$CMD" ] ; then
    # Replace the last entry, "peco-history", with $CMD
    history -s $CMD

    if type osascript > /dev/null 2>&1 ; then
      # Send UP keystroke to console
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    # echo $CMD >&2
    # eval $CMD
  else
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}
bind '"\C-r":"peco-history\n"'

# pkgconfigの場所を指定
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
