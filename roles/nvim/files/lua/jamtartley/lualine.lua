local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local branch = {
	"branch",
	icon = "",
}

local filename = {
	"filename",
	path = 1, -- relative
}

lualine.setup({
	extensions = { "quickfix" },
	options = {
		always_divide_middle = true,
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "Outline" },
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		theme = "dracula-nvim",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { filename },
		lualine_c = { branch, "diff" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "require('lsp-progress').progress()" },
	},
	tabline = {},
})
