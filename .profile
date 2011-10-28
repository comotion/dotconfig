PATH=$PATH:~/bin

mesg n

# Give me colors!
if [ -e /usr/share/terminfo/x/xterm-256color ]
then
	export TERM="xterm-256color"
else
	export TERM="xterm-color"
fi

for file in $(find .profile.d -type f -name '*.sh')
do
    . $file
done


