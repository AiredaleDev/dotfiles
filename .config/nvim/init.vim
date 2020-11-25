call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ziglang/zig.vim'
call plug#end()

syntax on
set nu
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set wildmenu
set wildmode=list:longest,full

colo nord
let g:airline_theme='nord'

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
		silent vertical resize 35
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-n> :call ToggleNetrw()<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

