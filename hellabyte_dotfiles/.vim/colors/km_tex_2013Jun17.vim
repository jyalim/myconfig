" Vim color file
" Maintainer: Keri McKiernan <km@kerimckiernan.com> 
" Last Change: Mon Jun 17 2013
" Version: 1.0.0

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="Latex_McKiernan_2013Jun17"

" General colors
hi Normal           guifg=#E1E1E1     guibg=black       gui=NONE      
hi NonText          guifg=#070707     guibg=black       gui=NONE      

hi Cursor           guifg=black       guibg=#ff7311     gui=NONE      
hi LineNr           guifg=#3D3D3D     guibg=black       gui=NONE      

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE      
hi StatusLine       guifg=#CCCCCC     guibg=#202020     gui=italic    
hi StatusLineNC     guifg=black       guibg=#202020     gui=NONE        

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      

hi WildMenu         guifg=green       guibg=yellow      gui=NONE      
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      

hi Error            guifg=NONE        guibg=NONE        gui=undercurl     
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#C6C5FE     gui=BOLD      

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      
  hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      
  hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      
  hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      
  hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE      
  hi Search         guifg=NONE        guibg=NONE        gui=underline 
endif

" Syntax highlighting
hi Comment          guifg=#AFAFAF	  guibg=NONE        gui=italic      
hi String           guifg=#A8FF60     guibg=NONE        gui=NONE      
hi Number           guifg=#FF6161     guibg=NONE        gui=NONE      

hi Keyword          guifg=#96CBFE     guibg=NONE        gui=NONE      
hi PreProc          guifg=#8bF1FF     guibg=NONE        gui=NONE     
hi Conditional      guifg=#6699CC     guibg=NONE        gui=NONE        

hi Todo             guifg=#8f8f8f     guibg=NONE        gui=NONE      
hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE      

hi Identifier       guifg=#C6C5FE     guibg=NONE        gui=NONE      
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE      
hi Type             guifg=#FDFFAA     guibg=NONE        gui=NONE      
hi Statement        guifg=#CBFFE2     guibg=NONE        gui=NONE      

hi Special          guifg=#FFA1A1     guibg=NONE        gui=NONE      
hi Delimiter        guifg=#9AC4FC     guibg=NONE        gui=NONE      
hi Operator         guifg=white       guibg=NONE        gui=NONE      

" light blue	77DDEE
" light green 	CFF09E
" sea foam		A8DBA8
" sea green		79BD9A
" teal			3B8686
" dark blue		116699

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
