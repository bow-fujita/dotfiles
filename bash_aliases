#!/bin/bash

# enable color support of ls and also add handy aliases
if which dircolors >& /dev/null; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=.svn'
alias fgrep='fgrep --color=auto --exclude-dir=.git --exclude-dir=.svn'
alias egrep='egrep --color=auto --exclude-dir=.git --exclude-dir=.svn'

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
