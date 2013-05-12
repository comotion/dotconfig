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
source ~/.profile.d/tmux.sh
source ~/.profile.d/erlang.sh

export PATH=~/bin:$PATH:~/.gem/ruby/1.9.1/bin
export EDITOR="vim"
export ENV=dev

# http://paulgraham.com/todo.html
echo "Don't ignore your dreams; don't work too much; say what you think; \
cultivate friendships; be happy."

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
