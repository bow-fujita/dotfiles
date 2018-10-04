" AutoComplPopを無効化（競合防止）
let g:acp_enableAtStartup=0

" 起動時にNeoCompleteを有効化
let g:neocomplete#enable_at_startup=1

" 大文字が入力されるまで大文字小文字を区別しない
let g:neocomplete#enable_smart_case=1

" 3文字以上でポップアップ補完を開始
let g:neocomplete#sources#syntax#min_keyword_length=3

" 辞書の定義
let g:neocomplete#sources#dictionary#dictionaries={ 'default': '' }

" キーワードの定義
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

" ポップアップ補完の配色
hi Pmenu ctermbg=250
hi PmenuSel ctermbg=150
hi PmenuSbar ctermbg=150
hi PmenuThumb ctermbg=0

" Tab補完
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" <BS>でポップアップ非表示
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

