let s:extfname = expand("%:e")
" Group Closing
inoremap (<cr>  ()<Left><CR><CR><C-D><Up><tab>
inoremap {<cr>  {}<Left><CR><CR><C-D><Up><tab>
inoremap [<cr>  []<Left><CR><CR><C-D><Up><tab>
inoremap (      ()<Left>
inoremap {      {}<Left>
inoremap [      []<Left>
inoremap ()     ()<Left>
inoremap {}     {}<Left>
inoremap []     []<Left>
" Lazy (plus back up for {})
inoremap (<space> (  )<Left><Left>
inoremap {<space> {  }<Left><Left>
inoremap [<space> [  ]<Left><Left>

if s:extfname ==? "html"
  inoremap <<cr>  <><Left><CR><CR><C-D><Up><tab>
  inoremap <      <><Left>
  inoremap <>     <><Left>
  inoremap <<space> <  ><Left><Left>
endif

" Allows for system clipboard pasted text to not be butchered by
" builtin autoindent (and to paste without group closing)
set pastetoggle=<F2>

" TeX indentexpr function, GetTexIndent() drives me crazy
if s:extfname ==? "tex" 
  inoremap $       $$<left>
  inoremap '<tab>  ''<Left>
  inoremap "       ""<Left>
  inoremap `       `'<Left>
else 
  inoremap '<tab>  '
  inoremap "<tab>  "
  inoremap `<tab>  `
  inoremap '       ''<Left>
  inoremap "       ""<Left>
  inoremap `       ``<Left>
endif

