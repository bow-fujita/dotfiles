" vi非互換
if &compatible
  set nocompatible
endif

" キーマップリーダーを,に
let mapleader=","

" プラグイン関連
source ~/.vimrc.d/plugins.vimrc

" シンタックス関連
source ~/.vimrc.d/syntax.vimrc

" 表示関連
source ~/.vimrc.d/window.vimrc

" ファイル関連
source ~/.vimrc.d/file.vimrc

" インデント関連
source ~/.vimrc.d/indent.vimrc

" 検索関連
source ~/.vimrc.d/search.vimrc

" OSのクリップボードを使用
set clipboard+=unnamed

" ヤンクしたものはOSのクリップボードに
set clipboard=unnamed

" ビープ音不要
set vb t_vb=

