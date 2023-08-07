local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require "telescope.actions"

telescope.setup {
	defaults = {
		cache_picker = { num_pickers = 10 },
		dynamic_preview_title = true,
		layout_config = { vertical = { width = 0.9, height = 0.9, preview_height = 0.6, preview_cutoff = 0 } },
		layout_strategy = "vertical",
		mappings = {
			i = {
				["<C-h>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-l>"] = actions.cycle_history_next,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<esc>"] = actions.close,

				["<CR>"] = actions.select_default,
			},
		},
		path_display = { "smart", shorten = { len = 3 } },
		prompt_prefix = "  ",
		selection_caret = "  ",
		wrap_results = true,
	},
	pickers = {},
	extensions = {
		file_browser = { layout_strategy = "horizontal", sorting_strategy = "ascending" },
		heading = { treesitter = true },
		["ui-select"] = { require("telescope.themes").get_dropdown({}) }
	},
}

telescope.load_extension("ui-select")
