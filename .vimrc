call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu

syntax on

set showmode
set number

" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom key mappings
map <C-n> :NERDTreeToggle<CR>
