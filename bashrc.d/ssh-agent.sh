if [ -f ~/.ssh-agent ]; then
	. ~/.ssh-agent > /dev/null
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID >& /dev/null; then
	ssh-agent > ~/.ssh-agent
	. ~/.ssh-agent > /dev/null
fi

load_ssh_keys()
{
	local loaded_keys=$(ssh-add -l | awk '{print $3}') loaded_key private_keys private_key found

	for private_key in $(ls ~/.ssh/id_* | grep -v '\.pub$'); do
		if [ -f $private_key ]; then
			found=0
			for loaded_key in $loaded_keys; do
				[ $loaded_key = $private_key ] && found=1
			done
			[ $found -eq 1 ] || private_keys="$private_keys $private_key"
		fi
	done

	[ -z "$private_keys" ] || ssh-add $private_keys
}

load_ssh_keys
unset -f load_ssh_keys
