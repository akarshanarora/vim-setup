nnoremap <silent> <Leader>ht :call Highlight_table(1)<CR>
nnoremap <silent> <Leader>dht :call Highlight_table(0)<CR>
function! Highlight_table(cond)

    if a:cond == 0
        set updatetime=4000
        hi HighTable None
        augroup HighlightTable
        au! * <buffer>
        augroup END
    endif

    if a:cond == 1
        set updatetime=50
        augroup HighlightTable
        au! * <buffer>
        au CursorHold <buffer> call s:highlight_table_imp_vim()
        augroup END
    endif

endfunction

function! s:highlight_table_imp_py()
py3 << BEGIN_PYTHON

import vim

cb = vim.current.buffer
cw = vim.current.window

total_lines = len(cb)

clnum, clcol = cw.cursor
vim.command("normal H")
tlnum, tlcol = cw.cursor
vim.command("normal L")
blnum, blcol = cw.cursor

vim.command('syn off')
vim.command('hi HighTable gui=reverse')

pattern = ''
pattern += '/\%2l'
for id in range(tlnum, blnum+1):
    if id % 2 == 0:
        pattern += '\|\%'+str(id)+'l'
pattern += '/'

vim.command('match HighTable '+pattern)

cw.cursor = clnum, clcol

BEGIN_PYTHON
endfunction

function! s:highlight_table_imp_vim()

syn off
hi HighTable gui=reverse,bold

let l:save_curr_pos = getpos(".")
normal H
let l:tlnum = line(".")
normal L
let l:blnum = line(".")
let l:lrange = range(tlnum, blnum)

let l:pattern = ''
let l:pattern2 = ''
let l:pattern = l:pattern.'/\%'.l:lrange[0].'l'
let l:pattern2_start = l:lrange[0]+1
let l:pattern2 = l:pattern2.'/\%'.l:pattern2_start.'l'
let l:count = 0
for l:id in l:lrange
    if len(getline(l:id)) != 0
        if l:count%2 == 0
            let l:pattern = l:pattern.'\|\%'.l:id.'l'
        else
            let l:pattern2 = l:pattern2.'\|\%'.l:id.'l'
        endif
    endif
    let l:count = l:count+1
endfor
let l:pattern = l:pattern.'/'
let l:pattern2 = l:pattern2.'/'
exec 'match HighTable '.l:pattern

call setpos(".", l:save_curr_pos)

endfunction
