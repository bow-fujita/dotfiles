" dein.vimによるプラグイン管理
source ~/.vimrc.d/plugins/dein.vimrc

" プラグイン固有の設定を読み込む
source ~/.vimrc.d/plugins/neocomplcache.vimrc
source ~/.vimrc.d/plugins/vim-indent-guides.vimrc
source ~/.vimrc.d/plugins/largefile.vimrc

if executable('cscope')
  source ~/.vimrc.d/plugins/cscope.vimrc
endif
