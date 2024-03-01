local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
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

				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<esc>"] = actions.close,

				["<CR>"] = actions.select_default,
			},
		},
		path_display = { "smart", shorten = { len = 5 } },
		prompt_prefix = "  ",
		selection_caret = "  ",
		wrap_results = true,
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		commands = {},
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
		find_files = {
			hidden = true,
		},
		lsp_definitions = {
			show_line = false,
			trim_text = true,
		},
		lsp_references = {
			include_current_line = true,
			include_declaration = false,
			show_line = false,
			trim_text = true,
		},
	},
	extensions = {
		file_browser = { layout_strategy = "horizontal", sorting_strategy = "ascending" },
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		heading = { treesitter = true },
		["ui-select"] = { require("telescope.themes").get_dropdown({}) },
	},
})

telescope.load_extension("fzf")
telescope.load_extension("harpoon")
telescope.load_extension("ui-select")
