# .bashrc

# User specific aliases and functions
alias cp='cp -i'
alias grep='grep -n --color'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'
alias la='ls -al'
alias mv='mv -i'
alias rm='rm -i'
alias s='screen'
alias sl='screen -ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias finder='find ./ -type f -name '\''*.*'\'' | xargs grep -n --color '
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#---
   num=31
   PROMPT_COMMAND='num=`expr 31 + $((num - 30)) % 7`;'
   PS1='\[\ek\e\\\[\e[1;${num}m\]\][\u@\h \W]\[\e[0m\]\$'
#---

