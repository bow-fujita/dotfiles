" AutoComplPopを無効化（競合防止）
let g:acp_enableAtStartup=0

" 起動時にNeoCompleteを有効化
let g:neocomplete#enable_at_startup=1

" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplete#enable_smart_case=1

" 表示される補完候補の数（デフォルト100）
let g:neocomplete#max_list=20

" 3文字以上でポップアップ補完を開始
let g:neocomplete#sources#syntax#min_keyword_length=3

" 辞書の定義
let g:neocomplete#sources#dictionary#dictionaries={ 'default': '' }

" キーワードの定義
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

" <BS>でポップアップ非表示
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

