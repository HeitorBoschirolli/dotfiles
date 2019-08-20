# ${EUID} identifica o tipo de usuario:
#    se for 0 eh o root, caso contrario, eh um usuario comum
# \[\033[x;xxm]] indica uma cor
# \w eh substituido pelo nome do diretorio atual
# \$ eh substituido por $ caso o usuario seja normal ou por # caso seja root
# \u eh substituido pelo nome do usuario

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

alias gcc='gcc -ansi -pedantic -Wall -Werror -lm'
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

# gobots aliases
alias gobots-env='python ~/data/desktop-assistant/main.py <<< gobots'

# quando usamos "seta para cima" para visualizar o historico de
# comandos, essa especificacao faz com que comandos iguais sejam
# ignorados

HISTCONTROL=ignoreboth
export HISTCONTROL

# set vim as the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# necessary to lightline vim plugin to work correctly in tmux sessions
export TERM=xterm-256color

# export PATH="/home/heitor/anaconda3/bin:$PATH"  # commented out by conda initialize

export NVM_DIR="/home/heitor/.nvm"
source "/home/heitor/.nvm/nvm.sh"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/heitor/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/heitor/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/heitor/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/heitor/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
