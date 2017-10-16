#!/bin/bash

# Load the default script.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Load alias definitions.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Extend PATH.
for path in $HOME/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin; do
    if [ -d $path ]; then
        if ! echo $PATH | sed 's/:/\n/g' | egrep -q ^$path/?$; then
            PATH=$path:$PATH
        fi
    fi
done
unset path
export PATH


# Enable vim key bindings.
set -o vi
export EDITOR=vi
export PAGER=less

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set propmt
PS1='[\u@\h \W]\$ '

# Load custom scripts.
if [ -d ~/.bashrc.d ]; then
	for script in $(ls ~/.bashrc.d/*.sh 2> /dev/null); do
		. $script
	done
	unset script
fi
