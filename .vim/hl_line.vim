command! Hca call s:clear_all()
command! PrintHLL call s:print_hll_color()
nnoremap <silent> <Leader>kk :call Highlight_line()<CR>
nnoremap <silent> <Leader>ka :call Incr_set_hll_color_id()<CR>
nnoremap <silent> <Leader>kx :call Decr_set_hll_color_id()<CR>

if !exists("g:set_hll_color_id")
    let g:set_hll_color_id = 0
endif

function! Highlight_line()

    let l:cln = line(".")
    let l:id = s:check_in_hl_list(l:cln)
    if l:id
        call s:dehighlight_line(l:id)
    else
        call s:highlight_line(l:cln)
    endif
endfunction

function! Incr_set_hll_color_id()
    call s:incr_set_hll_color_id()
endfunction

function! Decr_set_hll_color_id()
    call s:decr_set_hll_color_id()
endfunction

function! s:set_hi_color()
    let l:hi_color_map = {}
    let l:hi_color_map[0] = 'White Red'
    let l:hi_color_map[1] = 'White Blue'
    return l:hi_color_map
endfunction

function! s:print_hll_color()
    echo s:set_hi_color()
    echo g:set_hll_color_id
endfunction

function! s:get_hi_color(id)
    return s:set_hi_color()[a:id]
endfunction

function! s:highlight_line(lnum)

    let l:hll_hi_color = s:get_hi_color(g:set_hll_color_id)
    let l:split_clr = split(l:hll_hi_color)
    let l:bg = split_clr[0]
    let l:fg = split_clr[1]

    exec 'hi HighCurrLine'.g:set_hll_color_id.' None gui=bold guibg='.l:bg.' guifg='.l:fg
    let w:m=matchaddpos('HighCurrLine'.g:set_hll_color_id, [a:lnum])

endfunction

function! s:check_in_hl_list(val)
    for val in getmatches()
        if val['group'] =~ 'HighCurrLine'
            if a:val == val['pos1'][0]
                return val['id']
            endif
        endif
    endfor
    return 0
endfunction

function! s:dehighlight_line(id)
    call matchdelete(a:id)
endfunction

function! s:hi_color_min_max_id()
    let l:max = max(keys(s:set_hi_color()))
    let l:min = min(keys(s:set_hi_color()))
    return [l:min, l:max]
endfunction

function! s:incr_set_hll_color_id()
    let [l:min, l:max] = s:hi_color_min_max_id()
    let g:set_hll_color_id = g:set_hll_color_id + 1
    if g:set_hll_color_id > l:max
       let g:set_hll_color_id = l:min
    endif
    echo g:set_hll_color_id

endfunction

function! s:decr_set_hll_color_id()
    let [l:min, l:max] = s:hi_color_min_max_id()
    let g:set_hll_color_id = g:set_hll_color_id - 1
    if g:set_hll_color_id < l:min
       let g:set_hll_color_id = l:max
    endif
    echo g:set_hll_color_id

endfunction

function! s:clear_all()
    for val in getmatches()
        if val['group'] =~ 'HighCurrLine'
            call s:dehighlight_line(val['id'])
        endif
    endfor
endfunction
