local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("i", ";cl", "console.log()<left>", opts)
