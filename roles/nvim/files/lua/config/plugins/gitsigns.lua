return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local opts = { buffer = bufnr, noremap = true, silent = false }
				vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, opts)
				vim.keymap.set("n", "]g", function()
					gitsigns.nav_hunk("next")
				end, opts)
				vim.keymap.set("n", "[g", function()
					gitsigns.nav_hunk("prev")
				end, opts)
				vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, opts)
				vim.keymap.set("n", "<leader>gs", gitsigns.preview_hunk, opts)
			end,
		})
	end,
}
