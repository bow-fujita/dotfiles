#!/bin/bash

# enable color support of ls and also add handy aliases
if which dircolors >& /dev/null; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

case "$(uname)" in
	Linux)
	alias ls='ls --color=auto'
	;;

	Darwin|FreeBSD)
	alias ls='ls -G'
	;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

VI=$(which vi 2> /dev/null)
VIM=$(which vim 2> /dev/null)
if [ -n "$VIM" ]; then
	[ "$(realpath $VIM)" = "$(realpath $VI)" ] || alias vi=vim
fi
unset VI VIM
