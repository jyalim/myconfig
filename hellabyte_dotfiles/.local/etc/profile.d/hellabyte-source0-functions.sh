#!/usr/bin/env bash
# ----------------------------------------------------------------------
# ${HOME}/.local/etc/profile.d/functions.sh
#   Contains all of the bash functions that will need to be sourced.
#   Environment Function Runtime Configuration
# ----------------------------------------------------------------------
# Initializations of the env using these functions are at the end of
# this file.
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ======================================================================

# Use awk magic (associative arrays) to remove duplicate paths while
# preserving order
awk_magic() {
  local input=${1:-''}
  echo $(awk -v RS=":" '!a[$0]++' <<< "${input}" | tr -s '\n' ':')
}

# General which command (runs on Darwin {bsd} and Linux). Replicates the
# -s flag from bsd which, runs silent, returns 0 or 1 if program found
# or not. 
swhich() {
  local check=${1:-''}
  local value=2
  [[ -z $check ]] && {
    echo 'No command provided'
    return $value
  } || :
  command -v $check &>/dev/null && value=0 || value=1
  return $value
}


# Sets the path for the environment. Should only be run once.
# Allows for smooth and consistent executing, paging, and linking
# across heterogeneous systems.
set_path() {
  # Define general array of exe paths ${exe_paths[@]}
  #                         man paths ${man_paths[@]}
  #                         lib paths ${lib_paths[@]}
  #                         inc paths ${inc_paths[@]}
  local exe_paths=(
    "${HOME}/.local/opt/mamba/bin"
    "${HOME}/.local/opt/conda/bin"
    "${HOME}/.local/bin" 
    "${HOME}/.local/sbin" 
    "${HOME}/.local/usr/bin" 
    "${HOME}/.local/usr/sbin" 
    "/opt/homebrew/bin" 
    "/opt/homebrew/opt/util-linux/bin" 
    "/opt/homebrew/opt/util-linux/sbin" 
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/usr/sbin"
    "/bin"
    "/sbin"
    "/usr/texbin"
    "/opt/X11/bin"
    "/usr/bin/X11"
    "/usr/games"
  )
  local man_paths=( 
    "${HOME}/.local/share/man" 
    "${HOME}/.local/man" 
    "${HOME}/.local/opt/mamba/share/man" 
    "${HOME}/.local/opt/mamba/man" 
    "${HOME}/.local/opt/conda/share/man" 
    "${HOME}/.local/opt/conda/man" 
    "/opt/homebrew/opt/util-linux/share/man" 
  )
  local lib_paths=( 
    "${HOME}/.local/lib" 
  )
  local inc_paths=( 
    "${HOME}/.local/include" 
  )

  OLD_XPATH=$PATH             # Archive Old Paths
  OLD_MPATH=$MANPATH          #
  OLD_LDPATH=$LD_LIBRARY_PATH #
  OLD_LPATH=$LIBRARY_PATH     #
  OLD_IPATH=$INCLUDE          #
  OLD_CPATH=$CPATH            #

  # General helper function for generating path strings
  path_check() {
    local dir_list=("${@}")
    local collect=''
    for dir in "${dir_list[@]}"; do
      [[ -d $dir ]] && collect="${collect}:${dir}" || :
    done
    echo $collect
  }

  local xpath="$(path_check ${exe_paths[@]})"
  local mpath="$(path_check ${man_paths[@]})"
  local ldpth="$(path_check ${lib_paths[@]})"
  local lbpth=$ldpth
  local ipath="$(path_check ${inc_paths[@]})"
  local cpath=$ipath

  # Append old path to new path, remove redundancies, preserve order
  export PATH=$(awk_magic "$xpath:$PATH")
  export CPATH=$(awk_magic "$cpath:$CPATH")
  export INCLUDE=$(awk_magic "$ipath:$INCLUDE")
  export MANPATH=$(awk_magic "$mpath:$MANPATH")
  export LIBRARY_PATH=$(awk_magic "$lbpth:$LIBRARY_PATH")
  export LD_LIBRARY_PATH=$(awk_magic "$ldpth:$LD_LIBRARY_PATH")
}

