PATH=$PATH:~/bin

# http://paulgraham.com/todo.html
echo "Don't ignore your dreams; don't work too much; say what you think; \
cultivate friendships; be happy."

for file in $(find ~/.profile.d -type f -name '*.sh')
do
    . $file
done

export EDITOR=vim
