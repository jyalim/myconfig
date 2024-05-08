let s:extfname = expand("%:e")
if s:extfname ==? "f"
  let fortran_fixed_source=1
  unlet! fortran_free_source
else
  let fortran_free_source=1
  let fortran_have_tabs=1
  unlet! fortran_fixed_source
" -- Turn this off as it slows down syntax highlighting considerably for
" -- large files
" let fortran_more_precise=1
endif
