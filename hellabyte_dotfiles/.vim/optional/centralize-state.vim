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
