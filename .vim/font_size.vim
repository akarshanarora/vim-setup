nnoremap <S-F12> :call FontSizeMinus()<CR>
nnoremap <F12> :call FontSizePlus()<CR>
nnoremap <C-ScrollWheelUp> :call FontSizePlus()<CR>
nnoremap <C-ScrollWheelDown> :call FontSizeMinus()<CR>
function! FontSizePlus ()
  let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole + 1
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
endfunction

function! FontSizeMinus ()
  let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
  let l:gf_size_whole = l:gf_size_whole - 1
  let l:new_font_size = ' '.l:gf_size_whole
  let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
endfunction

