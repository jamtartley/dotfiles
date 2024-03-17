local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)
	-- Core Plugin Management
	use("wbthomason/packer.nvim")

	-- Prerequisites
	use("nvim-lua/plenary.nvim")

	-- User Interface Enhancements
	use("Mofiqul/dracula.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Navigation and File Management
	use("nvim-tree/nvim-tree.lua")
	use("ThePrimeagen/harpoon")
	use("christoomey/vim-tmux-navigator")

	-- Editing Enhancements
	use("numToStr/Comment.nvim")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("hrsh7th/nvim-cmp") -- Autocompletion engine
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("saadparwaiz1/cmp_luasnip")

	-- LSP and Syntax
	use("stevearc/conform.nvim")
	use("MunifTanjim/prettier.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", run = pcall(vim.cmd, "MasonUpdate") },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"linrongbin16/lsp-progress.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lsp-progress").setup()
		end,
	})

	-- Version Control
	use("NeogitOrg/neogit")
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Copilot
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({})
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
