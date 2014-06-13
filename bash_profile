#!/bin/bash

# Load the default script.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Load alias definitions.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

for path in /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin $HOME/bin; do
	if ! echo $PATH | sed 's/:/\n/g' | egrep -q ^$path/?$; then
		PATH=$PATH:$path
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
	for rc in ~/.bashrc.d/*.sh; do
		. $rc
	done
	unset rc
fi
