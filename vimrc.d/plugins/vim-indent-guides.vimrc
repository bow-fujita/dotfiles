" 起動時にvim-indent-guidesを有効化
let g:indent_guides_enable_on_vim_startup=1

" 最初にインデントを色付けする深さ
let g:indent_guides_start_level = 2

" インデントを色付けする幅
let g:indent_guides_guide_size = 1

" デフォルトのカラースキームを無効化
let g:indent_guides_auto_colors=0

" カラースキームのカスタマイズ
hi IndentGuidesOdd  ctermbg=194
hi IndentGuidesEven ctermbg=151
