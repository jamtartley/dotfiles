call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'groenewege/vim-less'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'Sirver/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set clipboard+=unnamed,unnamedplus
set cmdheight=2
set completeopt=longest,menuone,preview,noinsert
set cursorline
set ignorecase
set list
set nobackup
set nocp
set noswapfile
set number
set previewheight=5
set shortmess+=c
set showmatch
set signcolumn=yes
set smartcase
set splitbelow
set statusline^=%{coc#status()}
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set timeoutlen=500 ttimeoutlen=0
set updatetime=300
set wildignore+=*/.git/*,*/tmp/*,*.swp
set wildmode=longest:full,full

let mapleader=","

syntax on
set termguicolors
colorscheme dracula

" ===================
" coc.nvim
" ===================

let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-utils', 'coc-python', 'coc-tsserver', 'coc-snippets' ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)<CR>
nmap <leader>f  <Plug>(coc-format-selected)<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ===================
" netrw
" ===================
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3
let g:netrw_sort_options = 'i'

nnoremap <C-n> :Explore <CR>

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
" Ultisnips
" ===================
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

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

nnoremap <leader>bp :!killall mupdf;pdflatex %;mupdf %:r.pdf &<CR><CR>
nnoremap <leader>ff :Rg 
nnoremap <leader>g :!git diff %<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>rz :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>sc :!clear;shellcheck %<CR>
nnoremap <leader>tg :!clear;tagg<CR>

vnoremap < <gv
vnoremap > >gv
