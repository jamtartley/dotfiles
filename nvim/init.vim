call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
Plug 'dense-analysis/ale'
Plug 'deoplete-plugins/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
Plug 'dracula/vim'
Plug 'groenewege/vim-less'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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

syntax on
set termguicolors
colorscheme dracula

" ===================
" Deoplete
" ===================
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
    \ 'cs': ['\w\.']
\})
inoremap <expr><tab> pumvisible() ? "\<CR>" : "\<tab>"

let g:deoplete#sources#jedi#enable_typeinfo = 0

" ===================
" netrw
" ===================
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
let g:netrw_liststyle    = 1 " or 3
let g:netrw_sort_options = 'i'
autocmd VimEnter * if !argc() | Explore | endif

nnoremap <C-n> :Explore <CR>

" ===================
" OmniSharp
" ===================
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 5

let g:ale_linters = {
    \ 'cs': ['OmniSharp']
\}

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> <leader>c :OmniSharpCodeFormat<CR>
    autocmd FileType cs nnoremap <buffer> <leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <leader>fu :OmniSharpFindUsage<CR>
    autocmd FileType cs nnoremap <buffer> <leader>g :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <leader>r :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <leader>t :OmniSharpTypeLookup<CR>

    inoremap <silent> <C-Space> <C-x><C-o>
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
" Toggle QuickFix
" ===================

function! s:GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
endfunction

function! ToggleQuickfixList()
    for bufnum in map(filter(split(s:GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            cclose
            return
        endif
    endfor
    let winnr = winnr()
    if exists("g:toggle_list_copen_command")
        exec(g:toggle_list_copen_command)
    else
        copen
        return
    endif
    if winnr() != winnr
        wincmd p
    endif
endfunction

nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>zz

" ===================
" Misc key mappings
" ===================
nnoremap <C-a> ggVG<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <C-p> :Files<Cr>

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
