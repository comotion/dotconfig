source ~/.profile.d/{term,java,lesspipe,erlang}.sh

export PATH=~/bin:$PATH:~/.gem/ruby/1.9.1/bin:~/.rvm/bin
export EDITOR="vim"
export ENV=dev

eval $(keychain --eval -Q --quiet)

. $(kerl list installations | sort | awk 'END{print $NF}')/activate
