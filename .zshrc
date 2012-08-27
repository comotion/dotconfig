# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Give me randomness :)
THEMES=(edvardm wezm+ sunaku gozilla jnrowe fishy theunraveler lukerandall)
ZSH_THEME=$THEMES[$RANDOM%$#THEMES+1]

CASE_SENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.profile.d/term.sh
source ~/.profile.d/java.sh
source ~/.profile.d/lesspipe.sh

export PATH=~/bin:$PATH
export EDITOR="vim"

