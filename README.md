myconfig
========

Configuration files for terminals.

This repository was created to simplify the process of configuring 
various machines.

Heavily tested with kernels Darwin and Linux 
  ( flavors Ubuntu, Arch, and CentOS).

Note that your old configuration files will be backed up to 
  $HOME/.local/var under the relevant date.
Further, the .bashrc should be used to source custom functions and 
  files that you may have, and will always source all the .sh files
  in $HOME/.local/etc/profile.d/.
Thus, if you had functions in your old configuration that you liked,
  place them in $HOME/.local/etc/profile.d/ as a .sh file, and 
  your new .bashrc will properly source them.
Further, to allow for updates, have thse profile.d .sh files run 
  custom attributes that you may have wanted rather than modifying
  directly the .bashrc.

Installing 
==========

Simply run 

    $ bash install.bash

from the cloned directory. This will backup any files that would be
replaced and install the configuration files.


Current Conf Files/Directories
==============================

* .bash\_profile  
* .bashrc  
* .dircolors  
* .gvimrc  
* .htoprc  
* .inputrc  
* .toprc
* .tmux.conf  
* .vim -- Is a directory, containing colors, syntax, and plugins.
* .vimrc  
* .local/etc/profile.d -- Is a directory containing custom aliases 
  and functions.
* .local/etc/template  -- Is a directory containing templates

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

![ViM Colors Example](http://i.imgur.com/OcdU5F0.png)
![Comment Color Example](http://i.imgur.com/IoSFMeb.png)

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
  default prefix from C-b to C-Space, where C implies use of the control 
  key.
The reason for this is that with the EMACS readline, C-b is a useful
  and common shortcut that is used relatively repetitively to move the
  cursor to the left,
  whereas C-Space has no definition in readline.
There are other custom optimizations that are in the conf file, 
  the most obvious of which are the styling of statusbar and prompt.
These have been made to fit a dark terminal, but they have been fine 
  in light terminals as well.

The other things to note are that v and y begin-selection and copy
  after hitting the prefix, as they would in ViM (still need to enter
  copy mode with C-Space [),
  and h, l, k, j will move the cursor to the relative 
  left, right, upper, or lower pane after hitting the prefix.
Also, hitting C-Space / will display pane numbers briefly over the panes 
  and allow for integer input which will cause the cursor to jump to 
  that pane.
If the numbers are already known, C-Space ; will also accept an integer
  for cursor pane tunneling.
These shortcuts make for a highly productive, window manager
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

2014 - October - 13
