behave mswin 

set diffexpr=MyDiff() 

function MyDiff() 
	let opt = '-a --binary ' 
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif 
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif 
	let arg1 = v:fname_in 
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif 
	let arg2 = v:fname_new 
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif 
	let arg3 = v:fname_out 
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif 
	if $VIMRUNTIME =~ ' ' 
		if &sh =~ '\<cmd' 
			if empty(&shellxquote) 
				let l:shxq_sav = '' 
				set shellxquote& 
			endif 
			let cmd = '"' . $VIMRUNTIME . '\diff"' 
		else 
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"' 
		endif 
	else 
		let cmd = $VIMRUNTIME . '\diff' 
	endif 
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 
	if exists('l:shxq_sav') 
		let &shellxquote=l:shxq_sav 
	endif 
endfunction 


call plug#begin('C:\Users\Javier\.vim\bundle')
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'tpope/vim-vinegar'
Plug 'jreybert/vimagit'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
syntax on
filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_javascript_checkers = ['eslint']
