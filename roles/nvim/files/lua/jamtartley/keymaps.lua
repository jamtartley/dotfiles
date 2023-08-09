local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wr", "<C-w>r", opts)
keymap("n", "<leader>ws", "<C-w>s", opts)
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>w=", "<C-w>=", opts)

-- Centralise found item
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "{", "{zz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "<C-j>", "<C-d>zz", opts)
keymap("n", "<C-k>", "<C-u>zz", opts)

-- Misc
keymap("n", "Q", ":q<cr>", opts)
keymap("n", "X", ":x<cr>", opts)
keymap("n", "<cr>", ":noh<cr><cr>", opts)
keymap("n", "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", opts)
keymap("n", "<leader>q", ":lua require('jamtartley.quickfix').toggle_quickfix()<cr>", opts)

-- Indentation
keymap("n", "<", "V<", opts)
keymap("n", ">", "V>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "p", '"_dP', opts)

-- Nvimtree
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<cr>", opts)

-- Telescope
keymap("n", "<C-;>", ":Telescope commands<cr>", opts)
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>h", ":Telescope help_tags<cr>", opts)

-- Git plugins
keymap("n", "<leader>gb", ":Gitsigns blame_line<cr>", opts)
keymap("n", "<leader>gd", ":DiffviewOpen<cr>", opts)
keymap("n", "<leader>gf", ":DiffviewFileHistory<cr>", opts)
keymap("n", "<leader>gg", ":Neogit kind=vsplit<cr>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>gs", ":Gitsigns preview_hunk<cr>", opts)

-- Folding
keymap("n", "<Tab>", "<cmd>lua require('jamtartley.folding').toggle_current_fold()<cr>", opts)
keymap("n", "<leader><Tab>", "<cmd>lua require('jamtartley.folding').toggle_all_folds()<cr>", opts)
