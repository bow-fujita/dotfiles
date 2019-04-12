" neobundle.vimによるプラグイン管理

" プラグインのインストール先
let s:neobundle_dir = expand('~/.vim/bundle/')

" neobundle.vim本体のインストール先
let s:neobundle_self_dir = s:neobundle_dir . 'neobundle.vim'

if &runtimepath !~# '/neobundle.vim'
  " neobundle.vimがなければダウンロード
  if !isdirectory(s:neobundle_self_dir)
    execute '!git clone https://github.com/Shougo/neobundle.vim' s:neobundle_self_dir
  endif
  " neobundle.vim本体をruntimepathに追加
  execute 'set runtimepath^=' . fnamemodify(s:neobundle_self_dir, ':p')
endif

" neobundle.vimの設定
call neobundle#begin(s:neobundle_dir)

" neobundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインの登録
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake'
\    }
\ }
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'markwu/largefile'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'

" シンタックスハイライト
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'vim-jp/vim-cpp'
NeoBundle 'vim-scripts/ifdef-highlighting'
NeoBundle 'vim-scripts/AnsiEsc.vim'

if executable('ctags')
  NeoBundle 'vim-scripts/taglist.vim'
endif
if executable('cscope')
  NeoBundle 'vim-scripts/cscope.vim'
endif

call neobundle#end()

filetype plugin indent on

" 未インストールのプラグインをインストール
NeoBundleCheck
