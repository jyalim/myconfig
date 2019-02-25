#!/usr/bin/env bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    builtin source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    builtin source /etc/bash_completion
  fi
  if [ -d /etc/bash_completion.d ]; then
    for f in /etc/bash_completion.d/*.sh; do
      builtin source "$f"
    done
  fi
fi

## git fancy log
## git tags
## git status -sb
config_personal() {
  git config --global alias.lg "log --color --graph
    --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)
    %C(bold blue)<%an>%Creset' --abbrev-commit --"

  git config --global alias.tags 'tag -l'

  git config --global alias.st 'status -sb'
}
