execute pathogen#infect()
syntax on
hi Search ctermbg=Red
filetype plugin indent on
set nocompatible
set smartcase
set splitbelow
set splitright
set number
set tabstop=2 shiftwidth=2 softtabstop=0 expandtab smarttab
set clipboard=unnamed
let mapleader=","
set showcmd
set notermguicolors
colorscheme breezy
set wildignore=*.o,*.a,*.so,*.pyc,*.swp,.git,.git/*,*.class,*/target/*,.idea/
autocmd BufWritePre * %s/\s\+$//e
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set rtp+=~/.fzf
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Hack to copy to OSX clipboard
map <leader>y :w ! pbcopy

" Golang
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
