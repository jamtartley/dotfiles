local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"go",
		"javascript",
		"lua",
		"prisma",
		"python",
		"rust",
		"templ",
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
