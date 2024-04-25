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
				return { "--hidden", "--glob", "!*.bs.js", "--glob", "!*.mli", "--glob", "!*.ml" }
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

local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set

keymap("n", "<leader>re", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>bf", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>h", ":Telescope help_tags<cr>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<cr>", opts)
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>f", function()
	vim.ui.input({
		completion = "dir",
		prompt = "Grep from root > ",
	}, function(root)
		if root ~= "" then
			require("telescope.builtin").live_grep({
				cwd = root,
			})
		end
	end)
end, opts)
keymap("n", "<leader>p", function()
	vim.ui.input({
		completion = "dir",
		prompt = "Find file from root > ",
	}, function(root)
		if root ~= "" then
			require("telescope.builtin").find_files({
				cwd = root,
			})
		end
	end)
end, opts)
