" ------------------------------------------------------------------
" Vim color file
" Name: moss (苔) | lichen
" Original Author: Li Chunlin <yeiicn!gmail.com> 
" Modifier:   Jason Yalim <jyalim@asu.edu>
" Last Change: 2010-08-06 | 2013 - 07 - 20
" Version: 2.1 | 1.0
" URL: http://vim.sourceforge.net/script.php?script_id=2779
" ------------------------------------------------------------------

" Init
" ------------------------------------------------------------------
set background=light
highlight clear
if exists("syntax_on")
 syntax reset
endif
let g:colors_name = "mymoss"

if &t_Co == 88 || &t_Co == 256

  " Highlighting groups for various occasions
  " ------------------------------------------------------------------
  hi SpecialKey   ctermfg=95
  hi NonText      ctermfg=150
  hi Directory    cterm=bold    ctermfg=149
  hi ErrorMsg     ctermfg=228   ctermbg=124
  hi IncSearch    cterm=bold    ctermfg=202 ctermbg=NONE
  hi Search       cterm=bold    ctermfg=203 ctermbg=NONE
  hi MoreMsg      ctermfg=030
  hi ModeMsg      ctermfg=018
  hi LineNr       ctermfg=059
  hi Question     ctermfg=46
  hi StatusLine   cterm=none ctermfg=249 ctermbg=234
  hi StatusLineNC cterm=none ctermfg=243 ctermbg=234
  hi VertSplit    ctermfg=234 ctermbg=239
  hi Title        ctermfg=068
  hi Visual       ctermfg=016 ctermbg=116
  hi VisualNOS    cterm=bold,underline    ctermfg=60
  hi WarningMsg   ctermfg=196
  hi WildMenu     cterm=bold  ctermfg=16  ctermbg=76
  hi Folded       ctermfg=114 ctermbg=234
  hi FoldColumn   cterm=bold  ctermfg=114 ctermbg=66
  hi DiffAdd      ctermfg=029 ctermbg=none cterm=none
  hi DiffChange   ctermfg=220 ctermbg=none cterm=none
  hi DiffDelete   ctermfg=124 ctermbg=none cterm=none
  hi DiffText                 ctermbg=none cterm=none
  hi User1 ctermfg=243 ctermbg=232
  hi User2 ctermfg=243 ctermbg=232
  hi User3 ctermfg=243 ctermbg=232
  hi User4 ctermfg=243 ctermbg=232
  hi User5 ctermfg=243 ctermbg=232

  " new Vim 7.0 items
  if v:version >= 700
    hi SignColumn   ctermfg=229 ctermbg=30
    hi TabLine      ctermfg=69  ctermbg=238
    hi TabLineSel   ctermfg=69
    hi TabLineFill  cterm=underline ctermfg=69 ctermbg=236
    hi Pmenu        ctermfg=231 ctermbg=97
    hi PmenuSel     ctermfg=223 ctermbg=60
    hi PmenuSbar    ctermfg=180 ctermbg=245
    hi PmenuThumb   ctermfg=167 ctermbg=245
    hi MatchParen   ctermfg=123 ctermbg=195
    hi ColorColumn  ctermbg=255
  endif " ()

  " TODO -- Implement ColorColumn w/ version 7.3+

  hi Cursor       ctermfg=16 ctermbg=77
  hi CursorIM     ctermfg=16 ctermbg=202

  " Syntax highlighting groups
  " ------------------------------------------------------------------
  hi Normal    ctermfg=NONE ctermbg=NONE
  hi Comment   cterm=NONE  ctermfg=241

  hi Constant  ctermfg=032
  hi String    ctermfg=028
  hi Character ctermfg=128
  hi Number    ctermfg=032
  hi Boolean   ctermfg=090
  hi Float     ctermfg=032

  " Bash Variables being set Are Identifiers
  hi Identifier  ctermfg=026 cterm=NONE    
  hi Function    ctermfg=101

  hi Statement   ctermfg=066
  hi Conditional ctermfg=068
  hi Repeat      ctermfg=066
  hi Label       ctermfg=072
  hi Operator    ctermfg=066
  hi Keyword     ctermfg=067
  hi Exception   ctermfg=209

  hi PreProc     ctermfg=032
  hi Include     ctermfg=033
  hi Define      ctermfg=032
  hi Macro       ctermfg=031
  hi PreCondit   ctermfg=025

  hi Type         ctermfg=030
  hi StorageClass ctermfg=037
  hi Structure    ctermfg=037
  hi Typedef      ctermfg=037

  hi Special     ctermfg=038
  hi Specialchar ctermfg=062
  hi Tag         ctermfg=062
  hi Delimiter   ctermfg=037
  hi Debug       ctermfg=062

  hi Underlined  cterm=underline ctermfg=74
  hi Ignore      ctermfg=236
  hi Error       ctermfg=186 ctermbg=89
  hi Todo        cterm=NONE ctermfg=245 ctermbg=NONE

  hi SpellBad    ctermfg=186 ctermbg=89 
  hi SpellCap    ctermfg=232 ctermbg=89 
  hi SpellRare   ctermfg=89  ctermbg=186
  hi SpellLocal  ctermfg=89  ctermbg=249

  hi def link mailSubject Title
  hi def link mailSignature Comment
  hi def link mailQuoted2 mailQuoted1
  hi def link perlSharpBang Comment
endif
