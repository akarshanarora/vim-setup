nnoremap <silent> <Leader>r :call Disco_light()<CR>
function! Disco_light()
py3 << BEGIN_PY3

import vim
import time
import random
import math

COLOR = ['red', 'yellow', 'green', 'cyan']
STYLE = ['bold', 'underline', 'strikethrough']

cw = vim.current.window
cb = vim.current.buffer

vim.command("normal H")
tlnum, tlcol = cw.cursor
vim.command("normal L")
blnum, blcol = cw.cursor


max_width = 0
for id in range(tlnum-1, blnum):
    if max_width < len(cb[id]):
        max_width = len(cb[id])

#while 1:
#    ran_lnum = random.choices(range(tlnum, blnum))[0]
#    ran_cnum = random.choices(range(math.floor(max_width/2)))[0]
#    print(ran_lnum, ran_cnum)
#    color_str1 = 'guifg=\'' + random.choice(COLOR) + '\' ' +\
#                 'guibg=\'' + random.choice(COLOR) + '\' ' +\
#                 'gui=\'' + random.choice(STYLE) + '\''
#    vim.command('hi Fun1 '+color_str1)
#    vim.command('match Fun1 /\%>'+str(ran_cnum)+'v\&\%'+str(ran_lnum)+'l/')
#    vim.command('redraw')
#    time.sleep(0.5)

for i in range(max_width):
# write function
    color_str1 = 'guifg=\'' + random.choice(COLOR) + '\' ' +\
                 'guibg=\'' + random.choice(COLOR) + '\' ' +\
                 'gui=\'' + random.choice(STYLE) + '\''
    color_str2 = 'guifg=\'' + random.choice(COLOR) + '\' ' +\
                 'guibg=\'' + random.choice(COLOR) + '\' ' +\
                 'gui=\'' + random.choice(STYLE) + '\''
    vim.command('hi Fun1 '+color_str1)
    vim.command('match Fun1 /\%>'+str(i)+'v/')
    vim.command('hi Fun2 '+color_str2)
    vim.command('2match Fun2 /\%<'+str(i)+'v/')
    #vim.command('hi Normal None')
    vim.command('redraw')
    time.sleep(0.5)

#vim.command('hi Fun guifg=fg guibg=bg gui=bold')
#vim.command('match Fun /.\+/')
#while 1:
#    for i in range(5):
#        rand_color = random.choices(COLOR)[0]
#        vim.command('hi Fun guifg=bg guibg=bg')
#        vim.command('hi Cursor guifg=bg guibg=bg')
#        vim.command('redraw')
#        time.sleep(1.0)
#        vim.command('hi Fun guifg='+rand_color)
#        vim.command('hi Cursor guifg='+rand_color)
#        vim.command('redraw')
#        time.sleep(1.0)

BEGIN_PY3
endfunction
