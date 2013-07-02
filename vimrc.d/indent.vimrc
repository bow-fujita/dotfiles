" タブ幅
set shiftwidth=4
set tabstop=4
set softtabstop=0

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
autocmd FileType coffee		setlocal sw=2 sts=2 ts=2 et
autocmd FileType css		setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss		setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType php		setlocal sw=2 sts=2 ts=2 et
autocmd FileType ruby		setlocal sw=2 sts=2 ts=2 et
autocmd FileType xhtml		setlocal sw=2 sts=2 ts=2 et
autocmd FileType xml		setlocal sw=2 sts=2 ts=2 et


