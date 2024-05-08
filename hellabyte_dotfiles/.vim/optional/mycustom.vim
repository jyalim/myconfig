let s:extfname = expand("%:e")
" Preserves whitespace indentations on newline. On by default
set autoindent
" Inserts specified spaces with <>> <<> commands when autoindent is on.
"   If on, C-v <Tab> inserts actual tab.
set expandtab
" Inserts shiftwidth spaces for <tab>. If off, <tab> inserts
"   tabstop spaces.
set smartindent           " Indents instead of tabs
set tabstop=2             " Size of hard tabstop
set shiftwidth=2          " Size of indent
set expandtab             " Spaces instead of tabs
set softtabstop=2         " combination of previous two

set timeoutlen=500

set textwidth=72
