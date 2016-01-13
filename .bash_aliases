#!/bin/sh
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b | sed 's/di=01;34/di=01;35/'`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias gi='grep -rIin'
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -CF'
    alias less='less -FRX'
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias .....="cd ../../../.."
    alias ......="cd ../../../../.."
    alias .......="cd ../../../../../.."
    alias ........="cd ../../../../../../.."
    alias .........="cd ../../../../../../../.."
    alias ..........="cd ../../../../../../../../.."
    alias ...........="cd ../../../../../../../../../.."
    alias ............="cd ../../../../../../../../../../.."

fi

# some more ls aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
alias finn='set -f; do_finn'
do_finn() {
    name="$1"; shift;
    if echo "$name" | grep '^[a-zA-Z0-9_.-]*$' >/dev/null
    then
        name="*$name*"
    fi
    case $1 in
        [a-zA-Z]*)
            nosvn -name "$name" -print0 | xargs -0 "$@"
            ;;
        *)
            nosvn -name "$name" "$@" -print
            ;;
    esac
    set +f
}
nosvn() {
    find . \( -type d -name '.svn' -prune \) -o \( "$@" \)
}

p(){
  ps -eALo pid,spid,user,priority,ni,pcpu,vsize,time,args | grep --color=always $@
}

d(){
   dig -x $*
}

f(){                                                                            
   find -iname \*$*\*
}
g(){
    grep --color -rIin "$*" *
}
eg(){
    egrep --color -rIin "$*"
}
cdd(){
    cd `dirname "$*"`
}

rsym(){
    if [ -z "$1" ]
        then
        echo "Test linkage of one or more libs. But you gotta tell me which lib.+++ "
        return
    fi
    #_tmpfile=`tempfile -p rsym_`
	_tmpfile=/tmp/rsym_blah
    _ldflags="-L/usr/local/lib -L."
    if [ -n "$LD_LIBRARY_PATH" ]
        then
        _ldflags="-L$LD_LIBRARY_PATH $_ldflags"
    fi
    #_dummyf=`tempfile -p rsym_ -s .c`
	_dummyf=/tmp/rsym_blah.c
    cat > $_dummyf << 'EOF'
#include <stdio.h>
main(){
    printf("Dummy!\n");                                                         
}
EOF

   for lib in $@
    do
        _ldflags="$_ldflags -l$lib"
        gcc $_dummyf $_ldflags -o $_tmpfile
    done
    #rm -f $_tmpfile $_dummyf
}

fsym(){
    if [ -z "$1" ]                                                              
        then
        echo "Hunt for a symbol. What symbol, sire?"
        return
    fi
    files=`find $2 -name '*.o' -or -name '*.so'`
    for i in $files
        do
        if nm $i | grep $1
            then
            echo "found in $i"
        fi
    done
}


rd () {
   if [ -z "$1" ]
       then
       echo "Hunt for an IP. Which one, sire?"
       return
    fi
    for ip in $@
    do
        dig -x $ip | grep PTR | grep -v '^;'
    done
}
