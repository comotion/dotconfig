# Path to your oh-my-zsh configuration.
export DISABLE_AUTO_UPDATE=true
ZSH=$HOME/.oh-my-zsh

# Give me randomness :)
THEMES=(edvardm wezm+ sunaku gozilla jnrowe fishy theunraveler lukerandall)
ZSH_THEME=$THEMES[$RANDOM%$#THEMES+1]

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git archlinux cabal)
export EDITOR=vim

source $ZSH/oh-my-zsh.sh

source ~/.profile.d/{term,java,lesspipe,erlang}.sh

# http://paulgraham.com/todo.html
echo "Remember your dreams; work less; say what you think; \
cultivate friendships; be happy."

setopt AUTO_PUSHD

#envoy -t ssh-agent
#source <(envoy -p)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:~/bin

alias fuck='eval $(thefuck $(fc -ln -1))'
# You can use whatever you want as an alias, like for Mondays:
alias FUCK='fuck'

pw_() {
	gpg --decrypt -o - ~/src/pw_.gpg | grep $1
}

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

RPROMPT='[%D{%H:%M}]'
p="$PROMPT"
PROMPT="$(zbatc)$(zbatt) $p" 

## run TRAPALRM every $TMOUT seconds
TMOUT=60 # refresh the terminal prompt every 60 seconds

TRAPALRM () {
    zle reset-prompt # refreshs the terminal prompt
}
#trap dothetrap ALRM

# fix broken zsh keybinds
bindkey \^U backward-kill-line
