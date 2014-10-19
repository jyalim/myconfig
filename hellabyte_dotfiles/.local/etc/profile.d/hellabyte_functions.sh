#!/usr/bin/env bash
# ----------------------------------------------------------------------
# ${HOME}/.local/etc/profile.d/functions.sh
#   Contains all of the bash functions that will need to be sourced.
#   Environment Function Runtime Configuration
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ======================================================================


# Use awk magic (associative arrays) to remove duplicate paths while
# preserving order
awk_magic() {
  input=${1:-''}
  temp=$(awk 'BEGIN{ORS=RS=":"}{ 
    if ( a[$0] == 0) { 
      print $0; a[$0]++ 
    } 
  }' <<< "$input:" )
  echo ${temp%:*}
}

# Sets the path for the environment. Should only be run once.
path_set() {
  local H=$HOME
  local A="anaconda/bin"
  local L="${H}/.local"
  local O="openmpi/bin"
  local LO="${L}/opt"
  local x_paths=(
    "${LO}/${O}" "${LO}/${A}" "${L}/bin" "${L}/sbin" "${H}/bin" 
    "${H}/sbin" "${H}/local/bin" "${H}/local/sbin" "${L}/usr/bin" 
    "${L}/usr/sbin" "${L}/usr/local/bin" "${L}/usr/local/sbin"
    "/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/bin" 
    "/sbin" "/usr/texbin" "/opt/X11/bin" "/usr/bin/X11" "/usr/games" 
    "/Developer/NVIDIA/CUDA-6.0/bin" "/opt/ganglia/bin"
    "/Applications/MATLAB_R2013b.app/bin" "/usr/local/matlab/bin" 
    "/usr/local/maple/bin" "/usr/local/sage" 
    "/usr/local/mathematica/Executables" 
  )
  local mps="local/share/man"
  local lps="local/lib"
  local ips="local/include"
  local man_paths=( "${H}/.${mps}" "${H}/${mps}" "${H}/share/man" 
    "${L}/.local/man" "${H}/local/man"
    "${H}/.local/usr/share/man" "${H}/local/usr/share/man" 
    "${H}/.local/usr/local/share/man" "${H}/local/usr/local/share/man" 
    "${LO}/anaconda/share/man" "${H}/local/anaconda/share/man" )
  local lib_paths=( "${H}/.${lps}" "${H}/${lps}" "${H}/lib" 
    "${H}/.local/usr/lib" "${H}/.local/usr/local/lib" 
    "${H}/local/usr/lib" "${H}/local/usr/local/lib" )
  local inc_paths=( "${H}/.${ips}" "${H}/${ips}" "${H}/include" 
    "${H}/.local/usr/include" "${H}/.local/usr/local/include" 
    "${H}/local/usr/include" "${H}/local/usr/local/include" )

  OLDXPATH=$PATH
  OLDMPATH=$MANPATH
  OLDLDPATH=$LD_LIBRARY_PATH
  OLDLPATH=$LIBRARY_PATH
  OLDIPATH=$INCLUDE
  OLDCPATH=$CPATH

  PATH=''
  for xp in ${x_paths[@]}; do
      [[ -d $xp ]] && PATH="${PATH}:${xp}" || :
  done; unset xp

  local tempPATH="${PATH}:${OLDXPATH}"
  PATH=$(awk_magic $tempPATH)
  unset tempPATH

  local mpath=''
  for mp in ${man_paths[@]}; do
      [[ -d $mp ]] && ! [[ $mpath =~ $mp ]] \
        && mpath="${mpath}:${mp}" || :
  done; unset mp; 
  mpath=$(awk_magic "${mpath}:${OLDMPATH}")

  lpath=$OLDLPATH
  ldpath=$OLDLDPATH
  for lp in ${lib_paths[@]}; do
      if [[ -d $lp ]]; then 
          ! [[  $lpath =~ $lp ]] &&  lpath="${lpath}:$lp"  || :
          ! [[ $ldpath =~ $lp ]] && ldpath="${ldpath}:$lp" || :
      fi
  done; unset lp
  lpath=$(awk_magic "${lpath}")
  ldpath=$(awk_magic "${ldpath}")

  incpath=$OLDIPATH
  inccpath=$OLDCPATH
  for ip in ${inc_paths[@]}; do
      if [[ -d $ip ]]; then 
          ! [[  $incpath =~ $ip ]] &&  incpath="${incpath}:$ip"  || :
          ! [[ $inccpath =~ $ip ]] && inccpath="${inccpath}:$ip" || :
      fi
  done; unset ip
  incpath=$(awk_magic $incpath)
  inccpath=$(awk_magic $inccpath)
  ! [[ -z $mpath    ]] &&  MANPATH=$mpath          || :
  ! [[ -z $lpath    ]] &&  LIBRARY_PATH=$lpath     || :
  ! [[ -z $ldpath   ]] &&  LD_LIBRARY_PATH=$ldpath || :
  ! [[ -z $incpath  ]] &&  INCLUDE=$incpath        || :
  ! [[ -z $inccpath ]] &&  CPATH=$inccpath         || :
  unset mpath; unset lpath; unset ldpath; unset incpath; unset inccpath

  local SYS_PROF='/etc/profile.d'
  if [[ -d SYS_PROF ]]; then
    for f in "${SYS_PROF}/*.sh"; do
      builtin source $f
    done
  fi

  local INTEL_PROF='/opt/intel/bin/compilervars.sh'
  local INTEL_ARCH='intel64'
  [[ -f $INTEL_PROF ]] && builtin source $INTEL_PROF $INTEL_ARCH || :

}

