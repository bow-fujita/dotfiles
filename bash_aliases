#!/bin/bash

# enable color support of ls and also add handy aliases
if which dircolors >& /dev/null; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "$(uname)" = 'Darwin' ]; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
