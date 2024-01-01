local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("i", ";cl", "fmt.Println()<left>", opts)
