#!/usr/bin/env bash

# Installs configuration files to User's home directory
# TODO - Backup files that are being replaced

force_opt=${1:-''}
srcdir="./hellabyte_dotfiles"
tardir="$HOME"

echo "Default is to not force the install."
echo "Rerun the bash install with 1 for the \$1 argument to force the
      install"

if [[ $force_opt == '' ]]; then
  cp -r $srcdir/* $tardir
  echo "Unforced copy complete"
else if [[ $force_opt == '1' ]]; then
  cp -rf $srcdir/* $tardir
  echo "Forced copy complete"
else
  echo "The first argument that was passed was: $1"
  echo "This is not equivalent to 1 or blank."
  echo "If \$1 (the first argument passed to the script) is set to 1,"
  echo "then the copy will be forced and the files from here will "
  echo "replace defaults."
  echo ""
  echo "If a parameter was passed to this install script by mistake,"
  echo "Please try again without the parameter. "
  exit 3
fi


