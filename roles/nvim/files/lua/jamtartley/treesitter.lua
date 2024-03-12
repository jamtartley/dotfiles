local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	autopairs = {
		enable = true,
	},
	auto_install = true,
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"go",
		"html",
		"javascript",
		"lua",
		"prisma",
		"python",
		"rust",
		"templ",
		"tsx",
		"typescript",
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
