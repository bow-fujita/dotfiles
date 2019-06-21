" Make Vim behave in more useful way.
if &compatible
  set nocompatible
endif

" Replace mapleader with ",".
let mapleader=","

source ~/.vimrc.d/plugins.vimrc

source ~/.vimrc.d/syntax.vimrc

source ~/.vimrc.d/window.vimrc

source ~/.vimrc.d/file.vimrc

source ~/.vimrc.d/indent.vimrc

source ~/.vimrc.d/search.vimrc

" Use the unnamed register to exchange data between Vim and OS.
set clipboard+=unnamed

" Neither beep nor flash is needed.
set vb t_vb=

