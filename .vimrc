set number
syntax on
set tabstop=4
set wrap
map q <Nop>
filetype plugin indent on
set rnu
" Map key chord `jk` to <Esc>.
" (replaced with `ne`)
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='n' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='e' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> n JKescape('n')
inoremap <expr> e JKescape('e')
