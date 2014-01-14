if ! rvm -v >& /dev/null; then
	if [ -f /etc/profile.d/rvm.sh ]; then
		. /etc/profile.d/rvm.sh
	elif [ -f ~/.rvm/scripts/rvm ]; then
		. ~/.rvm/scripts/rvm
	fi
fi

if rvm -v >& /dev/null; then
	rvm_default="`cat ~/.rvm-default 2> /dev/null`"
	if [ -n "$rvm_default" ]; then
		rvm --default use $rvm_default
	fi
	unset rvm_default
fi
