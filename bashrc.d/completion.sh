if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  if which brew >& /dev/null; then
    if [ -r $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
      . $(brew --prefix)/etc/profile.d/bash_completion.sh
    fi
  fi
fi
