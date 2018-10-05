" dein.vimによるプラグイン管理

" プラグインのインストール先
let s:dein_dir = expand('~/.vim/dein')

" dein.vim本体のインストール先
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  " dein.vimがなければダウンロード
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    " Vim 8.0以下の場合はdein.vim 1.5に切り替え
    if v:version < 800
      execute '!git -C ' s:dein_repo_dir 'checkout -b vim7-compat 1.5'
    endif
  endif
  " dein.vim本体をruntimepathに追加
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vimの設定
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('briancollins/vim-jst')
  call dein#add('majutsushi/tagbar')
  call dein#add('markwu/largefile')
  call dein#add('vim-scripts/ifdef-highlighting')
  call dein#add('vim-scripts/AnsiEsc.vim')
  call dein#add('vim-jp/vim-cpp')

  if executable('cscope')
    call dein#add('vim-scripts/cscope.vim')
  endif

  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif
