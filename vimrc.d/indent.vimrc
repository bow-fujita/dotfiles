" タブ幅
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" インデント
set autoindent
"set cindent
set smartindent

" 分割したウィンドウ間の移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" ファイルタイプ別の設定
autocmd FileType
    \ css,javascript,php,html,xml
    \ setlocal sw=2 sts=2 ts=2

