#!/usr/bin/env bash
# USAGE
#   $ bash conf_git_update.bash [path to temporary storage] [path to git dir] 
# TODO
#   Add bash getopts to specify names with a file or with stdin
#   Turn into github repo
# INFO
# Copies configuration files and moves them to git repository, to allow browsing.
# Also creates tarball of files for general download.

commit_message=${1:-":)"}

loc_home=${2:-"${HOME}/.local/src/hellabyte/myconfig"}
git_home=${3:-"${HOME}/.local/src/hellabyte/myconfig"}
shipname="hellabyte_dotfiles"
loc_ship="${loc_home}/${shipname}"
loc_tarb="${loc_home}/configuration_files.tar.gz"
loc_targ="${git_home}/${shipname}"
# Specify names of files to backup to github here.
profiledir='.local/etc/profile.d'
templatedir='.local/etc/template'
testsdir='.local/etc/tests'
confsdir='.local/etc/confs'
profiles="${HOME}/${profiledir}"
proftemp="${HOME}/${templatedir}"
testsshp="${HOME}/${testsdir}"
confspwd="${HOME}/${confsdir}"
local_profiles="${loc_ship}/${profiledir}"
local_proftemp="${loc_ship}/${templatedir}"
local_testsdir="${loc_ship}/${testsdir}"
local_confsdir="${loc_ship}/${confsdir}"
owner=hellabyte
names=( 
        ".bashrc" ".bash_profile" ".tmux.conf" ".inputrc" ".htoprc" 
        ".gvimrc" ".gnuplot" ".dircolors" ".vim" ".vimrc" ".toprc" 
        ".project" ".plan" ".pythonrc" ".manpath" ".pentadactylrc"
        ".juliarc.jl"
)

# Checks to see if tarball_contents file already exists. 
[[ -f $loc_tarb ]] && rm $loc_tarb || :
# Checks to see if loc_ship directory already exists.
[[ -d $loc_ship ]] && rm -r $loc_ship  || :
[[ ! -d $loc_ship ]] && mkdir -p $loc_ship  || :
# Checks to see if loc_targ exists
[[ -d $loc_targ ]] && rm -rf $loc_targ || :

# First setup special etc files
! [[ -d $local_profiles ]] && mkdir -p $local_profiles || :
! [[ -d $local_proftemp ]] && mkdir -p $local_proftemp || :
! [[ -d $local_testsdir ]] && mkdir -p $local_testsdir || :
! [[ -d $local_confsdir ]] && mkdir -p $local_confsdir || :

for f in ${profiles}/*; do
  bf=$(basename $f)
  if [[ $bf =~ ^$owner ]]; then
    cp $f $local_profiles
  fi
done
cp -r $proftemp ${local_proftemp%/*}
cp -r $testsshp ${local_testsdir%/*}
cp -r $confspwd ${local_confsdir%/*}
 
for f in ${names[@]}; do
    # Make sure file exists, and force copy to ship directory
    origin="${HOME}/${f}"
    middle="${loc_ship}/${f}"
    if [[ -f $origin ]] && [[ $origin -nt $middle ]]; then
        [[ -f $middle ]] && rm $middle || :
        cp $origin $middle
    elif [[ -d $origin ]] && [[ $origin -nt $middle ]]; then
        [[ -d $middle ]] && rm -r $middle || : 
        cp -r $origin $middle 
    fi
done

special_a="${loc_ship}/.vim/.netrwhist"
special_b="${loc_ship}/.vim/.undo"
special_c="${loc_ship}/.vim/.state"
special_d="${loc_ship}/.vim/.tmp"
[[ -f $special_a ]] && : > $special_a || :
[[ -d $special_b ]] && rm -rf $special_b || :
[[ -d $special_c ]] && rm -rf $special_c || :
[[ -d $special_d ]] && rm -rf $special_d || :

#cd $loc_ship
#tar czf $loc_tarb ./
#mv $loc_tarb $git_home
[[ $loc_home != $git_home ]] && cp -r $loc_ship $git_home || :
echo "Import complete, attempting commit."
cd $git_home
git add -A
git commit -a -m "$commit_message"
git push
echo "Process complete."
