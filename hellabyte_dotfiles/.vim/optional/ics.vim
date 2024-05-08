let s:extfname = expand("%:e")
" Respect ics 75 character limit 
if s:extfname ==? "ics" 
  if exists('+colorcolumn')
    execute "set colorcolumn=" . join(range(76,300),",")
  endif
endif

