"Install Vim Plugged if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Load Plugins
call plug#begin('~/vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'rust-lang/rust.vim'

call plug#end()

"Editor Settings
syntax on 
filetype plugin on
filetype indent on
set mouse=a 
set number 
set nowrap 
set smartcase 
set tabstop=4 softtabstop=4 
set noswapfile 
set incsearch 

"Use Windows Clipboard
set clipboard=unnamed
set clipboard=unnamedplus

"Turn off terminal bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

"Colorscheme Settings
let g:neodark#terminal_transparent = 1 
let g:neodark#use_256color = 1
colorscheme neodark
