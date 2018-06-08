" タブ幅
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" インデント
set autoindent
"set cindent
set smartindent

" ファイルタイプ別の設定
autocmd FileType
    \ css,javascript,php,html,xml
    \ setlocal sw=2 sts=2 ts=2

autocmd FileType make setlocal noexpandtab
