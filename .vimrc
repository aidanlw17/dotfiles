" Disable vi compatibility
set nocompatible

" Install plugin manager vim-plug!
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify plugin directory and startup vim plug
call plug#begin('~/.vim/plugged')

" Install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall | q
endif

" Install plugins, format 'github-username/github-repo'
" Update plugins with `:PlugUpdate`, update vim-plug with `:PlugUpgrade`
Plug 'vim-airline/vim-airline' " Status bar
Plug 'morhetz/gruvbox' " Colour theme
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " Autocompletion and docs for Python
Plug 'tmhedberg/SimpylFold' " Folding for Python methods

" End plugin install
call plug#end()

" Syntax highlighting, line numbers, etc.
syntax on
set number
set encoding=utf-8

" Remaps for window splits
set splitbelow
set splitright

" Move to split below
nnoremap <C-J> <C-W><C-J> 
" Move to split above
nnoremap <C-K> <C-W><C-K>
" Move to split right
nnoremap <C-L> <C-W><C-L>
" Move to split left
nnoremap <C-H> <C-W><C-H>

" Enable method folding and map to spacebar
set foldmethod=indent
set foldlevel=99 " Usually fold with za
nnoremap <space> za

" Filetype plugin
filetype plugin indent on

" Colour scheme
set t_Co=256
set background=dark
colorscheme gruvbox

