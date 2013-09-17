if ! which rvm >& /dev/null; then
	if [ -f /etc/profile.d/rvm.sh ]; then
		. /etc/profile.d/rvm.sh
	elif [ -f ~/.rvm/scripts/rvm ]; then
		. ~/.rvm/scripts/rvm
	fi
fi
