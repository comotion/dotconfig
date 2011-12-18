PATH=$PATH:~/bin

mesg n

for file in $(find ~/.profile.d -type f -name '*.sh')
do
    . $file
done

export EDITOR=vim
