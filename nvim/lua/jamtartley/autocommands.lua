vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.html","*.css","*.js","*.jsx","*.ts","*.tsx"},
	command = "Prettier"
})

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require "vim.highlight".on_yank({
			higroup = "DiffAdd",
			timeout = 350
		})
	end
})

vim.cmd [[
	augroup yaml_fix
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
	augroup END
]]
