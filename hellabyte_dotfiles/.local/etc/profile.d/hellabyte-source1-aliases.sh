#!/usr/bin/env bash
# ======================================================================
# ALIAS FILE
#   PURPOSE - To be dedicated to general shell environment structures 
#             such as aliases, so that multiple shell languages can 
#             reference this file.
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ----------------------------------------------------------------------
# Note : called by .{zshrc,bash_profile}
# ======================================================================
## listing directory contents
# Make sure ls on darwin will accept the aliases
# without breaking ls_style for all systems.
newline='
'
fmt1='%Y-%m-%d %H:%M'
fmt2='%Y-%m-%d %H:%M'
ls_style="--si --sort=version --time-style=+'${fmt1}${newline}${fmt2}'"

case "$(uname -s)" in
  "Darwin") 
    # Replace old bsd coreutils with modern, homebrew installed
    # gnu-coreutils. Could do this with function as well
    update_gnu() {
      cmd=$1
      opt=${@:2}
      swhich $cmd && alias ${cmd[@]:1}="$cmd $opt" || :
    }
    gnu_tools_general=(
      gcal gcat gchgrp gchmod gchown gcp gcut gdate gdircolors gdf
      gdu gecho gfind ggetopt ghead gkill gln glocate gmkdir gmv gnl
      gpwd grm gsed gsplit gsort gstat gsync gtac gtail gnutar greadlink
      grealpath grsync gtar gtee gtest gtouch gtty guniq gunits gunlink
      gupdatedb guptime gusers gwc gwho gxargs
    )
    gnu_tools_special_cmds=( gls )
    gnu_tools_special_opts=( '$LS_OPTIONS' )

    for c in ${gnu_tools_general[@]}; do update_gnu $c; done

    for k in ${!gnu_tools_special_cmds[@]}; do
      cmd=${gnu_tools_special_cmds[$k]}
      opt=${gnu_tools_special_opts[$k]}
      update_gnu $cmd $opt
    done

    command -v gls &> /dev/null && : || ls_style=''
    alias calendar='calendar -f /etc/calendar/default'

    # General Darwin stuff.
    alias '.A'='cd /usr/local/Athenaeum/'
    command -v brew &> /dev/null && {
      alias "bw"='brew'; alias "bws"='brew search'
      alias "bwi"='brew install'
      alias "bwh"='brew home'
      alias "upup"='brew update && brew upgrade'
      tuneup() {
        local old_path_tmp=${PATH}
        export PATH=${PATH/anaconda/anaconda-tmp}
        brew update && brew upgrade
        echo "Cleaning..."; 
        brew cleanup; brew doctor
        export PATH=${old_path_tmp}
      }
    }
    command -v conda &>/dev/null && {
      command -v brew &>/dev/null && {
        cotuneup() {
          conda update conda jupyter python mkl numpy scipy \
                       matplotlib scikit-learn ipython pip  \
                       numba numbapro accelerate && tuneup
        }
      }
    }
    command -v define &> /dev/null && alias "def"='define' || :
    [[ -d /Applications/Firefox.app ]] && 
      alias "firefox"='open -a /Applications/Firefox.app' || :
    [[ -d /Applications/FirefoxAurora.app ]] && {
      alias "aurora"='open -a /Applications/FirefoxAurora.app'; 
    } || :
    alias "vlc"='/Applications/VLC.app/Contents/MacOS/VLC' || :
    alias "ptop"='top -stats pid,command,cpu,th,mem,pstate,time,power'
    alias "acroread"='open -a "/Applications/Adobe Acrobat Reader DC.app/"'
    ;;
  "Linux")
    alias "ls"='ls --color=auto'
    linux_distributions=(ubuntu centos arch)
    for f in ${linux_distributions[@]}; do
      cat /etc/*-release | grep -i "${f}" &> /dev/null &&
        case "${f}" in
          "centos")
            :
            ;;
          "ubuntu")
#           alias "upup"="sudo apt-get update && sudo apt-get upgrade"
#           alias "open"="xdg-open"
            ;;
          "arch")
#           alias "pm"="sudo pacman"
            ;;
          : | * )
            :
            ;;
          esac
      done; unset f; unset linux_distributions 
      ;;
    : | * )
      :
      ;;
esac

## Allow sudo to accept aliases
#alias sudo='sudo '

# General Aliases

alias "lsd"="ls -lFd ${ls_style}"
alias "la"="ls -aF ${ls_style}"
alias "ll"="ls -alF ${ls_style}"
alias "grep"="grep --color=auto -i"
alias '.....'='cd ../../../..'
alias '....'='cd ../../..'
alias '...'='cd ../..'
alias '..'='cd ..'
alias '.-'='cd -'

swhich ipython && { 
  alias "ipy"="ipython" 
  swhich julia && 
    alias ijulia="ipython notebook inline --profile=julia" || :
} || :

p=$(whereis ifort | awk '{print $2}')
! [[ -z $p ]] && alias 'ifort'=$p || :
unset p

