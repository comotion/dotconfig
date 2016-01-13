#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
PATH=~/bin:${PATH}
export LANG=en_GB.UTF-8
alias c=chromium
alias chro=chromium

/usr/lib/notification-daemon-1.0/notification-daemon &

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xmonad &
#xrandr-auto; ~/.fehbg
setxkbmap -option compose:caps
compton -cCGfb &
bin/cyclewallpaper ~/Downloads/wallpapers &
urxvtc &

#exec openbox
gnome-keyring-daemon
exec xfce4-session --disable-tcp
