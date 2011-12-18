YELLOW="\[\e[1;33m\]"
GREEN="\[\e[1;32m\]"
BLUE="\[\e[1;34m\]"
RED="\[\e[1;31m\]"
WHITE="\[\e[1;37m\]"
GREY="\[\e[37m\]"
ENDCOLOR="\[\e[0m\]"

__git_ps1() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="${WHITE}\u@\h: ${BLUE}\w${ENDCOLOR} ${GREY}\$(__git_ps1)${ENDCOLOR} \$ "