# Variables for Directory Names
common_dir_init() {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    USER_HOME="/Users/${USER}"
    ROOT_HOME="/private/var/root"
  else
    USER_HOME="/home/${USER}"
    ROOT_HOME="/etc/root"
  fi
  DSTACK=( $USER_HOME $ROOT_HOME )
  # Various directories and files 
  DOCDIR="${HOME}/documents"
  INETDIR="${DOCDIR}/various/inet"
  NOTEFILE="${DOCDIR}/various/notes.txt"
  TASKFILE="${DOCDIR}/various/tasks.txt"
  INETGEOFILE="${INETDIR}/geo.xml"
  ! [[ -d $DOCDIR ]] && mkdir 700 $DOCDIR || :
  ! [[ -d $INETDIR ]] && mkdir -p $INETDIR || :
  ! [[ -f $NOTEFILE ]] && touch $NOTEFILE || :
  ! [[ -f $TASKFILE ]] && touch $TASKFILE || :
  ! [[ -f $INETGEOFILE ]] && touch $INETGEOFILE || :
}

common_dir_init
# Setting PS1 style 
my_prompt() {
  colorme_prompt() {
    local COLOR=${1:-60}; local ESCAPE=${2:-'\a'}; local SPACE=${3:-0}; local S=' '
    printf "%s%.3d%s%s%${SPACE}.s" '\[\033[38;05;' $COLOR 'm\]' $ESCAPE $S
  }
  local CAPSTR='\[\e[m\]'
  if [[ -n $TMUX ]]; then
    local LT_COLORS=( 238 249 37 36 )
    local DT_COLORS=( 236 239 66 243 )
    local OT_TYPES=('\t' '\$' '\W' '>' )
    local SPACE=( 0 0 0 0 )
  else
    local LT_COLORS=( 238 243 43 249 37 36 )
    local DT_COLORS=( 236 242 245 243 66 243 )
    local OT_TYPES=('\t' '\h' '\u' '\$' '\W' '>' )
    local SPACE=( 1 0 0 0 0 0 )
  fi
  LIGHTTERM_PS1=''; DARKTERM_PS1=''
  for M in $(eval "echo {0..$((${#DT_COLORS[@]} - 1))}"); do
    local LTP1[$M]=$( colorme_prompt ${LT_COLORS[$M]} ${OT_TYPES[$M]} ${SPACE[$M]} )
    local DTP1[$M]=$( colorme_prompt ${DT_COLORS[$M]} ${OT_TYPES[$M]} ${SPACE[$M]} )
    LIGHTTERM_PS1=$LIGHTTERM_PS1"${LTP1[$M]}"
    DARKTERM_PS1=$DARKTERM_PS1"${DTP1[$M]}"
  done; unset M
  LIGHTTERM_PS1="${LIGHTTERM_PS1}${CAPSTR}"
  DARKTERM_PS1="${DARKTERM_PS1}${CAPSTR}"
  export LIGHTTERM_PS1; export DARKTERM_PS1
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
  export PROMPT_COMMAND='ER=$?; [[ $ER == 0 ]] || ( \
    BSTR="NONZERO EXIT CODE -- WHAT WENT WRONG ->"; ESTR="ERROR CODE -- $ER :("; \
    echo -ne "\033[38;05;167m${BSTR}"; 
    printf "%.0s " $(eval "echo {1..$(($(tput cols) - ${#BSTR} - ${#ESTR}))}"); \
    echo -e "\033[38;05;203m${ESTR}"; unset ER BSTR ESTR )'
  export ITERM_PROFILE="dark"
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

