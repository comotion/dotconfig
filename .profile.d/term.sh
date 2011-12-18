# Give me colors!
if [ -e /usr/share/terminfo/r/rxvt-unicode-256color ]
then
	export TERM="rxvt-unicode-256color"
elif [ -e /usr/share/terminfo/r/rxvt-unicode ]
then
	export TERM="rxvt-unicode"
elif [ -e /usr/share/terminfo/x/xterm-256color ]
then
	export TERM="xterm-256color"
else
	export TERM="xterm-color"
fi
