let s:lang_cmnt={
       \ "tcl"    :'#',
       \ "conf"   :'#',
       \ "python" :'#',
       \ "pyrex"  :'#',
       \ "tcsh"   :'#',
       \ "bash"   :'#',
       \ "sh"     :'#',
       \ "skill"  :';',
       \ "vim"    :'"'
       \ }

vnoremap <silent> <Leader>, :call Quick_cmnt_block()<CR>
function! Quick_cmnt_block()
python3 << BEGIN_PYTHON

import vim

lang_cmnt = vim.eval('s:lang_cmnt')

r = vim.current.range
cb = vim.current.buffer

# Subs with get language type function
lang = cb.options['ft'].decode()
for id in range(r.start, r.end+1):
    if cb[id]:
        if cb[id][0] == lang_cmnt[lang]:
            cb[id] = cb[id].replace(lang_cmnt[lang], '', 1)
        else:
            cb[id] = lang_cmnt[lang]+cb[id]
BEGIN_PYTHON
endfunction

nnoremap <silent> <Leader>, :call Quick_cmnt_box_dynamic()<CR>
function! Quick_cmnt_box_dynamic()
python3 << BEGIN_PYTHON

import vim

lang_cmnt = vim.eval('s:lang_cmnt')

cw = vim.current.window
cb = vim.current.buffer

lnum, cnum = cw.cursor
total_lines = len(cb)

# Subs with get language type function
lang = cb.options['ft'].decode()

if (total_lines != lnum) and (lnum != 1) and (len(cb[lnum]) > 0):
    lnum = lnum-1
    pline = set(cb[lnum-1])
    nline = set(cb[lnum+1])
    fc = set(cb[lnum][0])
    lc = set(cb[lnum][-1])

    #create chk_cmnt_or_more function -> How to pass args to function using python mode
    plinebool = (True and (len(pline) == 1) and (pline == set(lang_cmnt[lang])))
    nlinebool = (True and (len(nline) == 1) and (nline == set(lang_cmnt[lang])))
    fcbool = (True and (len(fc) == 1) and (fc == set(lang_cmnt[lang])))
    lcbool = (True and (len(lc) == 1) and (lc == set(lang_cmnt[lang])))

    if plinebool and nlinebool and fcbool and lcbool:
        del cb[lnum-1]
        del cb[lnum]
        if not cb[lnum]:
            del cb[lnum]
        cb[lnum-1] = cb[lnum-1].replace(lang_cmnt[lang]+' ', '')
        cb[lnum-1] = cb[lnum-1].replace(' '+lang_cmnt[lang], '')

BEGIN_PYTHON
call Quick_cmnt_box()
endfunction

function! Quick_cmnt_box()
python3 << BEGIN_PYTHON

import vim

lang_cmnt = vim.eval('s:lang_cmnt')

cw = vim.current.window
cb = vim.current.buffer

lnum, cnum = cw.cursor
lnum = lnum-1

boxwidth = len(cb[lnum])+4

# Subs with get language type function
lang = cb.options['ft'].decode()
cb[lnum] = lang_cmnt[lang] + ' ' + cb[lnum] + ' ' + lang_cmnt[lang]
cb.append(lang_cmnt[lang]*boxwidth, lnum)
cb.append(lang_cmnt[lang]*boxwidth, lnum+2)
cb.append('', lnum+3)
cw.cursor = lnum+4, 0

BEGIN_PYTHON
endfunction

nnoremap <silent> <Leader>. :call Quick_cmnt_bridge()<CR>
function! Quick_cmnt_bridge()
python3 << BEGIN_PYTHON

import vim

lang_cmnt = vim.eval('s:lang_cmnt')

cw = vim.current.window
cb = vim.current.buffer

lnum, cnum = cw.cursor
lnum = lnum-1

# Subs with get language type function
lang = cb.options['ft'].decode()
cb[lnum] = lang_cmnt[lang] + '='*12 + '[' + cb[lnum] + ']' + '='*12 + lang_cmnt[lang]
cw.cursor = lnum+1, 0

BEGIN_PYTHON
endfunction
