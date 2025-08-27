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
keymap("n", "<leader>b", ":buffer#<cr>", opts)
keymap("n", "<leader>wH", "<C-w>H", opts)
keymap("n", "<leader>wJ", "<C-w>J", opts)
keymap("n", "<leader>wK", "<C-w>K", opts)
keymap("n", "<leader>wL", "<C-w>L", opts)

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
keymap("n", "<leader>yfn", '<cmd>let @*=expand("%")<cr><cmd>lua print("Yanked current filename")<cr><cr>', opts)
keymap("n", "<leader>k", "<C-a>", opts)
keymap("n", "<leader>j", "<C-x>", opts)

-- Indentation
keymap("n", "<", "V<", opts)
keymap("n", ">", "V>", opts)

-- Git plugins
keymap("n", "<leader>gb", ":Gitsigns blame_line<cr>", opts)
keymap("n", "<leader>gg", ":Neogit kind=auto<cr>", opts)
keymap("n", "]g", ":Gitsigns next_hunk<cr><cr>", opts)
keymap("n", "[g", ":Gitsigns prev_hunk<cr><cr>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>gs", ":Gitsigns preview_hunk<cr>", opts)

-- Folding
keymap("n", "zR", require("ufo").openAllFolds, opts)
keymap("n", "zM", require("ufo").closeAllFolds, opts)

-- Quickfix
keymap("n", "<leader>qq", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd(action)
end, opts)
keymap("n", "]q", ":cnext<cr>", opts)
keymap("n", "[q", ":cprev<cr>", opts)
