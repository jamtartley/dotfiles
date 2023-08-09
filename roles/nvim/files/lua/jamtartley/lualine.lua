local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local filename = {
	"filename",
	path = 1, -- relative
}

lualine.setup({
	options = {
		icons_enabled = false,
		theme = "dracula-nvim",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { filename },
		lualine_b = { branch, "diff" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "lsp_progress" },
		lualine_z = { "mode" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
