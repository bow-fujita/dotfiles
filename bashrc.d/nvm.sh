if ! nvm ls >& /dev/null; then
	for nvm_dir in ~/.nvm /usr/local/nvm; do
		if [ -f $nvm_dir/nvm.sh ]; then
			. $nvm_dir/nvm.sh
			break
		fi
	done
	unset nvm_dir
fi

if nvm ls >& /dev/null; then
	for nvm_default in ~/.nvm-default /etc/default/nvm-default; do
		node_version="$(cat $nvm_default 2> /dev/null)"
		if [ -n "$node_version" ]; then
			nvm use $node_version
		fi
	done
	unset nvm_default node_version
fi

if [ -f ~/.npm_completion ]; then
	. ~/.npm_completion
fi
