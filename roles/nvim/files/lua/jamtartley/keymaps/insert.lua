local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set

keymap("i", ";cl", "console.log()<left>", opts)
