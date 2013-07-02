" 最後まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチ
set incsearch

" 大文字小文字無視
set ignorecase

" 検索文字に大文字が含まれている場合は大文字小文字区別
set smartcase

" 検索文字をハイライト
set hlsearch

" 検索文字の背景色
hi Search ctermbg=250 guibg=250

" Esc連打でハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>
