" Enable syntax highlight.
syntax on

" FileType specific configuration.
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.make set filetype=make

" Limit the range to parse syntax to improve screen updating speed.
autocmd FileType * syntax sync minlines=1000 maxlines=3000
