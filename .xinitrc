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
xscreensaver -no-splash &
/usr/lib/notification-daemon-1.0/notification-daemon &

xrdb -merge ~/.Xresources
urxvtd -q -f -o
xmonad &
xrandr-auto; ~/.fehbg
xcompmgr -cCfF -r7 -o.35 -l-10 -t-8 -D7 &
setxkbmap -option compose:caps
exec xfce4-session --disable-tcp
