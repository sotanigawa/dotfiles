if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

export LESSHISTFILE=-
export EDITOR=vi
export PAGER=less
export GOPATH=$HOME/.go
path=($HOME/bin(N-/) $HOME/.local/bin(N-/) $path)

autoload -Uz compinit
compinit -d ~/.zcompdump
autoload -Uz colors
colors

bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='[%~]%# '
RPROMPT='[%?]'

setopt auto_cd
setopt auto_pushd
setopt share_history
setopt interactive_comments
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt pushd_ignore_dups

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
alias -g L="| less"
alias -g G='| grep'
alias xcopy='xclip -selection clipboard'

# Using fzf to search history
if type fzf > /dev/null 2>&1; then
    alias fzf='fzf --ansi'
    function select-history() {
        BUFFER=$(history -n -r 1 |\
                     fzf --no-sort +m\
                         --query "$LBUFFER"\
                         --prompt="History > ")
        CURSOR=$#BUFFER
    }
    zle -N select-history
    bindkey '^r' select-history
fi

if [ -d ~/.zsh/pure ]; then
    fpath+=$HOME/.zsh/pure
    autoload -U promptinit; promptinit
    prompt pure
fi
