let s:extfname = expand("%:e")
if s:extfname ==? "tex" 
  filetype indent off
  set iskeyword=@,48-58
  let g:LatexBox_split_type="new"
  let g:tex_comment_nospell=1
  " allow spellcheck to work always in TeXfiles
  syntax spell toplevel
endif

" Allows .tex files to be recognized as tex and not awful plaintex
let g:tex_flavor="latex"
