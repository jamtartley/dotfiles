if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin on

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Cygwin compatibility
set t_Co=8
set t_Sb=m
set t_Sf=m

set nocp
set number
set backspace=indent,eol,start
set list
set nobackup
set noswapfile
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
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
let ayucolor="mirage"
colorscheme ayu

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
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
