# function that prints the name of the current Git branch in round brackets.
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='\[\033[0;36m\]\W\[\033[0;35m\]$(git_branch)\[\033[0;00m\]: '
fi

# ignore duplicates from fzf command history
export HISTCONTROL=ignoreboth:erasedups

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lh="ls -lh"
alias ltr="ls -ltr"
alias cd..='cd ..'
alias mkdir='mkdir -p'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -ai'
alias .='pwd'
alias grep='grep --color=auto'
alias df='df -H'
alias du='du -h'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
export HISTCONTROL

# set vim as the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# necessary to lightline vim plugin to work correctly in tmux sessions
export TERM=xterm-256color

# Node Version Manager (NVM) stuff
export NVM_DIR="/home/heitor/.nvm"
source "/home/heitor/.nvm/nvm.sh"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
