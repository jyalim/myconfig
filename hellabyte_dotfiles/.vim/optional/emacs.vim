" EMACS keybindings for insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <C-o>gj
inoremap <C-p> <C-o>gk
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-k> <C-o>D
inoremap <C-q> <C-k>
inoremap <C-u> <C-o>d0
inoremap <C-.> <C-r>
inoremap <C-r> <C-o>F
inoremap <C-d> <delete>

inoremap <C-t> <C-o>x<C-o>p
inoremap <C-s> <C-o>f
inoremap <C-x><C-a> <C-a> 
inoremap <C-x><C-b> <C-d> 
inoremap <C-x><C-e> <C-e> 
inoremap <C-x><C-y> <C-y> 
inoremap <C-x><C-t> <C-t> 
 
" EMACS keybindings for command line mode 
cnoremap <C-x>      <C-f>
cnoremap <C-.>      <C-r>
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
