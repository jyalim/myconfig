#!/usr/bin/env bash

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