# Setting PS1 style 
# \033 = \e := Escape -- Escapes next Character; Needed to set color 
#                           Modes
# \e[ ... m\]         -- Escape Nest 
# 38;05;${color}      -- 88/256 Foreground Color No Attribute ${color} 
# 48;05;${color}      -- 88/256 Background Color No Attribute ${color} 
# \[\e[38;05;${color}m\]
#                           38;05;${color} -- 88/256 Foreground Color
#                               
set_prompt() {
  # Main Function sets Prompt Color, Style, Tokens for tmux and default
  # environment
  sc_prompt() {
    # Helper function -- Sets Color for Prompt
    local color=${1:-60} esc=${2:-'\a'} pad=${3:-0} S=' '
    printf "%s%${pad}.s" "\[\033[38;05;${color}m\]${esc}" $S
  }
  local capstr='\[\e[m\]'
  # If in tmux environment, $TMUX is not empty and we set simpler 
  # prompt due to status bar at bottom of window.
  # \t -- 24 hour format HH:MM:SS
  # \h -- ${HOSTNAME%.*}
  # \u -- ${USER}
  # \$ -- $ if nonroot # else
  # \W -- $(basename $PWD) = ${PWD##*/}
  # See more here: 
  # https://wiki.archlinux.org/index.php/Color_Bash_Prompt#Prompt_escapes
  # 88/256 Colors see more here:
  # http://misc.flogisoft.com/bash/tip_colors_and_formatting
  ## 
  # lb_colors -- Light Background Terminal Colors
  # db_colors -- Dark  Background Terminal Colors
  # pe_tokens -- Prompt Escape Tokens
  if [[ -n $TMUX ]]; then
    local lb_colors=( 238 249 37 36 )
    local db_colors=( 236 239 66 243 )
    local pe_tokens=('\t' '\$' '\W' '>' )
    local space=( 0 0 0 0 ) # No padding between prompt objects
  else
    local lb_colors=( 238 243 43 249 37 36 )
    local db_colors=( 236 242 245 243 66 243 )
    local pe_tokens=('\t' '\h' '\u' '\$' '\W' '>' ) 
    local space=( 1 0 0 0 0 0 ) # Padding between time and other objects
  fi
  LIGHTTERM_PS1=''; DARKTERM_PS1=''
  for k in ${!db_colors[@]}; do
    local LTP1[$k]=$( 
      sc_prompt ${lb_colors[$k]} ${pe_tokens[$k]} ${space[$k]} 
    )
    local DTP1[$k]=$( 
      sc_prompt ${db_colors[$k]} ${pe_tokens[$k]} ${space[$k]} 
    )
    LIGHTTERM_PS1=$LIGHTTERM_PS1"${LTP1[$k]}"
    DARKTERM_PS1=$DARKTERM_PS1"${DTP1[$k]}"
  done; unset k
  LIGHTTERM_PS1="${LIGHTTERM_PS1}${capstr}"
  DARKTERM_PS1="${DARKTERM_PS1}${capstr}"
  export LIGHTTERM_PS1; export DARKTERM_PS1
  # Set old PS1 as backup in case display issues
  # NOTE: user can run, $ reset_prompt to revert to old $PS1 
  #       and old $PROMPT_COMMAND
  local  old_ps1=${OLD_PS1:-$PS1}
  local  old_psc=${OLD_PSC:-$PROMPT_COMMAND}
  export OLD_PS1=$old_ps1
  export OLD_PSC=$old_psc
  # TODO  Set either light or dark prompt based on color of terminal 
  #       background.
  # ISSUE Currently assumes dark background
  case ${1-:"dark"} in
    "light")
      export PS1=$LIGHTERM_PS1
      export ITERM_PROFILE="light"
      ;;
    "dark" | : | * | ? )
      export PS1=$DARKTERM_PS1
      export ITERM_PROFILE="dark"
      ;;
  esac
  # PROMPT_COMMAND -- Executes after end of shell evaluation
  #                -- Prints only if previous command had nonzero exit
  export PROMPT_COMMAND='ER=$?; [[ $ER == 0 ]] || ( 
    BSTR="NONZERO EXIT CODE -- WHAT WENT WRONG ->"; 
    ESTR="ERROR CODE -- $ER :("; echo -ne "\033[38;05;167m${BSTR}"; 
    printf "%.0s " $(eval "echo {1..$(($(tput cols)-${#BSTR}-${#ESTR}))}"); 
    echo -e "\033[38;05;203m${ESTR}"; unset ER BSTR ESTR )'
  # TODO Make Less Arbitrary
  export ITERM_PROFILE="dark"
}

reset_prompt() {
  local nargs=$#
  if [[ $nargs -gt 0 ]]; then
    export PS1='\u@\h:\W\$ '
    export PROMPT_COMMAND=''
  else
    export PS1=${OLD_PS1:-'\u@\h:\W\$ '}
    export PROMPT_COMMAND=${OLD_PSC:-''}
  fi
}

alert() {
  local BELL=""
  echo -e $BELL
}

