" Vimのバージョンに応じたプラグイン管理
if v:version < 704
  source ~/.vimrc.d/plugins/neobundle.vimrc
else
  " Vim 7.4の場合は~/.vim/dein/repos/github.com/Shougo/dein.vimで
  " dein 1.5をチェックアウト
  source ~/.vimrc.d/plugins/dein.vimrc
endif

" プラグイン固有の設定を読み込む
source ~/.vimrc.d/plugins/neocomplcache.vimrc
source ~/.vimrc.d/plugins/vim-indent-guides.vimrc
source ~/.vimrc.d/plugins/largefile.vimrc

if executable('cscope')
  source ~/.vimrc.d/plugins/cscope.vimrc
endif
