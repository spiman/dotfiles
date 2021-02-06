set nocompatible
" Vundle
filetype off "for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'prettier/vim-prettier'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'fatih/vim-go'

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

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
set wildignore=*.o,*.a,*.so,*.pyc,*.swp,.git,.git/*,*.class,*/target/*,.idea/,node_modules/

" Hack to copy to OSX clipboard
map <leader>y :w ! xclip -selection clipboard<CR>

map <C-a> :RG<CR>
map <C-p> :Files<CR>

" set rtp+=~/.fzf

let g:fzf_layout = { 'window': { 'height': '50%', 'width': '80%' } }
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --hidden %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Trim whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd StdinReadPre * let s:std_in=1

" NERDTree
map <C-q> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fucking YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

