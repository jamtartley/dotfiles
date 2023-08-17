vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("jamtartley.keymaps.insert")
require("jamtartley.keymaps.normal")
require("jamtartley.keymaps.visual-block")
require("jamtartley.keymaps.visual-line")
