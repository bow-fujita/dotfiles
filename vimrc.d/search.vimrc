" Back to the top if a matched string reaches the bottom.
set wrapscan

" Enable incremental search.
set incsearch

" Enable case-insensitive search.
set ignorecase

" Enable case-sensitive search if keyword includes upper-case character.
set smartcase

" Highlight matched string.
set hlsearch

" Background color of matched string.
hi Search ctermbg=250

" Clear highlight upon <Esc><Esc>.
nmap <Esc><Esc> :nohlsearch<CR><Esc>
