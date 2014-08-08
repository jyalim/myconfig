myconfig
========

Configuration files for terminals.

This repository was created to simplify the process of configuring various 
machines.

Lightly tested with kernels Darwin and Linux ( flavors Arch, CentOS, and 
Ubuntu ).

Installing 
==========

Simply run 

    $ bash install.bash

from the cloned directory. This will unpack the tarball, 
configuration\_files.tar.gz into the user's home directory.

Current Conf Files/Directories
==============================

* .aspell.en.prepl
* .bash\_profile  
* .bashrc  
* .dircolors  
* .git-completion  
* .gvimrc  
* .htoprc  
* .inputrc  
* .login  
* .toprc
* .tmux.conf  
* .vim -- Is a directory, containing colors and swap  
* .vim-tmp -- Is another directory for temp vim files  
* .vimrc  

Current Dependencies
====================

* GNU-aspell
* Bash 3.0 or greater  
* Readline  
* tmux  
* vim 7.0 or greater
* gvim
* git  
* dircolors  
* quick-cd  
* gnuplot
* curl  
* ipconfig  
* htop
* top

Future Versions
===============

Besides including more updated versions of the various files, the following 
services should be added.

* A way to install basic tools and dependencies of the configuration files 
  if need be.

2013 - November - 21
