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
keymap("n", "<leader>t", "<cmd>lua require('jamtartley.taggregator').run()<cr>", opts)

-- Indentation
keymap("n", "<", "V<", opts)
keymap("n", ">", "V>", opts)

-- Nvimtree
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>re", ":Telescope oldfiles<cr>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>h", ":Telescope help_tags<cr>", opts)

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
local ufo = require("ufo")
keymap("n", "zR", ufo.openAllFolds, opts)
keymap("n", "zM", ufo.closeAllFolds, opts)

-- Harpoon
keymap("n", "m", "<cmd>lua require('harpoon.mark').add_file()<cr><cmd>lua print('Harpoon mark added')<cr>", opts)
keymap("n", "M", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)

-- Pomodoro
local pomodoro = require("jamtartley.pomodoro")
keymap("n", "<leader>ps", function()
	pomodoro.toggle_timer()
end, opts)
keymap("n", "<leader>pp", function()
	pomodoro.peek()
end, opts)

-- Quickfix
local quickfix = require("jamtartley.quickfix")
keymap("n", "<leader>qq", function()
	quickfix.toggle_quickfix()
end, opts)
keymap("n", "<leader>q]", ":cn<CR>", opts)
keymap("n", "<leader>q[", ":cp<CR>", opts)
