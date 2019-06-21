" Use dein.vim for Vim package manager.

" Where to install plugins managed by dein.vim.
let s:dein_dir = expand('~/.vim/dein')

" Where to install dein.vim itself.
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  " Download dein.vim if it doesn't exist.
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    " Use v1.5 for Vim <= 8.0.
    if v:version < 800
      execute '!git -C ' s:dein_repo_dir 'checkout -b vim7-compat 1.5'
    endif
  endif
  " Add dein.vim to runtimepath.
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Configuration for dein.vim.
if dein#load_state(s:dein_dir)
  " Register plugins.
  call dein#begin(s:dein_dir)

  " Manage dein.vim itself.
  call dein#add('Shougo/dein.vim')

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('markwu/largefile')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " Syntax highlight.
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('briancollins/vim-jst')
  call dein#add('vim-jp/vim-cpp')
  call dein#add('vim-scripts/ifdef-highlighting')
  call dein#add('vim-scripts/AnsiEsc.vim')

  if executable('ctag')
    call dein#add('vim-scripts/taglist.vim')
  endif
  if executable('cscope')
    call dein#add('vim-scripts/cscope.vim')
  endif

  call dein#end()
  call dein#save_state()
endif

" Install all plugins not installed yet.
if dein#check_install()
  call dein#install()
endif
