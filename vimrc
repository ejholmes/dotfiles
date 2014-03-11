" Required by Vundle
set nocompatible
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

" =======
" Bundles
" =======

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-fugitive'

" Syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jnwhiteh/vim-golang'

" ========
" Settings
" ========

filetype plugin indent on

" Enable syntax highlighting
syntax enable

" Don't show line numbers in the gutter
set nonumber

" Show tab characters
set list listchars=tab:»¯

" Default tabs to be 2 soft spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Expand tabs to spaces
set expandtab

" Automatically read files that have been changed outside of vim
set autoread

" Copy indent from current line when creating a new line
set autoindent

" Don't create .bak files
set nobackup

" Don't create .swp files
set noswapfile

" Show line and column number in the status bar
set ruler

" Improves performance in faster terminals
set ttyfast

" Set default encoding to UTF-8
set encoding=utf-8

" Allow backspace key to remove end of line characters
set backspace=indent,eol,start

" Don't wrap lines by default
set nowrap

" Highlight search results
set hlsearch

" Highlight search results as typing
set incsearch

" Don't update the display while executing macros
set lazyredraw

" Hide buffers instead of closing them.
set hidden

" Tab complete file names like bash
set wildmenu
set wildmode=list:longest,full

" ========
" Mappings
" ========

nnoremap ; :

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

" Reindent entire file
nmap <leader>ri 1G=G

" Close the current buffer
nnoremap <leader>d :bdelete<cr>

" Set tab character to cycle buffers in normal mode
if has("gui_macvim")
  nnoremap <tab> :tabnext<cr>
  nnoremap <s-tab> :tabprevious<cr>
else
  nnoremap <tab> :bnext<cr>
  nnoremap <s-tab> :bprevious<cr>
endif

" Make -- trigger toggling of comments
nmap -- <plug>NERDCommenterToggle
vmap -- <plug>NERDCommenterToggle
