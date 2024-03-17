vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({
			higroup = "DiffAdd",
			timeout = 350,
		})
	end,
})
