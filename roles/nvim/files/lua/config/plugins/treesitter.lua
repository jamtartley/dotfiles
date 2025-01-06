return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				autopairs = { enable = true },
				autotag = { enable = true },
				ensure_installed = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				ignore_install = {},
				indent = { enable = true },
				modules = {},
				sync_install = false,
				textobjects = {
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]c"] = "@class.inner",
							["]f"] = "@function.inner",
						},
						goto_previous_start = {
							["[c"] = "@class.inner",
							["[f"] = "@function.inner",
						},
					},
					select = {
						enable = true,
						keymaps = {
							["if"] = "@function.inner",
							["af"] = "@function.outer",
							["ic"] = "@class.inner",
							["ac"] = "@class.outer",
						},
						selection_modes = {
							["@function.inner"] = "V",
						},
					},
				},
			})
		end,
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	"windwp/nvim-ts-autotag",
}
