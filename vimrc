set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

" Bundles
Bundle 'gmarik/vundle'
" Bundle 'mattn/gist-vim'
" Bundle 'mattn/zencoding-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ejholmes/vim-forcedotcom'
" Bundle 'tpope/vim-git'
" Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-unimpaired'
" Bundle 'pangloss/vim-javascript'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'sickill/vim-pasta'
" Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'garbas/vim-snipmate'
Bundle 'ejholmes/snipmate-snippets'
" Bundle 'jpo/vim-railscasts-theme'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ingydotnet/yaml-vim'
" Bundle 'skammer/vim-css-color'
Bundle 'kien/ctrlp.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tsaleh/vim-matchit'
" Bundle 'godlygeek/tabular'
Bundle 'Townk/vim-autoclose'
" Bundle 'skwp/vim-html-escape'
" Bundle 'ervandew/supertab'
Bundle 'kusnier/vim-mediawiki'
" Bundle 'kana/vim-smartinput'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'csharp.vim'
" Bundle 'aspnet.vim'

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
    set guifont=Bitstream\ Vera\ Sans\ Mono:h16
    set linespace=3
else
    nnoremap <tab> :bnext<cr>
    nnoremap <s-tab> :bprevious<cr>
    set guifont=Courier\ 10\ Pitch\ 10
endif

" GVIM
if has("gui_running")
    " colorscheme basic
    set background=dark
    colorscheme solarized
    set guioptions=egmt
    let loaded_minibufexplorer = 1
else
endif

" Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['tags$', '\.elf$', '\.o$', '\.dll$', '\~$', '\.la$', '\.lo$']
let NERDSpaceDelims = 1

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

" Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<D-r>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>', '<MiddleMouse>'],
    \ 'AcceptSelection("t")': ['<cr>', '<c-m>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|_site$\|\.sass-cache$\|cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.gitignore',
  \ 'link': 'bad_symbolic_link',
  \ }

" Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1

" Bundle 'nelstrom/vim-markdown-preview'
map <leader>p :Mm<cr>

" Bundle 'godlygeek/tabular'
map <leader>a= :Tabularize /=<cr>
map <leader>a: :Tabularize /:<cr>
map <leader>a> :Tabularize /=><cr>

" Bundle 'mattn/zencoding-vim'
let g:user_zen_settings = {
  \  'html' : {
  \    'indentation' : '    '
  \  },
  \}

" For cucumber tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Ruby
let g:rails_menu = 2
au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType ruby inoremap <C-l> <space>=><space>
" au FileType ruby colorscheme railscasts
" au FileType eruby colorscheme railscasts
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
au BufRead,BufCreate Packfile set filetype=yaml

" ECO templates
au FileType eco setlocal shiftwidth=2 tabstop=2 softtabstop=2

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Bundle 'tsaleh/vim-matchit'
runtime! macros/matchit.vim

" Powerline
let g:Powerline_symbols='fancy'
let g:Powerline_theme='skwp'
let g:Powerline_colorscheme='skwp'

" Solarized
hi! link txtBold Identifier
hi! link zshVariableDef Identifier
hi! link zshFunction Function
hi! link rubyControl Statement
hi! link rspecGroupMethods rubyControl
hi! link rspecMocks Identifier
hi! link rspecKeywords Identifier
hi! link rubyLocalVariableOrMethod Normal
hi! link rubyStringDelimiter Constant
hi! link rubyString Constant
hi! link rubyAccess Todo
hi! link rubySymbol Identifier
hi! link rubyPseudoVariable Type
hi! link rubyRailsARAssociationMethod Title
hi! link rubyRailsARValidationMethod Title
hi! link rubyRailsMethod Title
hi! link MatchParen DiffText
