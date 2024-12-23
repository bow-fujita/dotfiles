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
      execute '!cd ' s:dein_repo_dir '; git checkout -b vim7-compat 1.5'
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
  call dein#add(s:dein_repo_dir)

  " Use deoplete for Vim >= 8.2
  if v:version >= 802
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  else
    if has('lua')
      call dein#add('Shougo/neocomplete.vim')
    else
      call dein#add('Shougo/neocomplcache.vim')
    endif
  endif
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('itchyny/lightline.vim')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('tpope/vim-fugitive')
  call dein#add('preservim/nerdtree')

  " Syntax highlight.
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('briancollins/vim-jst')
  call dein#add('posva/vim-vue')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('vim-jp/vim-cpp')
  call dein#add('vim-scripts/ifdef-highlighting')
  call dein#add('powerman/vim-plugin-AnsiEsc')

  if executable('ctags')
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
