set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

" Bundles
Bundle 'gmarik/vundle'
Bundle 'mattn/gist-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ejholmes/vim-forcedotcom'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'sickill/vim-pasta'
Bundle 'scrooloose/nerdcommenter'
Bundle 'garbas/vim-snipmate'
Bundle 'ejholmes/snipmate-snippets'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ingydotnet/yaml-vim'
Bundle 'kana/vim-textobj-user'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
" vim-autoclose needs to be at 'b63af10' to work with vim-endwise
Bundle 'Townk/vim-autoclose'
Bundle 'kusnier/vim-mediawiki'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-matchit'
Bundle 'godlygeek/tabular'

filetype plugin indent on
syntax enable

set nonumber
set list listchars=tab:»¯
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set completeopt=menu,menuone
set autoindent
set nobackup
set noswapfile
set ruler
set ttyfast
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set backspace=indent,eol,start
set laststatus=2
set cmdheight=1
set shortmess+=I
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set nowrap
set textwidth=79
set formatoptions=qrnl
set wildignore=*.sw*,*.bak,*.DS_Store
" don't update the display while executing macros
set lazyredraw
set completeopt=longest
set pumheight=10

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
nnoremap '' ']
nnoremap `` `]
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap K k
vnoremap K k
nmap <leader>ri 1G=G
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>d :bdelete<cr>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Write with sudo
cmap w!! w !sudo tee % >/dev/null

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

autocmd! bufwritepost .vimrc source ~/.vimrc

" MacVim
if has("gui_macvim")
    nnoremap <tab> :tabnext<cr>
    nnoremap <s-tab> :tabprevious<cr>
    cabbrev e <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabe' : 'e')<cr>
    set guifont=Bitstream\ Vera\ Sans\ Mono:h14
    set linespace=3
else
    nnoremap <tab> :bnext<cr>
    nnoremap <s-tab> :bprevious<cr>
    set guifont=Courier\ 10\ Pitch\ 10
endif

" GVIM
if has("gui_running")
    set background=light
    colorscheme torti
    set guioptions=egmt
    let loaded_minibufexplorer = 1
else
endif

" Bundle 'scrooloose/nerdcommenter'
nmap -- <plug>NERDCommenterToggle
vmap -- <plug>NERDCommenterToggle
let g:NERDCustomDelimiters = {
            \ 'visualforce': { 'left': '<!--', 'right': '-->' },
            \ 'html': { 'left': '<!--', 'right': '-->' }
            \ }

" Bundle 'garbas/vim-snipmate'
let g:snips_author = "Eric J. Holmes"
let g:email = "eric@ejholmes.net"

" Bundle 'nelstrom/vim-markdown-preview'
map <leader>p :Mm<cr>

" Bundle 'godlygeek/tabular'
map <leader>a= :Tabularize /=<cr>
map <leader>a: :Tabularize /:<cr>
map <leader>a> :Tabularize /=><cr>

" Ruby
let g:rails_menu = 2
au FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType ruby inoremap <C-l> <space>=><space>
if has('gui_running')
    au FileType ruby set noballooneval
endif

" CSS
au FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2

" CoffeeScript
au FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
" au FileType coffee colorscheme tutticolori

" YAML
au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ECO templates
au FileType eco setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Bundle 'tsaleh/vim-matchit'
runtime! macros/matchit.vim

" Powerline
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'
