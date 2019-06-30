""" PYTHON SPECIFIC CONFIG OVERRIDES"""

set textwidth=79
set ts=4 sw=4 et

set autoindent

"c autowrap comments
"r auto-insert comment leader after hitting enter (when writing comments)
"j auto-remove comment leader when joining lines together
"q comment formatting
"l long lines are not automatically broken if inserted on
"1 break lines vefore 1-letter words
set fo=crqlj1
"disable autowrap (t)
set fo-=t

set colorcolumn=80
highlight ColorColumn ctermbg=88


nmap <F5> :w !chmod +x % && $(realpath %); chmod -x %<CR>
vmap <F4> :w !python3
" leaving this ------^ without <CR> so that I can specify version freely

