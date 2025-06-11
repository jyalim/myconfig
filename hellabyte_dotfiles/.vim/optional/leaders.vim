nmap <silent> <leader>e :set nolist!<CR>
" Perform macro for common python calculation
nmap <silent> <leader>q :r!python -c 'print <C-r><C-w> 
nmap <leader>; :
nmap <leader>c :!
nmap <leader>t :r!date '+\%H:\%M:\%S '<C-j>
nmap <leader>T :r!date '+\%Y-\%m-\%dT\%H:\%M:\%S '<C-j>
nmap <leader>n :set invrnu<C-j>
nmap <leader>A :!Async
" useful for TeX files 
nmap <leader>S :syntax spell toplevel<C-j> 
nmap <leader>s :set invspell<C-j>
nmap <leader>l :!lualatex %<C-j>
nmap <leader>z :!pdflatex %<C-j>
nmap <leader>p :!/usr/bin/env python %<C-j>
nmap <leader>o :!open
nmap <leader>f :!open .<C-j>
nmap <leader>w :w<C-j>
nmap <leader>q :q
nmap <leader>x :x
nmap <leader>X :!%<C-j>
" change directory to path of current file (useful after using buffer)
nmap <leader>C :cd %:p:h
nmap <leader>k :<C-p>

" Remap old sourcing
nmap <silent> <leader>r :source ~/.vimrc<C-j>

nmap <silent> <leader>h :silent :set invhlsearch<CR>
