" .vimrc
" 2014 - 09 - 26  
" ---------------------------------------------------------------------
" Note that all options can be defined and researched by using builtin 
"   docs.
"       :help <setting>
" will bring up the settings help text.
" ---------------------------------------------------------------------
" Some of the commands and settings on this page were adapted from this 
"   site
"       http://items.sjbach.com/319/configuring-vim-right
" Others were found on stackoverflow and various blogs.
" EMACS keybinding section was all me though.
" ---------------------------------------------------------------------
" AUTHOR: Nathaniel Hellabyte
" SOURCE: https://github.com/hellabyte/myconfig
" =====================================================================

" Turns off vi-compatability
set nocompatible
" 
" Changes mapleader from default of / 
" mapleader is useful for setting custom modified commands.
let mapleader=' '
let maplocalleader='\'

" Sets automatic carriage return at column number <textwidth>. 
"   0/78 off/defl. 
set textwidth=72
set formatoptions=c,q,r,t    
" c    auto-wrap comments w/ text-width
" q    Allow formatting of comments with <gq>
" r    Auto insert current comment leader after <enter>
" t    Auto wrapping of non-comment text

" Color 72nd and 80+ columns a different color to indicate width limit.
" Comment out these lines if the columns are unsettling.
if exists('+colorcolumn')
  execute "set colorcolumn=72," . join(range(80,300),",")
endif
" Allows ViM to manage multiple buffers 
"   ( independent buffers and marks )
set hidden 

" Shows info on current command in status line
set showcmd 
" set laststatus=2
" set statusline="%f %y %n %c %m"

