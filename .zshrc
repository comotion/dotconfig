# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Give me randomness :)
THEMES=(edvardm wezm+ sunaku gozilla jnrowe fishy theunraveler lukerandall)
ZSH_THEME=$THEMES[$RANDOM%$#THEMES+1]

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# http://paulgraham.com/todo.html
echo "Don't ignore your dreams; don't work too much; say what you think; \
cultivate friendships; be happy."

setopt AUTO_PUSHD
