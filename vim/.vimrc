set nocompatible
" Vundle
filetype off "for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'

call vundle#end()

syntax on
hi Search ctermbg=Red
filetype plugin indent on
set smartcase
set splitbelow
set splitright
set number
set tabstop=2 shiftwidth=2 softtabstop=0 expandtab smarttab
set clipboard=unnamed
let mapleader=","
set showcmd
set notermguicolors
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
