local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
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
