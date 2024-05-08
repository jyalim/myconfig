let s:extfname = expand("%:e")

let g:markdown_fenced_languages = [
\ 'css',
\ 'erb=eruby',
\ 'javascript',
\ 'js=javascript',
\ 'json=javascript',
\ 'ruby',
\ 'sass',
\ 'xml',
\ 'html',
\ 'fortran',
\ 'python',
\ 'py=python',
\ 'C=c',
\ 'cpp',
\ 'c',
\ 'matlab',
\ 'go',
\ 'julia',
\ 'perl',
\ 'haskell',
\ 'lisp',
\ 'awk',
\ 'bash=sh',
\ 'sh'
\ ]

if s:extfname ==? "markdown"
  set tw=0
  set wrap linebreak nolist
  set breakindent
  set breakindentopt=sbr,shift:15
  set fo-=t
endif