alias_checker() {
  local ALIASCHECK
  local acheck_arr
  local ALIASFILE="${HOME}/.local/etc/profile.d/aliases.sh"
  [[ -f "${ALIASFILE}" ]] && grep 'alias ll=' "${ALIASFILE}" && \
    ALIASCHECK=0 || ALIASCHECK=1
  if [[ $ALIASCHECK -eq 0 ]]; then
    read -a acheck_arr -d '\n' < <(alias)
    [[ ${#acheck_arr[@]} -eq 0 ]] && builtin source "${HOME}/.bash_profile" || :
  fi
}

easy-ip() {
  ping -c 1 google.com &> /dev/null
  if [[ $? -eq 0 ]]; then
    IPADDR_PRI=$(ipconfig getifaddr en0)
    IPADDR_PUB=$(curl -s bot.whatismyipaddress.com)
    echo -e "\033[38;05;23mPublic  IP: ${IPADDR_PUB}"
    echo -e "\033[38;05;30mPrivate IP: ${IPADDR_PRI}"
  else
    echo "No network connection."
  fi
}

now() {
  echo $(date +"%FT%T%z")
}

scd() {
  # Nearly as good as quick-cd
  # Also for changing directory to deeper directories
  if [[ $# -ne 1 ]]; then
    echo "Exactly one input directory must be passed."
  else
    local prc=$(
      find $HOME -maxdepth 3 -type d -iname "${1}*" 2> /dev/null \
        | sed 1q
    )
    cd "$prc" || return 200
  fi
}

d2h() {
  # Converts decimal input to hex
  python - $@ << __EOF 
from sys import argv 
params = argv[1:]
for arg in params:
  print hex( int( arg ) )
__EOF
}

h2d() {
    # Converts hex to decimal
  python - $@ << __EOF 
from sys import argv 
params = argv[1:]
outstring = ""
for arg in params:
  if '0x' in arg:
    val = int( arg, 16 )
  else:
    val = int( '0x{}'.format(arg), 16 )
  print(val)
__EOF
}

h2unicode() {
  # Prints unicode characters
  local count=0
  for j in {128..191}; do 
    for k in {128..191}; do 
      local iHEX="e2"
      local jHEX=$(d2h $j)
      local kHEX=$(d2h $k) 
      local HSTR="\x${iHEX}\x${jHEX}\x${kHEX}"
      local USTR="${iHEX}${jHEX}${kHEX}"
      echo -ne "$HSTR | $USTR   " 
      let count++
      [[ $(( count % 7 )) -eq 0 ]] && echo '' || :
    done
  done
  echo ''
}

# ======================================================================
# World Clock
wdate() {
  local zones=(
    "Pacific/Midway"
    "Pacific/Honolulu"
    "America/Anchorage"
    "America/Los_Angeles"
    "America/Phoenix"  
    "America/New_York"
    "Europe/London"
    "Europe/Berlin"
    "Europe/Moscow"
    "Asia/Baghdad"
    "Asia/Calcutta"
    "Asia/Shanghai"
    "Australia/Melbourne"
  )
  for zone in ${zones[@]}; do
    local dcmd=date
    if [[ $(uname -s) == "Darwin" ]]; then
      local dcmd=gdate
    fi
    local dstr="$(TZ=$zone $dcmd '+%Y %m %d T %H:%M:%S:%::z' )"
    local zstr="${zone#*/}"
    printf '%20s :: %20s\n' "${zstr//_/ }" "${dstr}"
  done
}

# ======================================================================
# Custom man page command that will correctly display man pages.
# Someimtes man only displays a part of man page, thus manual.
manual() {
  local manpage=${1:-""}
  local opts=${2:-""}
  [[ -z $manpage ]] && return || :
  local twidth=$(( $(tput cols) - 5 ))
  local mpath=$( man -w $manpage ) 
  local ext=$( echo ${mpath##*.} )
  local cmd="nroff -man -rLL=${twidth}n"
  local printer="cat"
  [[ $ext =~ 'gz' ]] && local printer="gzip -cd" || :
  $printer $mpath | $cmd | less
}

xdisp() {
  # from https://unix.stackexchange.com/questions/17255/
  #            is-there-a-command-to-list-all-open-displays-on-a-machine
  netstat -lnt | awk 'sub(/.*:/,"",$4) && $4 >= 6000 && $4 < 6100 {
    print ($1 == "tcp6" ? "ip6-localhost:" : "localhost:") ($4 - 6000) 
  }'
}

## Set Working Directory ===============================================
# Affect workflow by exporting base of directory tree to DESK, for 
#   as it's where you work from home.
# Set to pwd if no directory is specified.
swd() {
  local directory=${1:-$(pwd)} 
  export DESK=$directory
}
## Change Working Directory ============================================
# Affect workflow by changing to base of directory tree to DESK, or 
#   set DESK if not already set.
cwd() {
  if ! [[ -z $DESK ]]; then 
    cd $DESK
  else 
    echo '$DESK not set--setting..'
    export DESK=${1:-$(pwd)}
  fi
}
## Change Old Directory ================================================
# To be used in conjuction with cwd, cod changes back to previous
#   directory.
cod() {
  cd $OLDPWD
}

## Easy Color ==========================================================
# Exports array of 256 colors generated by tput
easyColor() {
  COLOR=(); for k in {0..255}; do COLOR+=($(tput setaf $k)); done
}

## Simple CLI calc =====================================================
# http://stackoverflow.com/a/9576030/2142582
calc() {
  awk 'BEGIN{print '$@'}'
}

### INITIALIZATION -----------------------------------------------------
set_path
### --------------------------------------------------------------------


