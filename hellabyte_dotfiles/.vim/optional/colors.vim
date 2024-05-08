if $TERM == "dumb"
  colorscheme default
elseif $ITERM_BG == "light"
  colo light_lichen
else
  set t_Co=256
  colo lichen
endif
