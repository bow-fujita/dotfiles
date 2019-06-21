" Disable AutoComplPop to avoid conflict with NeoComplete.
let g:acp_enableAtStartup=0

" Enable NeoComplete at startup.
let g:neocomplete#enable_at_startup=1

" Ignore case until any upper-case character is typed.
let g:neocomplete#enable_smart_case=1

" The maximum number of candidates to display (Default: 100)
let g:neocomplete#max_list=20

" Start showing the popup upon typing more than 3 characters.
let g:neocomplete#sources#syntax#min_keyword_length=3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries={ 'default': '' }

" Define keyword patterns.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

" Close the popup upon <BS>.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

