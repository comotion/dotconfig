foreach() {
	cmd=$1; shift
	for i in $@; do $cmd $i || echo "Error executing: $cmd $i"; done
}

foreach source ~/.profile.d/*.sh

export PATH=~/bin:$PATH:~/.gem/ruby/1.9.1/bin:~/.rvm/bin
export EDITOR=vim
export ENV=dev

# http://paulgraham.com/todo.html
echo "Don't ignore your dreams; don't work too much; say what you think; \
cultivate friendships; be happy."

eval $(keychain --eval -Q --quiet)
. $(kerl list installations | sort | awk 'END{print $NF}')/activate
