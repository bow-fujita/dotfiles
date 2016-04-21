" デフォルトのエンコーディング
set encoding=utf-8

" 自動バックアップ禁止
set nobackup

" 他で書き換えられたら自動反映
set autoread

" *.swpファイル不要
set noswapfile

" 保存時に行末の空白を除去
function! TrimTrailingSpaces()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call TrimTrailingSpaces()
