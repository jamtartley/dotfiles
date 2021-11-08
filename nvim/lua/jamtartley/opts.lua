vim.g.mapleader = ","
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 60

vim.cmd[[colorscheme dracula]]

vim.opt.backup = false
vim.opt.clipboard = vim.opt.clipboard + "unnamed,unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = "longest,menuone,preview,noinsert"
vim.opt.cp = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.number = true
vim.opt.previewheight = 5
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.syntax = "on"
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 300
vim.opt.wildignore = vim.opt.wildignore + "*/.git/*,*/tmp/*,*.swp"
vim.opt.wildmode =  "longest:full,full"

vim.cmd([[
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
]])