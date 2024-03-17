local configs = require("nvim-treesitter.configs")

configs.setup({
	autopairs = {
		enable = true,
	},
	auto_install = true,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	sync_install = false,
	textobjects = {
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.inner",
			},
			goto_previous_start = {
				["[m"] = "@function.inner",
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
		},
	},
})
