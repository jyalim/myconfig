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
" SOURCE: https://github.com/jyalim/myconfig
" =====================================================================

let s:extfname = expand("%:e")
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

let asyncfile = &backupdir . '/scratch'

" Speed up paging
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

source ~/.vim/optional/centralize-state.vim
source ~/.vim/optional/colors.vim
source ~/.vim/optional/color-column.vim
source ~/.vim/optional/fortran.vim
source ~/.vim/optional/group-closing.vim
source ~/.vim/optional/emacs.vim
source ~/.vim/optional/leaders.vim
source ~/.vim/optional/tex.vim
source ~/.vim/optional/markdown.vim
source ~/.vim/optional/visual-multi-cursors.vim
source ~/.vim/optional/omnicomplete.vim
source ~/.vim/optional/linebreaks.vim
source ~/.vim/optional/syntax-highlighting.vim
source ~/.vim/optional/ics.vim

" Shows tabs and trailing spaces
set listchars=tab:>-,trail:_,eol:$

" Copy path to clipboard
" nmap <silent> <leader>p :!pwd | pbcopy
" nmap <silent> <leader>p :!pwd | xclip
" Show matches with highlight. Turn off highlight with :noh
set hlsearch
" Highlight matches as search is being typed.
set incsearch

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

"setlocal spell spelllang=en_us

" For using vim as a manpager:
"$PAGER=''

" Shows info about line, column and positional info in bottom right corner.
" set ruler

set noacd

