" dein.vimによるプラグイン管理

" プラグインのインストール先
let s:dein_dir = expand('~/.vim/dein')

" dein.vim本体のインストール先
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  " dein.vimがなければダウンロード
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  " dein.vim本体をruntimepathに追加
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vimの設定
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('briancollins/vim-jst')
  call dein#add('majutsushi/tagbar')
  call dein#add('markwu/largefile')
  call dein#add('brookhong/cscope.vim')
  call dein#add('vim-scripts/ifdef-highlighting')
  call dein#add('vim-scripts/AnsiEsc.vim')

  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインをインストール
if dein#check_install()
  call dein#install()
endif

" プラグイン固有の設定を読み込む
source ~/.vimrc.d/plugins/neocomplcache.vimrc
source ~/.vimrc.d/plugins/cscope.vimrc
source ~/.vimrc.d/plugins/vim-indent-guides.vimrc
source ~/.vimrc.d/plugins/largefile.vimrc

