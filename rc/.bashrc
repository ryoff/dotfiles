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
#alias elog="sudo tail -f /var/log/apache2/error.log | perl -pe '\$r=int(rand(7));s/\[error\]|DBIx::Class::ResultSet|SELECT|FROM|WHERE|UPDATE|INSERT|DELETE|GROUP|ORDER|VAR/\e\[1;3\${r}m$&\e\[0m/g'"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#---
   num=31
   PROMPT_COMMAND='num=`expr 31 + $((num - 30)) % 7`;'
   PS1='\[\ek\e\\\[\e[1;${num}m\]\][\u@\h \w]\[\e[0m\]\$ '
#---

export EDITOR='vi'
export SVN_EDITOR='vi'
