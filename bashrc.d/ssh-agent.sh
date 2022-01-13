# Create a dotfile contains $SSH_AUTH_SOCK and $SSH_AGENT_PID
dot_ssh_agent=~/.ssh-agent.$HOSTNAME
if [ -f $dot_ssh_agent ]; then
	. $dot_ssh_agent > /dev/null
fi
if [ -n "$SSH_AUTH_SOCK" -a ! -S $SSH_AUTH_SOCK ]; then
    kill $SSH_AGENT_PID
    unset SSH_AGENT_PID
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID >& /dev/null; then
	ssh-agent > $dot_ssh_agent
	. $dot_ssh_agent > /dev/null
fi
unset -f dot_ssh_agent

# Kill all other ssh-agent than current one
zombie_ssh_agents="$(ps -u $USER -o pid,comm | grep -w [s]sh-agent | awk '{print $1}' | grep -vw $SSH_AGENT_PID)"
[ -n "$zombie_ssh_agents" ] && kill $zombie_ssh_agents
unset -f zombie_ssh_agents

load_ssh_keys()
{
	local loaded_keys=$(ssh-add -l | awk '{print $3}') loaded_key private_keys private_key found

	for private_key in $(ls ~/.ssh/id_* 2>/dev/null | grep -v '\.pub$'); do
		if [ -f $private_key -a ! -L $private_key ]; then
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
