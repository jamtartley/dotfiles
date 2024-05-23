local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("i", ";cl", 'println!("");<Esc>2hi', opts)
keymap("i", ";c?", 'println!("{:?}");<Esc>5hi', opts)

vim.opt.makeprg = "cargo clippy --message-format=short --quiet -- -D warnings"
vim.opt.errorformat = "%f:%l:%c: %m"

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "[^l]*",
	callback = function()
		vim.cmd("cwindow")
	end,
	nested = true,
})
