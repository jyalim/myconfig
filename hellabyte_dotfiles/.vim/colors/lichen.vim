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
set background=dark
highlight clear
if exists("syntax_on")
 syntax reset
endif
let g:colors_name = "lichen"

if has("gui_running")
  " Highlighting groups for various occasions
  " ------------------------------------------------------------------
  hi SpecialKey   guifg=RosyBrown4
  hi NonText      guifg=MidnightBlue guibg=#0C2628
  hi Directory    gui=BOLD guifg=DarkOliveGreen3
  hi ErrorMsg     guifg=LightGoldenRod guibg=Firebrick
  hi IncSearch    gui=BOLD guifg=Firebrick1
  hi Search       gui=REVERSE guifg=NONE guibg=NONE
  hi MoreMsg      guifg=DarkCyan
  hi ModeMsg      guifg=OliveDrab2
  hi LineNr       guifg=DarkSeaGreen3 guibg=#0C2628
  hi Question     guifg=Green
  hi StatusLine   gui=BOLD guifg=LemonChiffon3 guibg=#334680
  hi StatusLineNC gui=BOLD guifg=Honeydew4 guibg=Gray26
  hi VertSplit    gui=BOLD guifg=Gray20 guibg=Gray26
  hi Title        gui=BOLD guifg=RoyalBlue3
  hi Visual       guifg=PowderBlue guibg=#22364C
  hi VisualNOS    gui=BOLD,UNDERLINE guifg=SlateGray
  hi WarningMsg   guifg=Gold
  hi WildMenu     gui=BOLD guifg=Black guibg=Chartreuse3
  hi Folded       guifg=PaleGreen3 guibg=DarkSlateGray
  hi FoldColumn   gui=BOLD guifg=PaleGreen3 guibg=DarkSlateGray
  hi DiffAdd      guifg=SandyBrown guibg=DarkOliveGreen
  hi DiffChange   guibg=#3C444C
  hi DiffDelete   guifg=Gray20 guibg=Black
  hi DiffText     guifg=Chocolate guibg=#033B40

  " new Vim 7.0 items
  if v:version >= 700
    hi ColorColumn  guibg=#083539
    hi CursorColumn guibg=#063C36
    hi CursorLine   guibg=#063C36
    hi SignColumn   guifg=PaleGoldenrod guibg=Turquoise4
    hi TabLine      guifg=CornflowerBlue guibg=Gray26
    hi TabLineSel   guifg=RoyalBlue guibg=#082926
    hi TabLineFill  gui=UNDERLINE guifg=CornflowerBlue guibg=Gray20
    hi Pmenu        guifg=White guibg=MediumPurple4
    hi PmenuSel     guifg=Wheat guibg=#22364C
    hi PmenuSbar    guifg=Tan   guibg=SeaShell4
    hi PmenuThumb   guifg=IndianRed   guibg=SeaShell4
    hi MatchParen   gui=BOLD guifg=GoldenRod guibg=DarkCyan
  endif

  hi Cursor       guifg=Black guibg=LimeGreen
  hi CursorIM     guifg=Black guibg=OrangeRed

  " Syntax highlighting groups
  " ------------------------------------------------------------------

  hi Normal      gui=NONE guifg=LightBlue3 guibg=#082926
  hi Comment     gui=ITALIC guifg=BurlyWood4

  hi Constant    gui=NONE guifg=CadetBlue3
  hi link        String    Constant
  hi link        Character Constant
  hi Number      gui=NONE guifg=Turquoise3
  hi link        Boolean Number
  hi link        Float   Number

  hi Identifier  gui=NONE guifg=SteelBlue3
  hi Function    gui=NONE guifg=Aquamarine3

  hi Statement   gui=NONE guifg=SpringGreen3
  hi link        Conditional Statement
  hi link        Repeat      Statement
  hi link        Label       Statement
  hi Operator    gui=NONE guifg=SeaGreen3
  hi link        Keyword     Statement
  hi link        Exception   Statement

  hi PreProc     gui=NONE guifg=DodgerBlue3
  hi link        Include   PreProc
  hi link        Define    PreProc
  hi link        Macro     PreProc
  hi link        PreCondit PreProc

  hi Type        gui=NONE guifg=DeepSkyBlue3
  hi link        StorageClass Type
  hi link        Structure    Type
  hi link        Typedef      Type

  hi Special     gui=NONE guifg=SlateBlue
  hi link        Specialchar Special
  hi link        Tag         Special
  hi link        Delimiter   Special
  hi link        Debug       Special

  hi Underlined  gui=UNDERLINE guifg=SkyBlue3
  hi Ignore      gui=NONE guifg=Gray18
  hi Error       gui=NONE guifg=Khaki3 guibg=VioletRed4
  hi Todo        gui=BOLD guifg=GoldenRod3 guibg=NONE

