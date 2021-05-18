"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Akarshan Arora(akarshanarora@gmail.com)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256   " This is may or may not needed.
set background=light
colorscheme PaperColor

" GUI
set guioptions+=a
set guioptions+=b
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Courier\ 10\ Pitch\ 14

" Status Line
set laststatus=2
set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %F\ \ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c
