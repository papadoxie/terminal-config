filetype plugin on 
syntax on 
filetype indent on
set mouse=a 
set number 
set nowrap 
set smartcase 
set tabstop=4 softtabstop=4 
set noswapfile 
set incsearch 

set clipboard=unnamed
set clipboard=unnamedplus

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()
