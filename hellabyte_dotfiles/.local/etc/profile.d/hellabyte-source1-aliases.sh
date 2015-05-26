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

case "$(uname -s)" in
  "Darwin") 
    # Replace old bsd coreutils with modern, homebrew installed gnu-coreutils
    swhich gcal       && alias "cal"='gcal'             || :
    swhich gcat       && alias "cat"='gcat'             || :
    swhich gchgrp     && alias "chgrp"='gchgrp'         || :
    swhich gchmod     && alias "chmod"='gchmod'         || :
    swhich gchown     && alias "chown"='gchown'         || :
    swhich gcp        && alias "cp"='gcp'               || :
    swhich gcut       && alias "cut"='gcut'             || :
    swhich gdate      && alias "date"='gdate'           || :
    swhich gdircolors && alias "dircolors"='gdircolors' || :
    swhich gdf        && alias "df"='gdf'               || :
    swhich gdu        && alias "du"='gdu'               || :
    swhich gecho      && alias "echo"='gecho'           || :
    swhich gfind      && alias "find"='gfind'           || :
    swhich ggetopt    && alias "getopt"='ggetopt'       || :
    swhich ghead      && alias "head"='ghead'           || :
    swhich gkill      && alias "kill"='gkill'           || :
    swhich gls        && alias "ls"='gls $LS_OPTIONS'   || :
    swhich gln        && alias "ln"='gln'               || :
    swhich gmkdir     && alias "mkdir"='gmkdir'         || :
    swhich gmv        && alias "mv"='gmv'               || :
    swhich gnl        && alias "nl"='gnl'               || :
    swhich gpwd       && alias "pwd"='gpwd'             || :
    swhich grm        && alias "rm"='grm'               || :
    swhich gsed       && alias "sed"="gsed"             || :
    swhich gsplit     && alias "split"='gsplit'         || :
    swhich gsort      && alias "sort"='gsort'           || :
    swhich gstat      && alias "stat"='gstat'           || :
    swhich gsync      && alias "sync"='gsync'           || :
    swhich gtac       && alias "tac"='gtac'             || :
    swhich gtail      && alias "tail"='gtail'           || :
    swhich gnutar     && alias "tar"='gnutar'           || :
    swhich greadlink  && alias "readlink"='greadlink'   || :
    swhich grealpath  && alias "realpath"='grealpath'   || :
    swhich gtee       && alias "tee"='gtee'             || :
    swhich gtest      && alias "test"='gtest'           || :
    swhich gtouch     && alias "touch"='gtouch'         || :
    swhich gtty       && alias "tty"='gtty'             || :
    swhich guniq      && alias "uniq"='guniq'           || :
    swhich gunlink    && alias "unlink"='gunlink'       || :
    swhich guptime    && alias "uptime"='guptime'       || :
    swhich gusers     && alias "users"='gusers'         || :
    swhich gwc        && alias "wc"='gwc'               || :  
    swhich gwho       && alias "who"='gwho'             || :
    [[ -f /usr/local/bin/vim ]] && alias "vim"='/usr/local/bin/vim' || :

    alias calendar='calendar -f /etc/calendar/default'

    # General Darwin stuff.
    alias '.A'='cd /usr/local/Athenaeum/'
    command -v brew &> /dev/null &&
      alias "bw"='brew'; alias "bws"='brew search'; \
      alias "bwi"='brew install'; \
      alias "bwh"='brew home'; \
      alias "upup"='brew update && brew upgrade --all '
      alias "tuneup"='( brew update && brew upgrade --all ); \
                          echo "Pruning, cleaning..."; \
                          brew prune; brew cleanup; brew doctor' || :
    command -v define &> /dev/null && alias "def"='define' || :
    [[ -d /Applications/Firefox.app ]] && \
      alias "firefox"='open -a /Applications/Firefox.app' || :
    [[ -d /Applications/FirefoxAurora.app ]] && \
      alias "aurora"='open -a /Applications/FirefoxAurora.app'; \
      alias "netflix"='open https://www.netflix.com -a /Applications/FirefoxAurora.app'; \
      alias "amazon"='open https://www.amazon.com -a /Applications/FirefoxAurora.app' || :
    alias "vlc"='/Applications/VLC.app/Contents/MacOS/VLC' || :
    alias "ptop"='top -stats pid,command,cpu,th,mem,pstate,time,power'
    ;;
  "Linux")
    alias "ls"='ls --color'
    LINUX_DISTRIBUTIONS=("ubuntu" "centos" "arch")
    for f in ${LINUX_DISTRIBUTIONS[@]}; do
      cat /etc/*-release | grep -i "${f}" &> /dev/null &&
        case "${f}" in
          "centos")
            :
            ;;
          "ubuntu")
            alias "upup"="sudo apt-get update && sudo apt-get upgrade"
            alias "open"="xdg-open"
            ;;
          "arch")
            alias "pm"="sudo pacman"
            ;;
          : | * )
            :
            echo "NO SPECIFIC LINUX DISTRIBUTION ALIAS " \
                 "SUPPORT YET -- STILL REQUIRES SWITCH " \
                 "STATEMENT IN ${HOME}/.login"
            ;;
          esac
      done; unset f; unset LINUX_DISTRIBUTIONS 
      ;;
    : | * )
      :
      ;;
esac

## listing directory contents
# Make sure ls on darwin will accept the aliases
# without breaking ls_style for all systems.
ls_style="--si --sort version --time-style=+'%m-%d %H:%M'"
command -v gls &> /dev/null && : || ls_style=''

## Allow sudo to accept aliases
alias sudo='sudo '

# General Aliases

alias "lsa"="ls -aF"
alias "lsl"="ls -lF"
alias "lsf"="ls -F"
alias "lltr"="ls -altr"
alias "la"="ls -aF ${ls_style}"
alias "lA"="ls -AF ${ls_style}"
alias "ll"="ls -alFi ${ls_style}"
alias "lL"="ls -lFi ${ls_style}"
alias "lf"="ls -F ${ls_style}"
alias "lg"="ls -gF ${ls_style}"
alias "lS"="ls -lSF ${ls_style}"
alias "llt"="ll -tr ${ls_style}"
alias "grep"="grep --color=auto -i"
alias "fgrep"="fgrep --color=auto -i"
alias '.....'='cd ../../../..'
alias '....'='cd ../../..'
alias '...'='cd ../..'
alias '..'='cd ..'
alias '.-'='cd -'
alias '.d'='cd ~/Desktop'
alias '.r'='cd /'
command -v vim &> /dev/null && alias "vi"='vim'; \
  alias "svi"='sudo vim'; \
  alias "svim"='svi' || :
alias "jobs"='jobs -l'
alias "pt"='ping -c 3'
alias "ptg"='pt 8.8.8.8'
alias "py"='python'
alias "pyc"="python -c"
#command -v julia &>/dev/null && \
#  alias ijulia="ipython notebook inline --profile=julia" || :
command -v ipython &> /dev/null && alias "ipy"="ipython" || :

p=$(whereis ifort | awk '{print $2}')
! [[ -z $p ]] && alias 'ifort'=$p || :
unset p

