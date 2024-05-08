" Recognizes and Colors syntax 
syntax on
" Recognize syntax based on file extension.
filetype on
filetype plugin on
filetype indent on

" Has filetype associated with various syntax files
if has("autocmd")
  au BufEnter * let &titlestring=expand("%:p")
  au BufRead,BufNewFile *.se  setfiletype python
  au BufRead,BufNewFile *.rkt setfiletype scheme
  au BufRead,BufNewFile *.CR2 setfiletype txt
  au BufRead,BufNewFile *.inc setfiletype fortran
  au BufRead,BufNewFile *.fh  setfiletype fortran
  au BufRead,BufNewFile *.osa setfiletype applescript
  au BufRead,BufNewFile *.applescript setfiletype applescript
  au BufRead,BufWrite,BufWritePost,BufNewFile *.org setfiletype org
  au BufNewFile,BufReadPost *.md       set filetype=markdown
  au BufNewFile,BufReadPost *.mkd      set filetype=markdown
  au BufNewFile,BufReadPost *.markdown set filetype=markdown
  au BufEnter org set syntax=org
  au Filetype pov set syntax=fortran
  au Filetype gplot,gp set syntax=gnuplot
  au Filetype applescript,osa set syntax=applescript
endif

set iskeyword+=_

au FileType * exec( "setlocal dictionary+=" . 
      \ $HOME . "/.vim/dictionaries/".expand('<amatch>'))

set complete+=k

" Adds custom general highlighting to comment keywords
function! HighlightKeywords()
  let v=&ft."Comment"
  exe 'syn keyword myTodo containedin='. v '
     \ TODO XXX BUG NOTE FIXME ADD ISSUE QUEST QUESTION ASK FIX 
     \ GARBAGE TRASH BAD OKAY CITE REF DISCUSS DISC TALK MORE 
     \ LESS CLEAN MARK HERE CHECK CITE EQUATION'
  hi def link myTodo Todo
endfunction

autocmd Syntax * call HighlightKeywords()

