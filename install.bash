#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------
# TODO Add Dry Run Default
# ----------------------------------------------------------------------


force_opt=${1:-''}
prefix=${2:-"$HOME"}
srcdir="hellabyte_dotfiles"
upkdir="${srcdir}"
tardir="${prefix}"
bakdir="${tardir}/.local/var/configuration-backups"
now=$(date +"%Y.%m.%d-%H.%M")
spcdir="${bakdir}/${now}"
procs=4 # Assume 4 threads for xargs

if ! [[ -d "$spcdir" ]]; then
  echo "------"
  echo "Making Backup directory -- $spcdir" 
  echo "This will be automatically deleted if no backups are made"
  mkdir -pv "$spcdir"
  echo "------"
fi

mapfile -t directories < <(find "$upkdir" -type d)

for d in "${directories[@]}"; do
  relative_dname="${d#*/}"
  target_dname="${tardir}/${relative_dname}"
  if ! [[ -d "$target_dname" ]]; then
    mkdir -pv "$target_dname"
  fi
done #| xargs -P $procs -I {} echo {}

mapfile -t files < <(find "$upkdir" -type f)

for f in "${files[@]}"; do 
  relative_fname="${f#*/}"
  target_fname="${tardir}/${relative_fname}"
  if ! [[ -e "$target_fname" ]]; then
    echo "$target_fname not found, freshly installing"
    cp -v "$f" "$target_fname"
  else
    diff_res="$(diff -q $f $target_fname)"
    if ! [[ -z "$diff_res" ]]; then
      echo "$target_fname found, backing up then installing"
      relative_dname="${relative_fname%/*}"
      bakspcdir="${spcdir}/${relative_dname}"
      bakspcfile="${spcdir}/${relative_fname}"
      mkdir -pv "$bakspcdir"
      mv -v "$target_fname" "$bakspcfile"
      cp -v "$f" "$target_fname"
    fi
  fi
done #| xargs -P $procs -I {} echo {}

# Check to see if backup was actually done
readarray backup_check < <(ls -A1 "$spcdir")
nBack=${#backup_check[@]}
echo ""
if (( "$nBack" == 0 )); then
  rm -r "$spcdir"
  echo "No backups were made."
else
  echo "${nBack} backups were put in the following directory: $spcdir"
fi
echo ""
echo '-----'
echo "Install complete."
