
if !1 | finish | endif
if has('vim_starting')
    if &compatible
        set nocompatible " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"------------------------------------------------------------------------
" Plugin
"------------------------------------------------------------------------

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomasr/molokai'
call neobundle#end()
filetype plugin indent on " Required!
NeoBundleCheck

"---------------------------
" neocomplete.vim
"---------------------------
let g:acp_enableAtStartup = 0                           " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 1                 " Use neocomplete
let g:neocomplete#enable_smart_case = 1                 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'


"---------------------------
" NERDTREE.vim
"---------------------------
nmap <silent> <C-e>        :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>  :NERDTreeToggle<CR>
omap <silent> <C-e>        :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>  :NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>  :NERDTreeToggle<CR>

"---------------------------
" molokai.vim
"---------------------------
syntax enable
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1


"------------------------------------------------------------------------
"  Standard Preference
"------------------------------------------------------------------------

let mapleader=","                  " set ',' as <LEADER>

inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap <CR> O<ESC>j
nnoremap <Leader><Leader> :w<CR>
nnoremap <C-j><C-j> :noh<CR>

set number
set tabstop=4
set softtabstop=4
set expandtab                      " replace <TAB> with <SPACE>
set smarttab
set autoindent
set shiftwidth=4                   " shift width with auto indent
set laststatus=2
set list listchars=tab:>-,trail:_  " express <TAB> by '>-', <SPACE> of EOL by '_'
set hlsearch                       " highlight search results
set backspace=indent,eol,start     " Enable to use backspace key in insert mode
set clipboard+=unnamed,autoselect
set visualbell t_vb=               " Turn off beep
set cursorline

highlight CursorLine ctermbg=235

" Enable mouse support.
set mouse=a
if has('gui_running')
    set mousemodel=popup " Show popup menu if right click.
    set nomousefocus     " Don't focus the window when the mouse pointer is moved.
    set mousehide        " Hide mouse pointer on insert mode.
endif

