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
  for f in $(find -path $srcdir/* -prune); do
    oldname=$(basename $f)             # Could also do $(echo ${f##*/})
    oldpath="${tardir}/${oldname}"
    if [[ -e $oldpath ]]; then
      mv -v $oldpath $spcdir
    fi
    cp -rv $f $tardir
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
