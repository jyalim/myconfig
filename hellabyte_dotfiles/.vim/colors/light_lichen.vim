" ------------------------------------------------------------------
" Vim color file
" Name: moss (苔) | lichen
" Original Author: Li Chunlin <yeiicn!gmail.com> 
" Modifier:   Jason Yalim <jyalim@asu.edu>
" Last Change: 2010-08-06 | 2016 - 08 - 06
" Version: 2.1 | 1.2
" ------------------------------------------------------------------

" Init
" ------------------------------------------------------------------
set background=light
highlight clear
if exists("syntax_on")
 syntax reset
endif
let g:colors_name = "light_lichen"

if &t_Co == 88 || &t_Co == 256

  " Highlighting groups for various occasions
  " ------------------------------------------------------------------
  hi SpecialKey   ctermfg=095  ctermbg=none  cterm=none
  hi NonText      ctermfg=150  ctermbg=none  cterm=none
  hi Directory    ctermfg=149  ctermbg=none  cterm=bold   
  hi ErrorMsg     ctermfg=228  ctermbg=124   cterm=none
  hi IncSearch    ctermfg=021  ctermbg=none  cterm=bold 
  hi Search       ctermfg=021  ctermbg=none  cterm=bold 
  hi MoreMsg      ctermfg=030  ctermbg=none  cterm=none
  hi ModeMsg      ctermfg=018  ctermbg=none  cterm=none
  hi LineNr       ctermfg=059  ctermbg=none  cterm=none
  hi Question     ctermfg=037  ctermbg=none  cterm=none
  hi StatusLine   ctermfg=249  ctermbg=234   cterm=none 
  hi StatusLineNC ctermfg=243  ctermbg=234   cterm=none 
  hi VertSplit    ctermfg=234  ctermbg=239   cterm=none 
  hi Title        ctermfg=068  ctermbg=none  cterm=none
  hi Visual       ctermfg=016  ctermbg=220   cterm=none
  hi VisualNOS    ctermfg=060  ctermbg=none  cterm=bold,underline    
  hi WarningMsg   ctermfg=196  ctermbg=none  cterm=none
  hi WildMenu     ctermfg=016  ctermbg=076   cterm=bold   
  hi Folded       ctermfg=114  ctermbg=234   cterm=none
  hi FoldColumn   ctermfg=114  ctermbg=066   cterm=bold  
  hi DiffAdd      ctermfg=029  ctermbg=none cterm=none
  hi DiffChange   ctermfg=220  ctermbg=none cterm=none
  hi DiffDelete   ctermfg=124  ctermbg=none cterm=none
  hi DiffText     ctermfg=none ctermbg=none cterm=none
  hi User1        ctermfg=243  ctermbg=232  cterm=none
  hi User2        ctermfg=243  ctermbg=232  cterm=none
  hi User3        ctermfg=243  ctermbg=232  cterm=none
  hi User4        ctermfg=243  ctermbg=232  cterm=none
  hi User5        ctermfg=243  ctermbg=232  cterm=none

  " new Vim 7.0 items
  if v:version >= 700
    hi SignColumn   ctermfg=229  ctermbg=030  cterm=none
    hi TabLine      ctermfg=069  ctermbg=238  cterm=none
    hi TabLineSel   ctermfg=069  ctermbg=none cterm=none
    hi TabLineFill  ctermfg=069  ctermbg=236  cterm=underline 
    hi Pmenu        ctermfg=021  ctermbg=254  cterm=none 
    hi PmenuSel     ctermfg=226  ctermbg=105  cterm=none 
    hi PmenuSbar    ctermfg=none ctermbg=250  cterm=none 
    hi PmenuThumb   ctermfg=none ctermbg=245  cterm=none
    hi MatchParen   ctermfg=000  ctermbg=221  cterm=none
    hi ColorColumn  ctermfg=none ctermbg=255  cterm=none
  endif " ()

  " TODO -- Implement ColorColumn w/ version 7.3+

  hi Cursor       ctermfg=016  ctermbg=020  cterm=none
  hi CursorIM     ctermfg=016  ctermbg=196  cterm=none

  " Syntax highlighting groups
  " ------------------------------------------------------------------
  hi Normal       ctermfg=none ctermbg=none cterm=none
  hi Comment      ctermfg=241  ctermbg=none cterm=none  

  hi Constant     ctermfg=032  ctermbg=none cterm=none  
  hi String       ctermfg=034  ctermbg=none cterm=none  
  hi Character    ctermfg=128  ctermbg=none cterm=none  
  hi Number       ctermfg=055  ctermbg=none cterm=none  
  hi Boolean      ctermfg=090  ctermbg=none cterm=none  
  hi Float        ctermfg=032  ctermbg=none cterm=none  

  " Bash Variables being set Are Identifiers
  hi Identifier   ctermfg=026  ctermbg=none cterm=none    
  hi Function     ctermfg=101  ctermbg=none cterm=none 

  hi Statement    ctermfg=022  ctermbg=none cterm=none
  hi Conditional  ctermfg=069  ctermbg=none cterm=none
  hi Repeat       ctermfg=066  ctermbg=none cterm=none
  hi Label        ctermfg=072  ctermbg=none cterm=none
  hi Operator     ctermfg=066  ctermbg=none cterm=none
  hi Keyword      ctermfg=067  ctermbg=none cterm=none
  hi Exception    ctermfg=209  ctermbg=none cterm=none

  hi PreProc      ctermfg=032  ctermbg=none cterm=none  
  hi Include      ctermfg=033  ctermbg=none cterm=none  
  hi Define       ctermfg=032  ctermbg=none cterm=none  
  hi Macro        ctermfg=031  ctermbg=none cterm=none  
  hi PreCondit    ctermfg=021  ctermbg=none cterm=none  

  hi Type         ctermfg=030  ctermbg=none cterm=none 
  hi StorageClass ctermfg=037  ctermbg=none cterm=none 
  hi Structure    ctermfg=037  ctermbg=none cterm=none 
  hi Typedef      ctermfg=037  ctermbg=none cterm=none 

  hi Special      ctermfg=020  ctermbg=none cterm=none
  hi Specialchar  ctermfg=062  ctermbg=none cterm=bold
  hi Tag          ctermfg=062  ctermbg=none cterm=none
  hi Delimiter    ctermfg=030  ctermbg=none cterm=none
  hi Debug        ctermfg=062  ctermbg=none cterm=none

  hi Underlined   ctermfg=074  ctermbg=none cterm=underline 
  hi Ignore       ctermfg=236  ctermbg=none cterm=none
  hi Error        ctermfg=236  ctermbg=225  cterm=none
  hi Todo         ctermfg=245  ctermbg=none cterm=none 

  hi SpellBad    cterm=BOLD,UNDERLINE ctermfg=196 ctermbg=NONE
  hi SpellCap    cterm=BOLD,UNDERLINE ctermfg=197 ctermbg=NONE
  hi SpellRare   cterm=BOLD,UNDERLINE ctermfg=220 ctermbg=NONE
  hi SpellLocal  cterm=BOLD,UNDERLINE ctermfg=202 ctermbg=NONE

  hi def link mailSubject Title
  hi def link mailSignature Comment
  hi def link mailQuoted2 mailQuoted1
  hi def link perlSharpBang Comment
endif
