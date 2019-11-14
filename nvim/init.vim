filetype plugin on

call plug#begin()
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
" Vim workflow
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Cygwin compatibility
set t_Co=8
set t_Sb=m
set t_Sf=m

set clipboard+=unnamed,unnamedplus
set completeopt-=preview
set cursorline
set ignorecase
set list
set nobackup
set nocp
set noswapfile
set number
set showmatch
set smartcase
set splitbelow
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set timeoutlen=1000 ttimeoutlen=0
set wildignore+=*/.git/*,*/tmp/*,*.swp
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

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never -g "!*.meta" -g "!*.prefab" -g "!*.asset"'
endif
let g:ctrlp_show_hidden = 1

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

map <C-t> :split \| resize 15 \| terminal<CR>

nnoremap <leader>C :!clear;shellcheck %<CR>
nnoremap <leader>g :!git diff %<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>t :!clear;tagg<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-9> :q!<CR>

vnoremap < <gv
vnoremap > >gv
