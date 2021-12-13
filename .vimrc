"Vim Configuration File

"Install Vim Plugged if not installed{{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}

"Load Plugins{{{
call plug#begin('~/vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'rust-lang/rust.vim'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

call plug#end()
"}}}

"Vim Settings{{{
set nocompatible
filetype on
filetype plugin on
filetype indent on
"}}}

"Editor Settings{{{
syntax on 
set mouse=a 
set number 
set nowrap 
set smartcase 
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile 
set incsearch
set ignorecase
set showcmd
set cursorline
set showmode
set showmatch
set hlsearch
set wildmenu


"Use Windows Clipboard
set clipboard=unnamed
set clipboard=unnamedplus

"Turn off terminal bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
"}}}

"Vimscript{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif
"}}}

"Status Line{{{
let g:airline_theme='violet'
"}}}

"Colorscheme Settings{{{
let g:neodark#terminal_transparent = 1 
let g:neodark#use_256color = 1
colorscheme neodark
"}}}
