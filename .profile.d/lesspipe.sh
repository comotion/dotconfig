#!/bin/sh

if command -v src-hilite-lesspipe.sh > /dev/null; then
	export LESSOPEN="| $(command -v src-hilite-lesspipe.sh) %s"
	export LESS=' -R '
fi
