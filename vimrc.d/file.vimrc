" Set the default character encoding.
set encoding=utf-8

" Disable auto backup.
set nobackup

" Enable auto reload.
set autoread

" Don't create *.swp.
set noswapfile

" Trim all trailing spaces upon saving.
function! TrimTrailingSpaces()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call TrimTrailingSpaces()
