"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Akarshan Arora(akarshanarora@gmail.com)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Misc
nnoremap <silent> <F5> :source ~/.vimrc<ENTER>
nnoremap <silent> ; :
nnoremap <silent> j gj
nnoremap <silent> k gk
"nnoremap <silent> : ;
vnoremap <silent> ; :
"vnoremap <silent> : ;
inoremap <silent> jj <ESC>

set history=500
set selection=inclusive
set wrap
set mouse=a

" Path Setup
set path=.,**

" Buffer Traversals
nnoremap <silent> <c-n> :bnext<ENTER>
nnoremap <silent> <c-p> :bprev<ENTER>
nnoremap <silent> <c-LEFT> <c-w>h
nnoremap <silent> <c-RIGHT> <c-w>l
nnoremap <silent> <c-UP> <c-w>k
nnoremap <silent> <c-DOWN> <c-w>j
nnoremap <silent> <c-s-UP> <c-w>k<c-w>_
nnoremap <silent> <c-s-DOWN> <c-w>j<c-w>_

"" Tab Traversals
nnoremap <silent> <S-LEFT> :tabprevious<CR>
nnoremap <silent> <S-RIGHT> :tabnext<CR>

" Quick Config
nnoremap <silent> <c-s> :w!<ENTER>
inoremap <silent> <c-s> <esc>:w!<ENTER>
nnoremap <silent> <c-q> :q!<ENTER>
inoremap <silent> <c-q> <esc>:q!<ENTER>

" Command aliases
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "tab h" : "h"
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | execute 'normal! <c-w>T' | setlocal bt=nofile | put! a
command! -nargs=? Ls let @a=system('ls ltrH <args>') | new | execute 'normal! <c-w>T' | setlocal bt=nofile | put! a
command! -nargs=? Sme hi SameFGBG guifg=bg guibg=bg | match SameFGBG /^\(.*<args>\)\@!.*$/
command! -nargs=? Hme hi SameFGBG guifg=bg guibg=bg | match SameFGBG /.*<args>.*/
command! -nargs=? Sall hi SameFGBG None
command! -nargs=* Summe let data= substitute(getreg('*'),nr2char(10),"+",'g') | echo eval(data)<ENTER>

" Abbreviations
ab #def# (default: %(default)s)

" Vim Behavior
noremap <silent> <MiddleMouse> <LeftMouse><MiddleMouse>
set autoindent
set smartindent
set nocompatible
set tw=0
set shiftwidth=4
set st=4
set softtabstop=4
set et
filetype plugin on
set ve=all
"set scrolnlbind
"set scrolnloff=999
set shortmess=aoOtI
set wildmode=list
set visualbell
"set lines=35 columns=80

" filetype settings
au! BufNewFile,BufRead *.csv setf csv

" Quick Sanity Checks
nnoremap <silent> <Leader>ll :!ls -ltrH <cfile><ENTER>
nnoremap <silent> <Leader>cc <ESC>:set cursorcolumn!<ENTER>
nnoremap <silent> <Leader>cl <ESC>:set cursorline!<ENTER>

" Vim Explorer
nnoremap <silent> <c-E> <ESC><c-w><c-v>:Explore<ENTER>
nnoremap <silent> <Leader>e <ESC><c-w><c-v>:Explore<ENTER>
nnoremap <silent> <Leader>t <ESC>:terminal<ENTER>

" Ease of Use
nnoremap <silent> <SPACE> za
set foldmethod=indent
set foldlevel=99
set cmdheight=2
set showcmd
set showmatch
set showmode
set ttyfast
set bs=2
vnoremap < <gv
vnoremap > >gv

" Search
set ic
set hls
nohls
set incsearch

" Beautification
syntax on

hi Error None  ctermfg=Red gui=Bold guifg=Red
hi Warn  ctermfg=172 gui=Bold guifg=Orange
hi ExtraWhitespace ctermfg=Black ctermbg=Red guifg=Black guibg=Red
augroup custom_highlighting
    autocmd!
    autocmd BufNewFile,BufRead *.log* let w:m=matchadd('Error', '.*ERROR.\+', -1)
    autocmd BufNewFile,BufRead *.log* let w:m=matchadd('Warn', '.*WARN.\+', -1)
    autocmd BufNewFile,BufRead * let w:m=matchadd('ExtraWhitespace', '\s\+$', -1)
    "autocmd CursorMoved,CursorMovedI * let w:m=matchadd('under_cursor', '\k*\%#\k*')
    "autocmd BufNewFile,BufRead * let w:m=matchadd('py_def_class', '\(def\|class\) \zs\k\+', -1)
augroup END

" GUI
set guioptions+=a
set guioptions+=b
set guioptions-=m
set guioptions-=T
set guioptions-=r
set number
"set relativenumber
"set mouseshape=n:56
set guifont=Courier\ 10\ Pitch\ 14

" Plugin Options
source ~/.vim/font_size.vim
source ~/.vim/quick_cmnt.vim
source ~/.vim/disco_light.vim
source ~/.vim/hl_line.vim
source ~/.vim/hl_table.vim
source ~/.vim/templates.vim
