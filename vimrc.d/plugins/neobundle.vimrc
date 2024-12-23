" Use neobundle.vim for Vim package manager.

" Where to install plugins managed by neobundle.vim.
let s:neobundle_dir = expand('~/.vim/bundle/')

" Where to install neobundle.vim itself.
let s:neobundle_self_dir = s:neobundle_dir . 'neobundle.vim'

if &runtimepath !~# '/neobundle.vim'
  " Download neobundle.vim if it doesn't exist.
  if !isdirectory(s:neobundle_self_dir)
    execute '!git clone https://github.com/Shougo/neobundle.vim' s:neobundle_self_dir
  endif
  " Add neobundle.vim to runtimepath.
  execute 'set runtimepath^=' . fnamemodify(s:neobundle_self_dir, ':p')
endif

" Configuration for neobundle.vim.
call neobundle#begin(s:neobundle_dir)

" Manage neobundle itself.
NeoBundleFetch 'Shougo/neobundle.vim'

" Register plugins.
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'preservim/nerdtree'

" Syntax highlight.
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'posva/vim-vue'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'vim-jp/vim-cpp'
NeoBundle 'vim-scripts/ifdef-highlighting'
NeoBundle 'powerman/vim-plugin-AnsiEsc'

if executable('ctags')
  NeoBundle 'vim-scripts/taglist.vim'
endif
if executable('cscope')
  NeoBundle 'vim-scripts/cscope.vim'
endif

call neobundle#end()

filetype plugin indent on

" Install all plugins not installed yet.
NeoBundleCheck
