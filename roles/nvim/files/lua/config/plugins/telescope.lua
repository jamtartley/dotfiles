return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "sopa0/telescope-makefile", dependencies = { "akinsho/toggleterm.nvim" } },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				cache_picker = { num_pickers = 10 },
				mappings = {
					i = {
						["<C-s>"] = require("telescope.actions").select_horizontal,
					},
				},
			},
			pickers = {
				buffers = {
					theme = "ivy",
				},
				colorscheme = {
					enable_preview = true,
					theme = "ivy",
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob", "!*.bs.js", "--glob", "!*.mli", "--glob", "!*.ml" }
					end,
					theme = "ivy",
				},
				find_files = {
					hidden = true,
					theme = "ivy",
				},
				help_tags = {
					theme = "ivy",
				},
				oldfiles = {
					only_cwd = true,
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("make")
		require("telescope").load_extension("ui-select")

		local opts = { noremap = true, silent = false }

		vim.keymap.set("n", "<leader>tb", ":Telescope buffers<cr>", opts)
		vim.keymap.set("n", "<leader>tc", ":Telescope colorscheme<cr>", opts)
		vim.keymap.set("n", "<leader>tgb", ":Telescope git_branches<cr>", opts)
		vim.keymap.set("n", "<leader>th", ":Telescope help_tags<cr>", opts)
		vim.keymap.set("n", "<leader>tk", ":Telescope vim.keymap.sets<cr>", opts)
		vim.keymap.set("n", "<leader>tm", ":Telescope man_pages<cr>", opts)
		vim.keymap.set("n", "<leader>to", ":Telescope oldfiles<cr>", opts)
		vim.keymap.set("n", "<leader>tr", ":Telescope make<cr>", opts)
		vim.keymap.set("n", "<leader>tt", ":Telescope<cr>", opts)
		vim.keymap.set("n", "<C-f>", ":Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>", opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.ui.input({
				completion = "dir",
				prompt = "Grep from root > ",
			}, function(root)
				if root ~= nil then
					require("telescope.builtin").live_grep({
						cwd = root,
					})
				end
			end)
		end, opts)
		vim.keymap.set("n", "<leader>p", function()
			vim.ui.input({
				completion = "dir",
				prompt = "Find file from root > ",
			}, function(root)
				if root ~= nil then
					require("telescope.builtin").find_files({
						cwd = root,
					})
				end
			end)
		end, opts)
	end,
}
