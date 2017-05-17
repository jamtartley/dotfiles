call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

let mapleader=","

" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

syntax on

set termguicolors
let ayucolor="dark"
colorscheme ayu

set number
set showcmd

set tabstop=2
set softtabstop=2 noexpandtab
set shiftwidth=2

" Search settings
set ignorecase
set smartcase

set laststatus=2

" Backups
set dir=~/.vim/swap//
set backup
set backupdir=~/.vim/backup//
set undofile
set undodir=~/.vim/undo/

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom key mappings
map <C-n> :NERDTreeToggle<CR>
map <C-Left> :tabprevious<CR> 
map <C-Right> :tabnext<CR> 
