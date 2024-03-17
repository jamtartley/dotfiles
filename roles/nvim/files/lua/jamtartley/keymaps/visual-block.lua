local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "p", '"_dP', opts)
