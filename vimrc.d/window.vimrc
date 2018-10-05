" ターミナル256色対応
set t_Co=256

" カラースキーム設定
colorscheme default

" 自動折り返し禁止
set textwidth=0

" 行番号表示
set number

" コマンドを表示
set showcmd

" モードを表示
set showmode

" 常にステータスラインを表示
set laststatus=2

" コマンドラインの補完表示
set wildmenu

" ステータスラインでのファイル名補完
set wildmode=list:longest

" ファイル名補完で無視するパターン
set wildignore=*.d,*.o,*.ko,*.lo,*.gcda,*.gcno

" ルーラーを表示
set ruler

" スクロール時のラップ行数
set scrolloff=5

" 対応する括弧のハイライト表示を抑止
let loaded_matchparen=1

" 前回終了したカーソル位置を記憶
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 分割したウィンドウ間の移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" フォーカスのあるウィンドウのみカーソル行をハイライト
set cursorline
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine ctermbg=253

" F8でTabbarの表示切り替え
nmap <F8> :TagbarToggle<CR>

" QuickFixウィンドウの高さを調整
" http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
autocmd FileType qf call AdjustWindowHeight(10, 15)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" make実行後に自動的にQuickFixウィンドウを開く
autocmd QuickFixCmdPost make cwindow

" ポップアップ補完の配色
hi Pmenu ctermbg=250
hi PmenuSel ctermbg=150
hi PmenuSbar ctermbg=150
hi PmenuThumb ctermbg=0

" Tab補完
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
