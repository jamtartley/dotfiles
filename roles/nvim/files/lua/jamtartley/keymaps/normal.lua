local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>wr", "<C-w>r", opts)
keymap("n", "<leader>ws", "<C-w>s", opts)
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>ww", "<C-w>w", opts)
keymap("n", "<leader>wx", "<C-w>x", opts)
keymap("n", "<leader>w=", "<C-w>=", opts)

-- Centralise found item
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "{", "{zz", opts)
keymap("n", "}", "}zz", opts)

-- Misc
keymap("n", "Q", ":q<cr>", opts)
keymap("n", "X", ":x<cr>", opts)
keymap("n", "<cr>", ":noh<cr><cr>", opts)
keymap("n", "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", opts)
keymap("n", "<C-t>", "<cmd>lua require('jamtartley.taggregator').run()<cr>", opts)
keymap("n", "<leader>yfn", '<cmd>let @*=expand("%")<cr><cmd>lua print("Yanked current filename")<cr>', opts)

-- Indentation
keymap("n", "<", "V<", opts)
keymap("n", ">", "V>", opts)

-- Nvimtree
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<cr>", opts)

-- Git plugins
keymap("n", "<leader>gb", ":Gitsigns blame_line<cr>", opts)
keymap("n", "<leader>gdc", ":DiffviewClose<cr>", opts)
keymap("n", "<leader>gdo", ":DiffviewOpen<cr>", opts)
keymap("n", "<leader>gdh", ":DiffviewFileHistory %<cr>", opts)
keymap("n", "<leader>gg", ":Neogit kind=vsplit<cr>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>gs", ":Gitsigns preview_hunk<cr>", opts)

-- Folding
keymap("n", "zR", require("ufo").openAllFolds, opts)
keymap("n", "zM", require("ufo").closeAllFolds, opts)

-- Quickfix
keymap("n", "qq", function()
	require("jamtartley.quickfix").toggle_quickfix()
end, opts)
keymap("n", "]q", ":cnext<cr>", opts)
keymap("n", "[q", ":cprev<cr>", opts)

-- Compilation
keymap("n", "<leader>m", ":make<cr><cr>", opts)
