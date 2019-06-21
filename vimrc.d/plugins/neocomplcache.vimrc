" Disable AutoComplPop to avoid conflict with NeoComplCache.
let g:acp_enableAtStartup=0

" Enable NeoComplCache at startup.
let g:neocomplcache_enable_at_startup=1

" Ignore case until any upper-case character is typed.
let g:neocomplcache_enable_smart_case=1

" Keep completion enabled even if underscore is typed.
let g:neocomplcache_enable_underbar_completion=1

" The maximum number of candidates to display (Default: 100)
let g:neocomplcache_max_list=20

" Close the popup upon <BS>.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

