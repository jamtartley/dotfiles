vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "docker-compose.y[a]ml",
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = ".gitlab*",
	callback = function()
		vim.bo.filetype = "yaml.gitlab"
	end,
})
