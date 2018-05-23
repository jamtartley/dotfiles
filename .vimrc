if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin on

call plug#begin()
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'oranget/vim-csharp'
call plug#end()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

let mapleader=","

set timeoutlen=1000 ttimeoutlen=0

" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

let g:airline_theme='dracula'

syntax on
color dracula 
set termguicolors

set number
set showcmd

set tabstop=4
set softtabstop=4 expandtab
set shiftwidth=4
let g:indent_guides_start_level=2

" Search settings
set ignorecase
set smartcase

set laststatus=2
set cursorline

" Backups
set dir=~/.vim/swap//
set backup
set backupdir=~/.vim/backup//
set undofile
set undodir=~/.vim/undo/

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_timeout = 10
set noshowmatch
set completeopt=longest,menuone,preview
set splitbelow
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom key mappings
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <C-Left> :tabprevious<CR> 
map <C-Right> :tabnext<CR> 
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
nnoremap <silent> vh <C-w>h
nnoremap <silent> vj <C-w>j
nnoremap <silent> vk <C-w>k
nnoremap <silent> vl <C-w>l
nnoremap <silent> v= <C-w>=
nnoremap <silent> <Leader>l :setlocal cursorline!<CR>
nnoremap <silent> <Leader>n :setlocal number!<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
