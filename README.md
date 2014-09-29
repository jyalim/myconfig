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
* .gvimrc  
* .htoprc  
* .inputrc  
* .login  
* .toprc
* .tmux.conf  
* .vim -- Is a directory, containing colors, syntax, and plugins.
* .vimrc  

Vim Plugins and Fun
===================

* SnipMate ( A lot of LaTeX goodies )
* Multiple Cursors
* Temp, undo, and info files configured to go into hidden directories
  within .vim, with permissions such that only creator and root can 
  view contents.
* Mouse support so long as terminal software supports it ( i.e. gnome
  shell or iterm2 will work with the mouse).
* Special comment highlighting for words such as NOTE, ISSUE, FIXME, and 
  so on, with room for customizability.
* Color columns and color scheme optimized for terminals with a dark 
  background.

![ViM Colors Example][/../assets/assets/syntax_ex.png]
![Comment Color Example][/../assets/assets/comment_ex.png]

More on Vim Colors
==================

The default colorscheme, mymoss.vim, is configured to handle 256 color
  terminals. 
It has most of the relevant keywords for configuring any new/old 
  colorscheme.
So even if you don't like it, it can serve as a template for a new
  terminal colorscheme.

Configuration of tmux
=====================

The major change that the tmux.conf files introduces is changing the 
  default prefix from C-b to C-a, where C implies use of the control 
  key.
The reason for this is that with the EMACS readline, C-b is a useful
  and common shortcut that is used relatively repetitively to move the
  cursor to the left,
  whereas C-a in readline moves the cursor to the start of the line,
  which only needs to ideally be pressed once.
There are other custom optimizations that are in the conf file, 
  the most obvious of which are the styling of statusbar and prompt.
These have been made to fit a dark terminal, but they have been fine 
  in light terminals as well.

The other things to note are that v and y begin-selection and copy
  after hitting the prefix, as they would in ViM,
  and h, l, k, j will move the cursor to the relative 
  left, right, upper, or lower pane after hitting the prefix.
Also, hitting C-a / will display pane numbers briefly over the panes 
  and allow for integer input which will cause the cursor to jump to 
  that pane.
If the numbers are already known, C-a ; will also accept an integer
  for cursor pane tunneling.
I find that these shortcuts make for a highly productive, window manager
  like terminal experience, allowing one to be mouse independent if need
  be, albeit the conf file has it so that the mouse is actually able to
  select panes and scroll.

Configures the Following
========================

* Bash 3.0 or greater  
* Readline  
* tmux ( optimized for 1.9, but should be fine on 1.8 )
* vim 7.0 or greater
* gvim
* gnuplot
* htop
* top
* dircolors  
* quick-cd  

2014 - September - 26