" Swap mark goto commands s.t. ' := goto exact mark & ` 
"   := goto line of mark
nnoremap ' `
nnoremap ` '

" Self-evident, but default is 20.
set history=1000

" Allows for more robust behavior of <%> matching.
" NOTE -- runtime vs. source -- runtime is relative to vim directory; 
"   while source needs an absolute path.
runtime macros/matchit.vim

" Shows list for <tab> complete in : (command) mode
set wildmenu
" Shows all of the options in wild menu.
set wildmode=list:longest

" Makes quick search case insensitive if and only if Capital unused.
set ignorecase
set smartcase

" Sets title of terminal to /path/file - vim
set title

" Sets context minimum around the cursor.
set scrolloff=0

" Sets central temp file location, to prevent local default behavior.
if isdirectory($HOME . '/.vim/.tmp') == 0
  :silent !mkdir -m 700  -p ~/.vim/.tmp > /dev/null 2>&1
endif

set backupdir=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,
set directory=~/.vim/.tmp ",~/.local/tmp/vim,/var/tmp,/tmp,

if exists("+viminfo")
  " viminfo -- Saves Vim state information such as marks, command line
  "            history, search string history, buffers, global vars, 
  "            registers, search/sub patterns, and input-line history.
  "            :help viminfo
  "            Allegedly default permissions are sufficient for privacy.
  "
  if isdirectory( $HOME . '/.vim/.state') == 0
    :silent !mkdir -m 700 -p ~/.vim/.state > /dev/null 2>&1
  endif
  set viminfo+=n~/.vim/.state/viminfo
  set spellfile =$HOME/.vim/.state/spell/en.utf-8.add
  set spellfile+=$HOME/.vim/.state/spell/en.latin1.add
  set spellfile+=$HOME/.vim/.state/spell/en.ascii.add
  set spelllang=en_us
endif

if exists("+undofile")
  " undofile -- This allows you to use undos after exiting and 
  "             restarting. NOTE: only present in 7.3+
  "             :help undo-persistence
  if isdirectory( $HOME . '/.vim/.undo' ) == 0
    :silent !mkdir -m 700 -p ~/.vim/.undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/.undo
  set undofile
endif

if isdirectory( $HOME . '/.vim/doc' ) == 1
  set runtimepath+=$HOME/.vim/doc
  helptags $HOME/.vim/doc
endif

" For code folding: saves code folding for next session
"   Also saves the view, and thus the place of the cursor.
"   ISSUE : doesn't necessarily update with the .vimrc, requires 
"           cleaning.
if isdirectory( $HOME . '/.vim/.state/view') == 0
  :silent !mkdir -m 700 -p ~/.vim/.state/view > /dev/null 2>&1
endif
set viewdir=~/.vim/.state/view
autocmd BufWrite * mkview
autocmd BufRead  * silent loadview


" Line Numbers, nu = number
set nu 

set backspace=indent,eol,start

if has("mouse")
  set mouse=a
  set mousehide
endif

if has("eval")
  let is_bash=1
endif

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
  au BufNewFile,BufReadPost *.md set filetype=markdown
  au BufEnter org set syntax=org
  au Filetype pov set syntax=fortran
  au Filetype gplot,gp set syntax=gnuplot
  au Filetype applescript,osa set syntax=applescript
endif

" TODO: Add cpreproc filetype to c, cpp, f, f90 filetypes with .
"       to improve snippet handling of preprocessing syntax
let s:extfname = expand("%:e")
if s:extfname ==? "f" 
  let fortran_fixed_source=1
  unlet! fortran_free_source
else
  let fortran_free_source=1
  let fortran_have_tabs=1
  let fortran_more_precise=1
  unlet! fortran_fixed_source
endif

" TeX indentexpr function, GetTexIndent() drives me crazy
if s:extfname ==? "tex" 
  filetype indent off
  set iskeyword=@,48-58
  let g:LatexBox_split_type="new"
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

set iskeyword+=_

au FileType * exec( "setlocal dictionary+=" . 
      \ $HOME . "/.vim/dictionaries/".expand('<amatch>'))
set complete+=k

let asyncfile = &backupdir . '/scratch'

" From http://vim.wikia.com/wiki/Capture_ex_command_output
function! TabMess(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  setlocal buftype=nowrite bufhidden=unload noswapfile
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMess call TabMess(<q-args>)

command! -nargs=1 -complete=shellcmd TabMessage tabnew 
      \ | setlocal buftype=nowrite bufhidden=unload noswapfile 
      \ | execute ':read !'.<q-args>

command! -nargs=1 -complete=shellcmd Async
      \ | execute ':!' . <q-args> . ' > ' . asyncfile . ' & '

command! AsyncTab tabnew
      \ | setlocal buftype=nowrite bufhidden=unload noswapfile 
      \ | execute ':read ' . asyncfile

command! -nargs=1 -complete=shellcmd S 
      \ | execute ':silent !'.<q-args>
      \ | execute ':redraw!'

"" Group Closing
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

"inoremap <expr> )  
"    \ strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap '<space> '  '<Left><Left>
" inoremap "<space> "  "<Left><Left>
" Common in programming 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-x><C-t> :Tabularize /=<C-j>
vnoremap <C-x><C-t> :Tabularize /=<C-j>
inoremap <C-x><C-t> :Tabularize /=<C-j>

nnoremap <C-x><C-g> :Tabularize /
vnoremap <C-x><C-g> :Tabularize /
inoremap <C-x><C-g> :Tabularize /

" Speed up paging
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" EMACS keybindings for insert mode
inoremap §     <C-[>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <C-o>gj
inoremap <C-p> <C-o>gk
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-k> <C-o>D
inoremap <C-q> <C-k>
inoremap <C-u> <C-o>d0
inoremap <C-y> <C-r>
inoremap <C-r> <C-o>F
inoremap <C-d> <delete>
"inoremap <C-l> <C-o><C-r> 
"inoremap <C-z> <C-o>u

inoremap <C-t> <C-o>x<C-o>p
inoremap <C-s> <C-o>f
"inoremap <Return> <C-j>
inoremap <C-x><C-a> <C-a> 
inoremap <C-x><C-b> <C-d> 
inoremap <C-x><C-t> <C-t> 
" EMACS keybindings for command line mode 
cnoremap <C-x>      <C-f>
cnoremap <C-y>      <C-r>
cnoremap <C-r>      <C-f><C-[>F
cnoremap <C-s>      <C-f><C-[>s
cnoremap <C-f>      <right>
cnoremap <C-b>      <left>
cnoremap <C-a>      <Home>
cnoremap <C-d>      <delete>
cnoremap <C-p>      <up>
cnoremap <C-n>      <down>
cnoremap <C-q>      <C-k>
cnoremap <C-k>      <C-f><C-[>C<C-c>
cnoremap <C-x><C-a> <C-a>

" Shows tabs and trailing spaces
set listchars=tab:>-,trail:_,eol:$
nmap <silent> <leader>s :set nolist!<CR>
" Perform macro for common python calculation
nmap <silent> <leader>q :r!python -c 'print <C-r><C-w> 
nmap <leader>; :
nmap <leader>t :!
nmap <leader>m :TabMessage 
nmap <leader>M :!AsyncTab
nmap <leader>A :!Async
nmap <leader>S :!S
nmap <leader>e :set spell<C-j>
nmap <leader>E :set nospell<C-j>
nmap <leader>l :!lualatex %<C-j>
nmap <leader>z :!pdflatex %<C-j>
nmap <leader>p :!python %<C-j>
nmap <leader>o :!open
nmap <leader>f :!open .<C-j>
nmap <leader>w :w<C-j>
nmap <leader>q :q
nmap <leader>x :x
nmap <leader>c :!pwd |
nmap <leader>k :<C-p>

" Remap old sourcing
nmap <silent> <leader>r :source ~/.vimrc<C-j>

" Copy path to clipboard
" nmap <silent> <leader>p :!pwd | pbcopy
" nmap <silent> <leader>p :!pwd | xclip
" Show matches with highlight. Turn off highlight with :noh
set hlsearch
" Highlight matches as search is being typed.
set incsearch
" <mapleader>n :silent :nohlsearch<CR> all turn off highlight like :noh
nmap <silent> <leader>h :silent :nohlsearch<CR>


set showmatch
set matchtime=0

set printoptions=paper:letter

set tags=tags;~/

set timeoutlen=500

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

autocmd BufEnter *.py set ai sw=2 ts=2 sta et fo=croql

" Allows .tex files to be recognized as tex and not awful plaintex
let g:tex_flavor="latex"

"setlocal spell spelllang=en_us
if $TERM == "dumb"
  colorscheme default
elseif $ITERM_BG == "light"
  colo light_lichen
else
  set t_Co=256
  colo lichen
endif

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

" Allows for system clipboard pasted text to not be butchered by
" builtin autoindent.
set pastetoggle=<F2>

""command! -nargs=* -complete=shellcmd S new | 
""      \ setlocal buftype=nofile bufhidden=hide noswapfile |
""      \ r !<args>

"" 
" http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

let g:markdown_fenced_languages = [
    \ 'css', 'erb=eruby', 'javascript', 'js=javascript', 
    \ 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'fortran',
    \ 'python', 'py=python', 'f90=fortran', 'C=c','cpp', 'c', 'matlab',
    \ 'go', 'julia', 'perl', 'vim', 'haskell', 'lisp', 'awk', 'bash=sh', 
    \ 'sh'
\ ]
" DEPRECATED
" For using vim as a manpager:
"$PAGER=''

" More natural for traversing lines that span more than one vertical space.
" map j gj
" map k gk
"
" Shows info about line, column and positional info in bottom right corner.
" set ruler
"
set noacd
