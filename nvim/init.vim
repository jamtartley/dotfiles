call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim'
Plug 'groenewege/vim-less'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Cygwin compatibility
set t_Co=8
set t_Sb=m
set t_Sf=m

set clipboard+=unnamed,unnamedplus
set completeopt=longest,menuone,preview,noinsert
set cursorline
set ignorecase
set list
set nobackup
set nocp
set noswapfile
set number
set previewheight=5
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

" ===================
" Ctrlp
" ===================
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never -g "*.{cs,js,json,md,git*,py,c,h,ts,sh,zsh,vim}"'
endif
let g:ctrlp_show_hidden = 1

" ===================
" Deoplete
" ===================
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<CR>" : "\<tab>"

" ===================
" OmniSharp
" ===================
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_timeout = 5

let g:ale_linters = {
    \ 'cs': ['OmniSharp']
\}

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> <leader>g :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <leader>f :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <C-r> :OmniSharpRename<CR>
augroup END

" ===================
" Terminal
" ===================
let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

nnoremap <C-t> :call Term_toggle(15)<cr>
tnoremap <C-t> <C-\><C-n>:call Term_toggle(15)<cr>

" ===================
" NERDTree
" ===================
map <C-f> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ===================
" Custom key mappings
" ===================
map <C-a> ggVG<CR>

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

nnoremap <leader>C :!clear;shellcheck %<CR>
nnoremap <leader>g :!git diff %<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>t :!clear;tagg<CR>

vnoremap < <gv
vnoremap > >gv
