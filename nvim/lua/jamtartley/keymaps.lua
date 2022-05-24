local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "vh", "<C-w>h", opts)
keymap("n", "vj", "<C-w>j", opts)
keymap("n", "vk", "<C-w>k", opts)
keymap("n", "vl", "<C-w>l", opts)
keymap("n", "vs", "<C-w>s", opts)
keymap("n", "vv", "<C-w>v", opts)
keymap("n", "v=", "<C-w>=", opts)

-- Move text up and down
keymap("n", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Centralise found item
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Misc
keymap("n", "Q", ":q<cr>", opts)
keymap("n", "<cr>", ":noh<cr><cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Nvimtree
keymap("n", "<C-f>", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>f", ":Telescope live_grep<cr>", opts)

-- Gitsigns
keymap("n", "<leader>gn", ":Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>gs", ":Gitsigns preview_hunk<cr>", opts)
