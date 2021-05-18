" Vim color file
" Maintainer:	AKarshan Arora

" This color scheme uses SeaGreen background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "greenery"

hi Normal ctermfg=7 ctermbg=22 guifg=White guibg=SeaGreen

" Groups used in the 'highlight' and 'guicursor' options default value.
hi  ErrorMsg      term=standout        ctermbg=DarkRed       ctermfg=White       guibg=Red        guifg=White
hi  IncSearch     term=reverse         cterm=reverse         gui=reverse
hi  ModeMsg       cterm=bold           gui=bold
hi  VertSplit     term=reverse         cterm=reverse         gui=reverse
hi  Visual        term=reverse         ctermbg=black         guibg=grey60
hi  VisualNOS     term=underline,bold  cterm=underline,bold  gui=underline,bold
hi  DiffText      term=reverse         cterm=bold            ctermbg=Red         gui=bold         guibg=Red
hi  Cursor        cterm=reverse        guibg=white
hi  lCursor       guibg=white           guifg=Black
hi  Directory     term=bold            ctermfg=LightCyan     guifg=Cyan
hi  MoreMsg       term=bold            cterm=bold            ctermfg=fg          gui=bold         guifg=fg
hi  NonText       guifg=White          guibg=SeaGreen
hi  Question      term=standout        cterm=bold            ctermfg=fg          gui=bold         guifg=fg
hi  Search        term=reverse         ctermbg=Yellow        ctermfg=Black       guibg=Yellow     guifg=Black
hi  SpecialKey    term=bold            ctermfg=LightBlue     guifg=Cyan
hi  Title         term=bold            ctermfg=LightMagenta  gui=bold            guifg=Magenta
hi  WarningMsg    term=standout        ctermfg=LightRed      guifg=Red
hi  WildMenu      term=standout        ctermbg=Yellow        ctermfg=Black       guibg=Yellow     guifg=Black
hi  Folded        term=standout        ctermbg=LightGrey     ctermfg=DarkBlue    guibg=LightGrey  guifg=DarkBlue
hi  FoldColumn    term=standout        ctermbg=LightGrey     ctermfg=DarkBlue    guibg=Grey       guifg=DarkBlue
hi  DiffAdd       term=bold            ctermbg=DarkBlue      guibg=DarkBlue
hi  DiffChange    term=bold            ctermbg=DarkMagenta   guibg=DarkMagenta
hi  DiffDelete    term=bold            ctermfg=Blue          ctermbg=DarkCyan    gui=bold         guifg=Blue      guibg=DarkCyan
hi  CursorColumn  term=reverse         cterm=reverse         ctermbg=Black       guibg=grey40
hi  CursorLine    term=underline       cterm=underline       guibg=grey40
hi  StatusLine    cterm=reverse        ctermfg=Yellow
hi  StatusLineNC  cterm=reverse        ctermfg=Yellow
hi  StatusLineNR  cterm=reverse        ctermfg=Yellow
hi  LineNR        ctermfg=fg           ctermbg=bg
hi  Type          guifg=yellow

" Groups for syntax highlighting
hi Comment  ctermfg=172 gui=Bold guifg=Orange
hi Constant ctermfg=7 guifg=Violet gui=Bold
hi Special  ctermfg=LightRed guifg=Grey gui=Bold
hi Identifier  gui=Bold guifg=DarkGray
hi Statement  ctermfg=Yellow guifg=Yellow
hi! link PreProc Identifier
hi Ignore  ctermfg=DarkGrey guifg=grey20
hi Error  ctermfg=Red guifg=Red
hi Warn  ctermfg=172 guifg=Orange
hi ExtraWhitespace ctermfg=Black ctermbg=Red guifg=Black guibg=Red

" vim: sw=2