" For iterm2, this is the section to modify.
" To see colors, run :!colors
elseif &t_Co == 88 || &t_Co == 256

  " Highlighting groups for various occasions
  " ------------------------------------------------------------------
  hi SpecialKey   ctermfg=95
  hi NonText      ctermfg=150
  hi Directory    cterm=bold    ctermfg=149
  hi ErrorMsg     ctermfg=228   ctermbg=124
  hi IncSearch    cterm=bold    ctermfg=220 ctermbg=NONE
  hi Search       cterm=bold    ctermfg=220 ctermbg=NONE
  hi MoreMsg      ctermfg=30
  hi ModeMsg      ctermfg=192
  hi LineNr       ctermfg=059
  hi Question     ctermfg=46
  hi StatusLine   cterm=none ctermfg=249 ctermbg=234
  hi StatusLineNC cterm=none ctermfg=243 ctermbg=234
  hi VertSplit    ctermfg=234 ctermbg=239
  hi Title        ctermfg=68
  hi Visual       ctermfg=232 ctermbg=220
  hi VisualNOS    cterm=bold,underline    ctermfg=60
  hi WarningMsg   ctermfg=220
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
    hi MatchParen   ctermfg=154 ctermbg=235
    hi ColorColumn  ctermbg=233
  endif

  " TODO -- Implement ColorColumn w/ version 7.3+

  hi Cursor       ctermfg=191 ctermbg=77
  hi CursorIM     ctermfg=191 ctermbg=202

  " Syntax highlighting groups
  " ------------------------------------------------------------------
  hi Normal    ctermfg=NONE ctermbg=NONE
  hi Comment   cterm=NONE  ctermfg=059

  hi Constant  ctermfg=116
  hi String    ctermfg=115
  hi Character ctermfg=126
  hi Number    ctermfg=109
  hi Boolean   ctermfg=229
  hi Float     ctermfg=109

 " Bash Variables being set Are Identifiers
  hi Identifier  ctermfg=81 cterm=NONE    
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
  hi PreCondit   ctermfg=066

  hi Type         ctermfg=030
  hi StorageClass ctermfg=037
  hi Structure    ctermfg=037
  hi Typedef      ctermfg=037

  hi Special     ctermfg=075
  hi Specialchar ctermfg=062 cterm=bold
  hi Tag         ctermfg=062
  hi Delimiter   ctermfg=037
  hi Debug       ctermfg=062

  hi Underlined  cterm=underline ctermfg=74
  hi Ignore      ctermfg=236
  hi Error       ctermfg=186 ctermbg=89
  hi Todo        cterm=NONE ctermfg=245 ctermbg=NONE

  hi SpellBad    cterm=BOLD,UNDERLINE ctermfg=196 ctermbg=NONE
  hi SpellCap    cterm=BOLD,UNDERLINE ctermfg=197 ctermbg=NONE
  hi SpellRare   cterm=BOLD,UNDERLINE ctermfg=220 ctermbg=NONE
  hi SpellLocal  cterm=BOLD,UNDERLINE ctermfg=202 ctermbg=NONE

  hi def link mailSubject Title
  hi def link mailSignature Comment
  hi def link mailQuoted2 mailQuoted1
  hi def link perlSharpBang Comment
else
  " Highlighting groups for various occasions
  " ------------------------------------------------------------------
  hi SpecialKey   ctermfg=LightMagenta
  hi NonText      ctermfg=Black
  hi Directory    cterm=bold     ctermfg=LightYellow
  hi ErrorMsg     ctermfg=Yellow ctermbg=Red
  hi IncSearch    cterm=bold    ctermfg=Red
  hi Search       cterm=reverse ctermfg=Yellow
  hi MoreMsg      ctermfg=DarkCyan
  hi ModeMsg      ctermfg=Yellow
  hi LineNr       ctermfg=Gray
  hi Question     ctermfg=Green
  hi StatusLine   cterm=bold ctermfg=Gray  ctermbg=DarkBlue
  hi StatusLineNC cterm=bold ctermfg=Black ctermbg=Gray
  hi VertSplit    cterm=bold cterm=bold ctermfg=DarkGray ctermbg=Gray
  hi Title        ctermfg=Blue
  hi Visual       ctermfg=Blue ctermbg=LightGreen
  hi VisualNOS    cterm=bold,underline ctermfg=DarkBlue
  hi WarningMsg   ctermfg=Yellow
  hi WildMenu     cterm=bold ctermfg=Black ctermbg=Green
  hi Folded       ctermfg=LightGray ctermbg=DarkCyan
  hi FoldColumn   cterm=bold ctermfg=LightGray ctermbg=DarkCyan
  hi Cursor       ctermfg=Black ctermbg=Green
  hi CursorIM     ctermfg=Black ctermbg=Red

  " Syntax highlighting groups
  " ------------------------------------------------------------------
  hi Normal     ctermfg=White ctermbg=Black
  hi Comment    cterm=NONE  ctermfg=Gray
  hi Constant   ctermfg=LightCyan
  hi Identifier ctermfg=DarkCyan
  hi Statement  ctermfg=Green
  hi PreProc    ctermfg=DarkBlue
  hi Type       ctermfg=DarkCyan
  hi Special    ctermfg=LightBlue
  hi Underlined cterm=underline
  hi Ignore     ctermfg=Black
  hi Error      ctermfg=LightYellow ctermbg=DarkMagenta
  hi Todo       cterm=bold ctermfg=LightYellow

endif
