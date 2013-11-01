YELLOW="\[\e[1;33m\]"
GREEN="\[\e[1;32m\]"
BLUE="\[\e[1;34m\]"
RED="\[\e[1;31m\]"
WHITE="\[\e[1;37m\]"
GREY="\[\e[37m\]"
ENDCOLOR="\[\e[0m\]"

#__git_ps1() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}

#PS1="${WHITE}\u@\h: ${BLUE}\w${ENDCOLOR} ${GREY}\$(__git_ps1)${ENDCOLOR} \$ "

if [[ ${EUID} == 0 ]] ; then
	export PS1='\[\033[01;34m\] W \[\033[37m\]'$(__git_ps1) '$\[\033[00m\] '
#	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \[\033[37m\]'$(__git_ps1) '$\[\033[00m\] '
else
	export PS1='\[\033[01;34m\] \w \[\e[0;37m\]'$(__git_ps1)' \$\[\033[00m\] '
#	PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\e[0;37m\]'$(__git_ps1)' \$\[\033[00m\] '
fi
