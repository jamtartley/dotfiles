local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
