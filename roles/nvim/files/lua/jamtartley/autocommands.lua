vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({
			higroup = "DiffAdd",
			timeout = 350,
		})
	end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "[^l]*",
	callback = function()
		vim.cmd("cwindow")
	end,
	nested = true,
})

vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	callback = function()
		vim.cmd("wincmd =")
	end,
})
