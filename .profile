#!/bin/sh

export EDITOR=vim

eval $(keychain --eval -Q --quiet 2> /dev/null) 2> /dev/null
#source /usr/local/rvm/scripts/rvm
export LC_NUMERIC="POSIX"
export DOCKER_HOST=tcp://192.168.59.103:2375

