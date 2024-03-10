local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
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
	sync_install = false,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
