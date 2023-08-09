vim.cmd([[
	augroup _tex
		autocmd!
		autocmd BufWritePost *.tex silent !pdflatex <afile>;
	augroup end
]])

vim.api.nvim_set_keymap("n", "<leader>p", ":!zathura %:r.pdf &<cr><cr>", { noremap = true, silent = true })
