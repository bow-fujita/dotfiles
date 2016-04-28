" 構文ハイライト表示
syntax on

" ファイルタイプ別の設定
autocmd BufNewFile,BufRead *.ejs set filetype=html

" 構文解析の検索範囲を制限
autocmd FileType * syntax sync minlines=1000 maxlines=3000
