# start x session &essentials
eval "$(gpg-agent --enable-ssh-support --daemon) --write-env-file ${HOME}/.gpg-agent-info"
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
export VDPAU_DRIVER=va_gl

xset r rate 200 50
xset b 0
xcompmgr &
tabbed -c urxvt -sl 600 -bw 0 -bg black -fg green -cr darkgreen  -fn "9x15bold,xft:Bitstream Vera Sans Mono" -embed &

setxkbmap -option compose:caps us
stalonetray -t --sticky &
#pypanel &
redshift-gtk &
gzbatt &
sbxkb &
dunst &

syndaemon -i 1.0 -d -K -R

(sleep 1 && hsetroot -fill ~/cat.jpg ) &
openbox-session
