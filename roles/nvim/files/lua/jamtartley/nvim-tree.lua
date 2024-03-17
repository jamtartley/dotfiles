local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	actions = {
		use_system_clipboard = true,
		open_file = {
			quit_on_open = true,
			resize_window = true,
			window_picker = {
				enable = false,
			},
		},
	},
	disable_netrw = true,
	filters = {
		dotfiles = false,
		git_ignored = false,
	},
	renderer = {
		icons = {
			webdev_colors = true,
			git_placement = "before",
		},
	},
	update_cwd = false,
	view = {
		width = 50,
		side = "right",
	},
})

vim.cmd([[
	autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
