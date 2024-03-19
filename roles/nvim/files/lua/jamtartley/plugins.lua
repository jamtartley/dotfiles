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
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

	-- Navigation and File Management
	"nvim-tree/nvim-tree.lua",
	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	"christoomey/vim-tmux-navigator",

	-- Editing Enhancements
	"numToStr/Comment.nvim",
	"tpope/vim-surround",
	"windwp/nvim-autopairs",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
	},
	"saadparwaiz1/cmp_luasnip",

	-- LSP and Syntax
	"stevearc/conform.nvim",
	"MunifTanjim/prettier.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", build = pcall(vim.cmd, "MasonUpdate") },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"windwp/nvim-ts-autotag",
	"nvim-treesitter/nvim-treesitter-textobjects",

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
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({})
		end,
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
})
