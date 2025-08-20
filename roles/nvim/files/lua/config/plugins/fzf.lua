return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			"ivy",
			winopts = {
				preview = {
					default = "builtin",
				},
			},
			fzf_opts = {
				["--layout"] = "default",
			},
			keymap = {
				builtin = {
					["<C-q>"] = "select-all+accept",
				},
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
		require("fzf-lua").register_ui_select()

		local opts = { noremap = true, silent = false }

		vim.keymap.set("n", "<leader>tc", ":FzfLua colorschemes<cr>", opts)
		vim.keymap.set("n", "<leader>td", ":FzfLua lsp_document_diagnostics<cr>", opts)
		vim.keymap.set("n", "<leader>th", ":FzfLua help_tags<cr>", opts)
		vim.keymap.set("n", "<leader>tk", ":FzfLua keymaps<cr>", opts)
		vim.keymap.set("n", "<leader>tm", ":FzfLua man_pages<cr>", opts)
		vim.keymap.set("n", "<leader>to", function()
			require("fzf-lua").oldfiles({
				cwd_only = true,
				stat_file = true,
			})
		end, opts)
		vim.keymap.set("n", "<leader>tt", ":FzfLua builtin<cr>", opts)
		vim.keymap.set("n", "<C-f>", ":FzfLua live_grep<cr>", opts)
		vim.keymap.set("n", "<C-p>", ":FzfLua files<cr>", opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.ui.input({
				completion = "dir",
				prompt = "Grep from root > ",
			}, function(root)
				if root ~= nil then
					require("fzf-lua").live_grep({
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
					require("fzf-lua").files({
						cwd = root,
					})
				end
			end)
		end, opts)
	end,
}
