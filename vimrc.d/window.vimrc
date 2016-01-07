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
set wildignore=*.o,*.ko,*.lo,*.gcda,*.gcno

" ルーラーを表示
set ruler

" スクロール時のラップ行数
set scrolloff=5

" 対応する括弧のハイライト表示を抑止
let loaded_matchparen=1

" 前回終了したカーソル位置を記憶
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" フォーカスのあるウィンドウのみカーソル行をハイライト
set cursorline
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine ctermbg=253 guibg=253
