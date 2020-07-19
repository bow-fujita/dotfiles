" Tab width.
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Indent
set autoindent
set smartindent

" FileType specific configuration.
autocmd FileType
    \ css,javascript,php,html,xml,vue
    \ setlocal sw=2 sts=2 ts=2

autocmd FileType make setlocal noexpandtab
