return {
	"Mofiqul/dracula.nvim",
	config = function()
		require("dracula").setup({
			italic_comment = true,
		})

		vim.cmd.colorscheme("dracula")
	end,
}
