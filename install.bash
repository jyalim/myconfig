#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# First argument specifies whether or not to backup files that will
# be overwritten when exactly equal to 1337.
# Second argument specifies prefix (where to install, $HOME by default).
# ----------------------------------------------------------------------


force_opt=${1:-''}
prefix=${2:-"$HOME"}
srcdir="./hellabyte_dotfiles"
tardir="${prefix}"
bakdir="${tardir}/.local/etc/profile-bak"
now=$(date +"%Y.%m.%d-%H.%M")
spcdir="${bakdir}/${now}"

cat << __EOF
------------------------------------------------------------------------
Default is to not force the install.
Rerun the bash install with 1337 for the \$1 argument to force install.

Forcing an install will move old files to 
  
  $spcdir

------------------------------------------------------------------------
__EOF

if [[ $force_opt == '' ]]; then
  cp -rv $srcdir/* $tardir
  echo "Unforced copy complete."
elif [[ $force_opt -eq 1337 ]]; then
  ! [[ -d $spcdir ]] && mkdir -pv $spcdir || :
  for newfile in $(find -path $srcdir/* -prune); do
    oldname=$(basename $newfile)  # Could also do $(echo ${newfile##*/})
    oldfile="${tardir}/${oldname}"
    if [[ -e $oldfile ]]; then
      if [[ -d $oldfile ]] || ! [[ $(diff $oldfile $newfile) == '' ]]; 
        then
        # Only back up if changes exist or it's a directory.
        mv -v $oldfile $spcdir
      fi
    fi
    cp -rv $newfile $tardir
  done
  echo "Forced copy complete."
else
  cat << __EOF
========================================================================
The first argument that was passed was: $force_opt
This is not equivalent to 1337 or blank.
If \$1 (the first argument passed to the script) is set to 1337,
then the copy will be forced and the files from here will 
replace defaults.

If a parameter was passed to this install script by mistake,
please try again without the parameter. 
========================================================================
__EOF
  exit 3
fi
