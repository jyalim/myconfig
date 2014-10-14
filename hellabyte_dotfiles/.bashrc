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
    "Darwin" ) command -v brew &> /dev/null && \
      local BREW_PREFIX=$( brew --prefix ); \
      local BREW_BASHCOMP_PATH="${BREW_PREFIX}/etc/bash_completion"; \
      source_paths+=( $BREW_BASHCOMP_PATH ) || :
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
      for source_files in $(find $source_path -type f -print); do
        builtin source $source_files # TODO only source .sh
      done
    fi
  done
}

# Always need to resource aliases/functions etc
sourcing
# ======================================================================
# Prevent redundant paths
[[ $SOURCED_PATHS -ne 1 ]] && op_set || :
export SOURCED_PATHS=1

# ======================================================================
# Create Prompt
my_prompt

# ======================================================================
# Possibly: http://alias.sh/filesystem-markers-jump

# BEGIN QUICK-CD FUNCTIONS
# DO NOT DELETE ABOVE COMMENT
[[ -f "${HOME}/.quick-cd/.backups/.supporting_rc.bash" ]] && \
    builtin source "${HOME}/.quick-cd/.backups/.supporting_rc.bash" || :
# DO NOT DELETE BELOW COMMENT
# END QUICK-CD FUNCTIONS
