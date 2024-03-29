export EDITOR=vi
export PAGER=less
export LESSHISTFILE=-

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='[%~]%# '
RPROMPT='[%?]'

autoload -Uz compinit && compinit
autoload -Uz colors && colors

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt interactive_comments

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias q='exit'
alias -g L='| less'
alias -g G='| grep'
alias fzf='fzf --ansi'

bindkey -e

if type fzf > /dev/null 2>&1; then
    function select-history() {
        BUFFER=$(history -n -r 1 | fzf +s +m -q "$LBUFFER")
        CURSOR=$#BUFFER
    }
    zle -N select-history
    bindkey '^r' select-history
fi

() { [ $1 -nt $1.zwc ] && zcompile $1 } ${(%):-%N}
