local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Cloning lazy.nvim")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Cloning lazy.nvim... done")
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	-- Prerequisites
	"nvim-lua/plenary.nvim",

	-- User Interface Enhancements
	"Mofiqul/dracula.nvim",
	"nvim-lualine/lualine.nvim",
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

	-- Navigation and File Management
	"christoomey/vim-tmux-navigator",
	"cbochs/grapple.nvim",
	{ "stevearc/oil.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Editing Enhancements
	"jiaoshijie/undotree",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	"saadparwaiz1/cmp_luasnip",

	--tpope 🧎
	"tpope/vim-repeat",
	"tpope/vim-surround",

	-- LSP and Syntax
	"stevearc/conform.nvim",
	"MunifTanjim/prettier.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", build = pcall(vim.cmd, "MasonUpdate") },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"rescript-lang/tree-sitter-rescript",
		},
		opts = function(_, opts) -- this is needed so you won't override your default nvim-treesitter configuration
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.rescript = {
				install_info = {
					url = "https://github.com/rescript-lang/tree-sitter-rescript",
					branch = "main",
					files = { "src/scanner.c" },
					generate_requires_npm = false,
					requires_generate_from_grammar = true,
					use_makefile = true, -- macOS specific instruction
				},
			}
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"folke/trouble.nvim",

	-- DAP
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	"nvim-telescope/telescope-dap.nvim",
	"mxsdev/nvim-dap-vscode-js",
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git checkout package-lock.json",
	},

	-- Version Control
	"NeogitOrg/neogit",
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					["*"] = true,
				},
				panel = {
					enabled = false,
				},
				suggestion = {
					auto_trigger = true,
					enabled = false,
					keymaps = {
						accept = "<C-y>",
						next = "<C-n>",
						prev = "<C-p>",
					},
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "sopa0/telescope-makefile", dependencies = { "akinsho/toggleterm.nvim" } },
})
