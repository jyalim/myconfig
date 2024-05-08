" default to `hard lines`, which break at a fixed text width.
let g:longlines = 0
set formatoptions=c,q,r,t
let &showbreak=""

function! Softline()
  let g:longlines = 1
  set formatoptions=
  set wrap linebreak
  let &showbreak="\u21aa "
endfunction 

function! Hardline()
  let g:longlines = 0
  set formatoptions=c,q,r,t
  let &showbreak=""
endfunction 

function! Invline()
  if g:longlines 
    :call Hardline()
  else
    :call Softline()
  endif
endfunction

nmap <leader>F :call Invline()<C-j>
