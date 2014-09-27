myconfig
========

Configuration files for terminals.

This repository was created to simplify the process of configuring 
various machines.

Lightly tested with kernels Darwin and Linux 
( flavors Arch, CentOS, and Ubuntu ).

Installing 
==========

Simply run 

    $ bash install.bash

from the cloned directory. This will copy over the subtree in
hellabyte_dotfiles into the installer's home directory.
Running

    $ bash install.bash 1

will force the copy and overwrite existing files. 
Note that anything other than 1 in that first
position (excluding a blank) will result in an error.


Current Conf Files/Directories
==============================

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
* .vim -- Is a directory, containing colors, syntax, and plugins.
* .vim-tmp -- Is another directory for temp vim files.
* .vimrc  

Vim Plugins
===========

* SnipMate ( A lot of LaTeX goodies )
* Multiple Cursors

Vim Colors
==========

The default colorscheme, mymoss.vim, is configured to handle 256 color
terminals. 
It has most of the relevant keywords for configuring any new/old 
colorscheme.
So even if you don't like it, it can serve as a template for a new
terminal colorscheme.


Configures the Following
========================

* Bash 3.0 or greater  
* Readline  
* tmux  
* vim 7.0 or greater
* gvim
* git  
* dircolors  
* quick-cd  
* gnuplot
* htop
* top

2014 - September - 26
