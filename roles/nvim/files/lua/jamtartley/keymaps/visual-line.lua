local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "s", ":sort<cr>", opts)
