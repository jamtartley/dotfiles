local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		cache_picker = { num_pickers = 10 },
		mappings = {
			i = {
				["<C-j>"] = actions.cycle_history_prev,
				["<C-k>"] = actions.cycle_history_next,
				["<C-s>"] = actions.select_horizontal,
			},
		},
		path_display = { "smart" },
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
		find_files = {
			hidden = true,
		},
		lsp_definitions = {
			jump_type = "vsplit",
		},
		lsp_references = {
			include_current_line = true,
			include_declaration = false,
			show_line = false,
			trim_text = true,
		},
		oldfiles = {
			only_cwd = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		["ui-select"] = { require("telescope.themes").get_dropdown({}) },
	},
})

telescope.load_extension("dap")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
