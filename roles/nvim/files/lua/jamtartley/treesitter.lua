local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	autotag = {
		enable = true,
	},
	ensure_installed = { "javascript", "typescript", "go", "rust", "lua", "python" },
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
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
