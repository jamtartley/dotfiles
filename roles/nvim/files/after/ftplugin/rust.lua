local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("i", ";cl", "println!();<left><left>", opts)
keymap("i", ";c?", 'println!("{:?}");<Esc>5hi', opts)
