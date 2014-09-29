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

If forced, this directory will not be kept if no backups are made.

------------------------------------------------------------------------
__EOF

# ----------------------------------------------------------------------
# NOTE
# Because OS X is older than time, this code will have to suffice.
# On linux, could do
#   $ cp -rv --suffix=$spcdir $newfile $tardir
# after a diff check, which would backup existing files and do the copy.
# ----------------------------------------------------------------------

if [[ $force_opt == '' ]]; then
  for newfile in $(find -path $srcdir/* -prune); do
    cp -nrv $newfile $tardir
  done
  echo "Unforced/noclobber copy complete."
elif [[ $force_opt -eq 1337 ]]; then
  ! [[ -d $spcdir ]] && mkdir -pv $spcdir || :
  for newfile in $(find -path $srcdir/* -prune); do
    oldname=$(basename $newfile)  # Could also do $(echo ${newfile##*/})
    oldfile="${tardir}/${oldname}"
    if [[ -e $oldfile ]]; then
      if ! [[ $(diff -rq $oldfile $newfile) == '' ]]; then
        # Only back up if changes exist 
        mv -v $oldfile $spcdir
      fi
    fi
    cp -nrv $newfile $tardir
  done
  readarray backup_check < <(ls -A1 $spcdir)
  nBack=${#backup_check[@]}
  echo "Forced install complete."
  if [[ $nBack -eq 0 ]]; then
    rm -r $spcdir
    echo "No backups were made."
  else
    echo "${nBack} backups were put in the following directory: $spcdir"
  fi
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
