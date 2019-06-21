" Enable 256-colors.
set t_Co=256

" Use the default color scheme.
colorscheme default

" Disable auto wrap.
set textwidth=0

" Show line number.
set number

" Show command.
set showcmd

" Show mode.
set showmode

" Show the status line always.
set laststatus=2

" Show command line completion.
set wildmenu

" Enable filename completion in the status line.
set wildmode=list:longest

" Patterns to be ignored in filename completion.
set wildignore=*.d,*.o,*.ko,*.lo,*.gcda,*.gcno

" Show ruler.
set ruler

" Offset lines during scroll.
set scrolloff=5

" Disable highlighting matched parentheses.
let loaded_matchparen=1

" Save cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Shortcut keys to move around split windows.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Highlight the cursor line only in active window.
set cursorline
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine ctermbg=253

" Toggle TagList by <F8>.
nnoremap <silent> <F8> :TlistToggle<CR>

" Adjust QuickFix window hight.
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

" Open QuickFix windows upon make.
autocmd QuickFixCmdPost make cwindow

" Background color for completion prompt.
hi Pmenu ctermbg=250
hi PmenuSel ctermbg=150
hi PmenuSbar ctermbg=150
hi PmenuThumb ctermbg=0

" Select completion by <Tab>.
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
