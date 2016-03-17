#!/bin/bash

# enable color support of ls and also add handy aliases
if which dircolors >& /dev/null; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

grep_options='--color=auto --exclude-dir=.git --exclude-dir=.svn'
for grep_command in grep fgrep egrep; do
    if which $grep_command >& /dev/null; then
        alias $grep_command="$grep_command $grep_options"
    fi
done
unset grep_options
unset grep_command

if which less >& /dev/null; then
    alias less='less -qR'
fi

mkcd() {
    mkdir -p $1
    cd $1
}

if [ -d ~/.bash_aliases.d ]; then
	# Load platform dependent script.
	if [ -d ~/.bash_aliases.d/$(uname) ]; then
		. ~/.bash_aliases.d/$(uname)
	fi

	# Load custom scripts.
	for script in $(ls ~/.bash_aliases.d/*.sh 2>/dev/null); do
		. $script
	done
	unset script
fi
