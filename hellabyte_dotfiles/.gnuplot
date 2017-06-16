#!/usr/bin/env gnuplot
# ----------------------------------------------------------------------
# AUTHOR: Nathaniel Hellabyte
# https://github.com/hellabyte/myconfig
# ======================================================================

# QT is pretty, but slow
set term x11 enhanced font 'times,25' size '1000,450'

# Enable Macros
set macros

# Custom color map
set palette rgbformula 33,13,10
set isosamples 40
set samples 1000

# Fonts
OS = system("uname -s")
if ( OS eq "Darwin" ) set fontpath "/Library/Fonts"

# Colors
black    = "#000000"
niceblue = "#2F8E99"
blue     = "#0087BC"
green    = "#00BC8B"
gray     = "#858584"
darkgray = "#585858"
purple   = "#933BAE"
orange   = "#F2A20E"

# General Shortcuts
nl = "\n"
tb = "\t"

fortfmt = 'binary format="%*1int%double%*1int"'

if ( system("hostname") eq "mathpost" ) {
    f = './forward_file.dat'; r = './reverse_file.dat';
    fwd = 'forward'; rev = 'reverse'
    ts(direction,k) = sprintf( 'time_series_%s_%03d.dat', direction, k )
    workdir = '/home/jyalim/documents/research/Lopez_Welfert/duffing_eq/'
    c = workdir . 'static_plot/static_beta/master_plottin/unit_circle.dat'
    lcr = 'linecolor rgb'
    sfloq = "set size square; set xrange [-1.5:1.5]; set yrange [-1.5:1.5]"
    pfloq = "p c u 1:2:3 w circles lw 2  @lcr black    t '',       \
               r u   4:5 w p ps 1. pt 08 @lcr green    t 'reverse-e1', \
               r u   6:7 w p ps 1. pt 10 @lcr blue     t 'reverse-e2', \
               f u   4:5 w p ps .5 pt 02 @lcr darkgray t 'forward-e1', \
               f u   6:7 w p ps .5 pt 06 @lcr purple   t 'forward-e2'"
    presp = "p f w l, r w l"
    qtsr = "p for [k=0:1000] ts(rev,k) w l t sprintf('%03d',k)" 
    qtsf = "p for [k=0:1000] ts(fwd,k) w l t sprintf('%03d',k)" 
    qpsr = "p for [k=0:1000] ts(rev,k) u 2:3 w l t sprintf('%03d',k)" 
    qpsf = "p for [k=0:1000] ts(fwd,k) u 2:3 w l t sprintf('%03d',k)" 
}

col(k) = column(k)

bf='binary format="%18double" skip=256'

bind "ctrl-l" "set logscale y; set format y '%.2le%L'; replot"
bind "ctrl-r" "reset; replot"
