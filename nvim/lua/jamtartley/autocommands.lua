vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		require "vim.highlight".on_yank({
			higroup = "DiffAdd",
			timeout = 350
		})
	end
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.api.nvim_set_keymap("n", "<cr>", "<cr>:cclose<cr>", { noremap = true, silent = true })
	end
})

vim.cmd [[
	augroup yaml_fix
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
	augroup END
]]
