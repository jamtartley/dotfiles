function compile_tex()
	local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")

	local tex_file = vim.fn.globpath(git_root, "*.tex")
	if tex_file == "" then
		print("No .tex file found at the Git root")
		return
	end

	vim.fn.system("pdflatex -output-directory " .. git_root .. " " .. tex_file)
end

function open_tex()
	local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")

	local tex_file = vim.fn.globpath(git_root, "*.tex")
	local pdf_file = tex_file:gsub("%.tex$", ".pdf")
	local zathura_running = vim.fn.system('pgrep -f "zathura ' .. pdf_file .. '"')

	if zathura_running == "" then
		vim.fn.system("zathura " .. pdf_file .. " &")
	else
		print("Zathura is already displaying " .. pdf_file)
	end
end

function compile_and_open_tex()
	compile_tex()
	open_tex()
end

vim.api.nvim_set_keymap("n", "<leader>p", ":lua compile_and_open_tex()<CR>", { noremap = true, silent = true })

vim.cmd([[
  augroup TexAutoCompile
    autocmd!
    autocmd BufWritePost *.tex lua compile_tex()
  augroup END
]])
