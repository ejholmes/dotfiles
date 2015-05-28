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
Bundle 'tpope/vim-cucumber'
Bundle 'kien/ctrlp.vim'

" Snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

" Syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'fatih/vim-go'
Bundle 'raichoo/haskell-vim'

" Themes
Bundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" ========
" Settings
" ========

filetype plugin indent on

" Enable syntax highlighting
syntax enable

" Don't show line numbers in the gutter
set nonumber

" Set color scheme
colorscheme dracula

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

" This is just annoying.
nnoremap K <NOP>

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

" Cucumber
au FileType cucumber setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Go
au FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8 textwidth=80 noexpandtab nolist
let g:go_fmt_command = "goimports"
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" ctrp
" let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|node_modules|_workspace'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
