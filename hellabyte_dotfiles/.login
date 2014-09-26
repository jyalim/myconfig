# .login
# ==============================================================================
# ALIAS FILE
#   PURPOSE - To be dedicated to general shell environment structures such as 
#             aliases, so that multiple shell languages can reference this file.
# ------------------------------------------------------------------------------
# Note : called by .{zshrc,bash_profile}
# ==============================================================================

case "$(uname -s)" in
    "Darwin") 
        # Replace old bsd coreutils with modern, homebrew installed gnu-coreutils
        command -v gcat &> /dev/null && alias "cat"='gcat' || :
        command -v gchgrp &> /dev/null && alias "chgrp"='gchgrp' || :
        command -v gchmod &> /dev/null && alias "chmod"='gchmod' || :
        command -v gchown &> /dev/null && alias "chown"='gchown' || :
        command -v gcp &> /dev/null && alias "cp"='gcp' || :
        command -v gcut &> /dev/null && alias "cut"='gcut' || :
        command -v gdate &> /dev/null && alias "date"='gdate' || :
        command -v gdf &> /dev/null && alias "df"='gdf' || :
        command -v gdu &> /dev/null && alias "du"='gdu' || :
        command -v gecho &> /dev/null && alias "echo"='gecho' || :
        command -v gfind &> /dev/null && alias "find"='gfind' || :
        command -v ghead &> /dev/null && alias "head"='ghead' || :
        command -v gkill &> /dev/null && alias "kill"='gkill' || :
        command -v gls &> /dev/null && alias "ls"='gls $LS_OPTIONS' || :
        command -v gln &> /dev/null && alias "ln"='gln' || :
        command -v gmkdir &> /dev/null && alias "mkdir"='gmkdir' || :
        command -v gmv &> /dev/null && alias "mv"='gmv' || :
        command -v gnl &> /dev/null && alias "nl"='gnl' || :
        command -v gpwd &> /dev/null && alias "pwd"='gpwd' || :
        command -v grm &> /dev/null && alias "rm"='grm' || :
        command -v gsed &> /dev/null && alias "sed"="gsed" || :
        command -v gsplit &> /dev/null && alias "split"='gsplit' || :
        command -v gsort &> /dev/null && alias "sort"='gsort' || :
        command -v gstat &> /dev/null && alias "stat"='gstat' || :
        command -v gsync &> /dev/null && alias "sync"='gsync' || :
        command -v gtac &> /dev/null && alias "tac"='gtac' || :
        command -v gtail &> /dev/null && alias "tail"='gtail' || :
        command -v gnutar &> /dev/null && alias "tar"='gnutar' || :
        command -v greadlink &> /dev/null && alias "readlink"='greadlink' || :
        command -v grealpath &> /dev/null && alias "realpath"='grealpath' || :
        command -v gtee &> /dev/null && alias "tee"='gtee' || :
        command -v gtest &> /dev/null && alias "test"='gtest' || :
        command -v gtouch &> /dev/null && alias "touch"='gtouch' || :
        command -v gtty &> /dev/null && alias "tty"='gtty' || :
        command -v guniq &> /dev/null && alias "uniq"='guniq' || :
        command -v gunlink &> /dev/null && alias "unlink"='gunlink' || :
        command -v guptime &> /dev/null && alias "uptime"='guptime' || :
        command -v gusers &> /dev/null && alias "users"='gusers' || :
        command -v gwc &> /dev/null && alias "wc"='gwc' || : || :
        command -v gwho &> /dev/null && alias "who"='gwho'
        [[ -f /usr/local/bin/vim ]] && alias "vim"='/usr/local/bin/vim' || :

        alias calendar='calendar -f /etc/calendar/default'

        # General Darwin stuff.
        alias '.A'='cd /usr/local/Athenaeum/'
        command -v brew &> /dev/null &&
            alias "bw"='brew'; alias "bws"='brew search'; \
            alias "bwi"='brew install'; \
            alias "bwh"='brew home'; \
            alias "upup"='brew update && brew upgrade'
            alias "tuneup"='( brew update && brew upgrade ); \
                                echo "Pruning, cleaning..."; \
                                brew prune; brew cleanup; brew doctor' || :
        command -v define &> /dev/null && alias "def"='define' || :
        [[ -d /Applications/Firefox.app ]] && 
            alias "firefox"='open -a /Applications/Firefox.app' || :
        [[ -d /Applications/FirefoxAurora.app ]] &&
            alias "aurora"='open -a /Applications/FirefoxAurora.app'; \
            alias "netflix"='open https://www.netflix.com -a /Applications/FirefoxAurora.app'; \
            alias "amazon"='open https://www.amazon.com -a /Applications/FirefoxAurora.app' || :
            alias "vlc"='/Applications/VLC.app/Contents/MacOS/VLC' || :
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


# General Aliases

## Allow sudo to accept aliases
alias sudo='sudo '

ls_style="--sort version --time-style=+'%m-%d %H:%M'"
alias "lf"="ls -F ${ls_style}"
alias "ll"="ls --si -alFi ${ls_style}"
alias "llh"="ls -alhFi ${ls_style}"
alias "llt"="ll -t ${ls_style}"
alias "la"="ls -aF ${ls_style}"
alias "lsa"="ls -aF ${ls_style}"
alias "lsl"="ls --si -lhF ${ls_style}"
alias "lg"="ls -ghF ${ls_style}"
alias "lS"="ls -lShF ${ls_style}"
alias "grep"="grep -i"
alias "fgrep"="fgrep -i"
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
alias "ptg"='pt google.com'
alias "py"='python'
alias "pyc"="python -c"
command -v ipython &> /dev/null && alias "ipy"="ipython" || :

p=$(whereis ifort | awk '{print $2}')
! [[ -z $p ]] && alias 'ifort'=$p || :
unset p

