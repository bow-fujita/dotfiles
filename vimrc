" vi非互換
set nocompatible

" キーマップリーダーを,に
let mapleader=","

" 表示関連
source ~/.vimrc.d/window.vimrc

" プラグイン関連
source ~/.vimrc.d/plugins.vimrc

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

