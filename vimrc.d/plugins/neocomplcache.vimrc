" AutoComplPopを無効化（競合防止）
let g:acp_enableAtStartup=0

" 起動時にNeoComplCacheを有効化
let g:neocomplcache_enable_at_startup=1

" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplcache_enable_smart_case=1

" アンダースコア区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion=1

" 表示される補完候補の数（デフォルト100）
let g:neocomplcache_max_list=20

" <BS>でポップアップ非表示
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