easy_ip() {
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

easy_ip_geo() {
  # TODO - Create unique XML for every new location.
  # TODO - Parse XML into data type that is better.
  # TODO - Turn into seperate program.
  # TODO - Find ethical use for the data.
  ping -c 1 google.com &> /dev/null
  if [[ $? -eq 0 ]]; then
    [[ -z $IP_ADDR_PUB ]] && easy_ip &> /dev/null
    [[ -d "${INETDIR}" ]] || mkdir "${GEO_DATA_DIR}" &> /dev/null
    local WEBADDR="http://services.ipaddresslabs.com/iplocation/locateip?key=demo&ip="
    local IP_GEO_STR="${WEBADDR}${IPADDR_PUB}"
    echo "Creating xml of ip geo data at ${INETGEOFILE}"
    curl -s "${IP_GEO_STR}" -o "${INETGEOFILE}" &> /dev/null
  else
    echo "No network connection."
  fi
}

geo_ip_info() {
  # Takes ip from command line options and returns xml data generated by ipaddresslabs
  # ping -c 1 google.com &> /dev/null
  # [[ $? -ne 0 ]] && echo "No network connection."; return 1
  local IP_TARGET=${1}
  echo $IP_TARGET
  if [[ -n $IP_TARGET ]]; then
    local WEBADDR="http://services.ipaddresslabs.com/iplocation/locateip?key=demo&ip="
    local IP_GEO_STR="${WEBADDR}${IP_TARGET}"
    curl -s "${IP_GEO_STR}"
  else
    echo "No target provided."
  fi
}

duh() {
    du --si $1 | tail -1
}

now() {
    echo $(date +"%Y.%m.%d-%H.%M.%S")
}

scd() {
  if [ $# != 1 ]; then
    echo "No input passed."
  else
    [[ -z ${DSTACK[@]} ]] && ( echo "Empty directory stack."; return ) || :
    local NULL="/dev/null"; ITEM="*${1}*"
    local PRC=$(find ${DSTACK[@]} \
      -maxdepth 3 -type d -iname $ITEM 2> $NULL | sed 1q)
    cd ${PRC[0]}
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
for arg in params:
  if '0x' in arg:
    val = int( arg, 16 )
  else:
    val = int( '0x{}'.format(arg), 16 )
print val
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

task_checker() {
  local TASKCOUNT=$(wc -w $TASKFILE | cut -d ' ' -f 1)
  [[ $TASKCOUNT -ne 0 ]] && echo -e \
    "\033[38;05;168mThere are tasks that need to be completed.\
    \nPlease check $TASKFILE for more info.\033[m"
}

task() {
  # TODO -- Count number of lines in task file, and automatically enumerate.
  local TASKS_APPEND="${@}"
  echo -e $TASKS_APPEND >> $TASKFILE
}

note() { 
  local NOTE_APPEND="${@}"
  echo -e $NOTE_APPEND >> $NOTEFILE
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
