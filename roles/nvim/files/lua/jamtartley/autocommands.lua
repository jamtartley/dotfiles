vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({
			higroup = "DiffAdd",
			timeout = 350,
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.api.nvim_set_keymap("n", "<cr>", "<cr><leader>w<cr>", { noremap = true, silent = true })
	end,
})
