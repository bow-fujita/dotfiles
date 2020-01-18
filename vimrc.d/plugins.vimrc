" Switch Vim package manager according to Vim's version.
if v:version < 704
  source ~/.vimrc.d/plugins/neobundle.vimrc
else
  source ~/.vimrc.d/plugins/dein.vimrc
endif

" Load plugin specific scripts.
if v:version >= 704 && has('lua')
  source ~/.vimrc.d/plugins/neocomplete.vimrc
else
  source ~/.vimrc.d/plugins/neocomplcache.vimrc
endif
source ~/.vimrc.d/plugins/vim-indent-guides.vimrc
source ~/.vimrc.d/plugins/largefile.vimrc

if executable('cscope')
  source ~/.vimrc.d/plugins/cscope.vimrc
endif
