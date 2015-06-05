#!/usr/bin/env bash
# ----------------------------------------------------------------------
# ${HOME}/.bashrc
#   Environment Function Runtime Configuration File
# Sources the proper directories, sets the prompt, and sets the path.
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ======================================================================

# ======================================================================
# Prevent recursive sourcing
export SOURCED_RC=1

# ======================================================================
# Vital to multi file sourcing
sourcing() {
  local bashp_path="${HOME}/.bash_profile"
  local gitcomp_path="${HOME}/.git-completion"
  local prof_path="${HOME}/.local/etc/profile.d"
  local source_paths=( $prof_path $gitcomp_path )
  case "$(uname -s)" in
    "Darwin" ) 
      if [[ -n $(type -t brew) ]]; then
        local BREW_PREFIX=$( brew --prefix ); 
        local BREW_BASHCOMP_PATH="${BREW_PREFIX}/etc/bash_completion"; 
        source_paths+=( $BREW_BASHCOMP_PATH ) 
     fi
    ;;
    * | : | ? ) : ;;
  esac
  if [[ $SOURCED_PROFILE -eq 0 ]]; then 
    export SOURCED_PROFILE=1 
    [[ -f $bashp_path ]] && builtin source $bashp_path || :
  fi
  for source_path in ${source_paths[@]}; do
    if [[ -f $source_path ]]; then # If the path is a regular file
      builtin source $source_path
    elif [[ -d $source_path ]]; then # If the path is a directory
      for source_files in $(ls -A $source_path/*.sh); do
        builtin source $source_files 
      done
    fi
  done
}

# Always need to resource aliases/functions etc
sourcing
# ======================================================================
# To have env use pre-sourced path, simply uncomment the following:
#reset_path
# Prevent redundant Paths
[[ $SOURCED_PATHS -ne 1 ]] && set_path || :
export SOURCED_PATHS=1

# ======================================================================
# Create Prompt
set_prompt

# ======================================================================
# Possibly: http://alias.sh/filesystem-markers-jump
