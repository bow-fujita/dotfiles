" AutoComplPopを無効化（競合防止）
let g:acp_enableAtStartup = 0

" 起動時にNeoComplCacheを有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplcache_enable_smart_case = 1

" アンダースコア区切りの保管を有効化
let g:neocomplcache_enable_underbar_completion = 1

" 表示される補完候補の数（デフォルト100）
let g:neocomplcache_max_list = 20

" ハイフン入力による候補番号の表示
let g:neocomplcache_enable_quick_match = 1

" ファイルタイプ毎にディクショナリを設定
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default': '',
\ 'c': $HOME.'/.vim/dict/c.dict',
\ 'cpp': $HOME.'/.vim/dict/cpp.dict',
\ 'javascript': $HOME.'/.vim/dict/js.dict',
\ 'php': $HOME.'/.vim/dict/php.dict',
\ 'vm': $HOME.'/.vim/dict/vim.dict',
\ 'vimshell': $HOME.'/.vimshell_hist'
\ }

" ポップアップ保管の配色
hi Pmenu ctermbg=250 guibg=250
hi PmenuSel ctermbg=150 guibg=150
hi PmenuSbar ctermbg=150 guibg=150
hi PmenuThumb ctermbg=0 guibg=0

" Tab補完
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" <BS>でポップアップ非表示
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

