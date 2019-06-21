" Enable vim-indent-guides at startup.
let g:indent_guides_enable_on_vim_startup=1

" Depth to start coloring indents.
let g:indent_guides_start_level = 2

" Width to start coloring indents.
let g:indent_guides_guide_size = 1

" Disabled the default color scheme.
let g:indent_guides_auto_colors=0

" Custom color scheme.
hi IndentGuidesOdd  ctermbg=194
hi IndentGuidesEven ctermbg=151
