# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

THEMES=(edvardm sunaku gozilla ezm+ jnrowe fishy theunraveler lukerandall)
ZSH_THEME=$THEMES[$RANDOM%$#THEMES+1]

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/olavf/bin:usr/lib/mit/bin
export DEVSTORAGE=/mnt/storage/
export DEVSOURCE=${DEVSTORAGE}src/
export BUILDSTORAGE=${DEVSTORAGE}builds/
export PATH=$PATH:${DEVSOURCE}share/bin

