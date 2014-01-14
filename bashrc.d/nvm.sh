if ! nvm ls >& /dev/null; then
	if [ -f ~/.nvm/nvm.sh ]; then
		. ~/.nvm/nvm.sh
	fi
fi

if nvm ls >& /dev/null; then
	nvm_default="`cat ~/.nvm-default 2> /dev/null`"
	if [ -n "$nvm_default" ]; then
		nvm alias default $nvm_default
	fi
	unset nvm_default
fi

if [ -f ~/.npm_completion ]; then
	. ~/.npm_completion
fi
