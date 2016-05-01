#!/usr/bin/env bash
# .bash_profile
# ======================================================================
# Run on login.
# Called by [/private]/etc/{profile,bashrc}
# ----------------------------------------------------------------------
# NOTE 
# aliases   => $HOME/.local/etc/profile.d/aliases.sh
# functions => $HOME/.local/etc/profile.d/functions.sh
# run conf  => $HOME/.bashrc
# ----------------------------------------------------------------------
# PURPOSE
#   Set local environment for user.
#   Set history options, set dirs, and source necessary supplements.
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ======================================================================

export SOURCED_PROFILE=1
if [[ -f "${HOME}/.bashrc" ]] && [[ $SOURCED_RC -eq 0 ]]; then
    builtin source "${HOME}/.bashrc" 
    export SOURCED_RC=1
fi

export EDITOR=vim
export HISTSIZE=50000
export HISTFILESIZE=$(( $HISTSIZE * 25 ))
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export CLICOLOR=1
#export GREP_OPTIONS='--color=auto'
export GREP_COLOR='01;20'
shopt -s extglob histappend 
if [[ ${BASH_VERSION} =~ ^[0-3] ]]; then
  :
else
  shopt -s autocd
fi

# This runs ~/.pythonrc everytime python is run interactively
#   (unless -i is passed with a script).
export PYTHONSTARTUP="${HOME}/.pythonrc"

# For forward search with readline -- Stops terminal from stopping 
# when C-s is pressed.
[[ $- == *i* ]] && stty -ixon || :

# For using vim as manpager: (be sure to put let $PAGER='' in .vimrc)
# export PAGER="/bin/sh -c \"unset PAGER; col -b -x | \
#                       vim -R -c 'set ft=man nomod nolist' -\""

# For less
export LESS_TERMCAP_mb=$'\e[01;38;05;072m' # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;05;066m' # begin bold
export LESS_TERMCAP_me=$'\e[0m'            # end mode
export LESS_TERMCAP_se=$'\e[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\e[00;38;05;246m' # begin standout-mode-infobox
export LESS_TERMCAP_ue=$'\e[0m'            # end underline
export LESS_TERMCAP_us=$'\e[04;38;05;073m' # begin underline

# Setting colors for file types with gnu-dircolors
if [[ $TERM != "dumb" ]] && [[ -e ~/.dircolors ]]; then
  if [[ "$(uname -s)" == "Darwin" ]]; then
    export LS_OPTIONS='--color=auto'
    command -v gdircolors &> /dev/null && 
      eval $(gdircolors -b ~/.dircolors) || :
  else
    eval $(dircolors -b ~/.dircolors)
  fi
fi
