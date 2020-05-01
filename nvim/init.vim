call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'epilande/vim-react-snippets'
Plug 'groenewege/vim-less'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
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
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
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

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-omnisharp',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-utils',
  \ ]

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
" NERDTree
" ===================

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60

" Open NERDTree if vim starts on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if last buffer is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-f> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

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

nnoremap <C-t> :call Term_toggle(25)<cr>
tnoremap <C-t> <C-\><C-n>:call Term_toggle(25)<cr>

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
" Misc
" ===================

" Automatically source init.vim on write
augroup initvim
    au!
    au BufWritePost init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <C-g> :Goyo<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

nnoremap <C-a> ggVG<CR>
nnoremap <C-p> :Files<Cr>

nnoremap n nzz
nnoremap N Nzz
nnoremap Q :q<CR>
nnoremap / /\v
nnoremap <CR> :noh<CR><CR>

nnoremap <silent> vh <C-w>h
nnoremap <silent> vj <C-w>j
nnoremap <silent> vk <C-w>k
nnoremap <silent> vl <C-w>l
nnoremap <silent> vr <C-w>r
nnoremap <silent> vs <C-w>s
nnoremap <silent> vv <C-w>v
nnoremap <silent> v= <C-w>=

nnoremap <leader>b :!npm run build<CR><CR>
nnoremap <leader>bp :!killall mupdf;pdflatex %;mupdf %:r.pdf &<CR><CR>
nnoremap <leader>ff :Rg 
nnoremap <leader>g :Gdiff<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>rz :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>sc :!clear;shellcheck %<CR>
nnoremap <leader>t :terminal clear;tagg<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap / /\v

autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
