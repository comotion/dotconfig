export DEVSTORAGE=/mnt/storage/
export DEVSOURCE=${DEVSTORAGE}src/
export BUILDSTORAGE=${DEVSTORAGE}builds/
PATH=$PATH:${DEVSOURCE}share/bin
for application in $(find ${DEVSTORAGE}applications -maxdepth 2 -mindepth 2 -name 'bin'); do PATH=$PATH:${application}; done

#if [ "$BASH" ]; then
#  if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#  fi
#fi

mesg n

# Give me colors!
if [ -e /usr/share/terminfo/x/xterm-256color ]
then
	export TERM="xterm-256color"
else
	export TERM="xterm-color"
fi

for file in `ls ${DEVSOURCE}/share/profile.d/*.sh`
do
    source $file
done


