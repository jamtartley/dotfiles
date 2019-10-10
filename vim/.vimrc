filetype plugin on

call plug#begin()
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" General programming
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
" Git
Plug 'airblade/vim-gitgutter'
" Javascript
Plug 'pangloss/vim-javascript'
" LESS
Plug 'groenewege/vim-less'
" NERDTree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" React
Plug 'maxmellon/vim-jsx-pretty'
" Theme
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'quramy/tsuquyomi'
" Vim workflow
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Cygwin compatibility
set t_Co=8
set t_Sb=m
set t_Sf=m

set completeopt-=preview
set nocp
set number
set backspace=indent,eol,start
set list
set nobackup
set noswapfile
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ignorecase
set smartcase
set showmatch incsearch hlsearch
set laststatus=2
set cursorline
set splitbelow
set timeoutlen=1000 ttimeoutlen=0
set wildmenu
set wildmode=longest:full,full

let mapleader=","

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

if has("win32unix")
    set term=xterm-256
endif

syntax on
set termguicolors
colorscheme dracula

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --path-to-ignore ~/.ignore --nocolor -g ""'
endif
let g:ctrlp_cache_dir = $HOME . './cache/ctrlp'

set statusline=
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"

" CSS
let g:ycm_semantic_triggers = { 'css': [ 're!^', 're!^\s+', ': ' ] }

" C#
let g:syntastic_cs_checkers = ['code_checker']

" Typescript
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" ===================
" Custom key mappings
" ===================
map <C-a> ggVG<CR>
map <C-f> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> vh <C-w>h
nnoremap <silent> vj <C-w>j
nnoremap <silent> vk <C-w>k
nnoremap <silent> vl <C-w>l
nnoremap <silent> vr <C-w>r
nnoremap <silent> vs <C-w>s
nnoremap <silent> vv <C-w>v
nnoremap <silent> v= <C-w>=

nnoremap <leader>g :!git diff %<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>t :!clear;tagg<CR>

vnoremap < <gv
vnoremap > >gv
