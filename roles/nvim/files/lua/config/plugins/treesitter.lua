return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup({})
			local available = treesitter.get_available()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
					if not lang or not vim.list_contains(available, lang) then
						return
					end
					local function attach()
						if
							not vim.api.nvim_buf_is_valid(ev.buf)
							or vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype) ~= lang
						then
							return
						end
						if pcall(vim.treesitter.start, ev.buf, lang) then
							vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						end
					end
					if vim.list_contains(treesitter.get_installed(), lang) then
						attach()
					else
						treesitter.install({ lang }):await(vim.schedule_wrap(function(err)
							if not err then
								attach()
							end
						end))
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = false,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				move = { set_jumps = true },
				select = { selection_modes = { ["@function.inner"] = "V" } },
			})
			for key, capture in pairs({
				["if"] = "@function.inner",
				["af"] = "@function.outer",
				["ic"] = "@class.inner",
				["ac"] = "@class.outer",
			}) do
				vim.keymap.set({ "x", "o" }, key, function()
					require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
				end)
			end
			for key, capture in pairs({ c = "@class.inner", f = "@function.inner" }) do
				vim.keymap.set({ "n", "x", "o" }, "]" .. key, function()
					require("nvim-treesitter-textobjects.move").goto_next_start(capture, "textobjects")
				end)
				vim.keymap.set({ "n", "x", "o" }, "[" .. key, function()
					require("nvim-treesitter-textobjects.move").goto_previous_start(capture, "textobjects")
				end)
			end
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
