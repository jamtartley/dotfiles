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
	use("wbthomason/packer.nvim")

	use("Mofiqul/dracula.nvim")
	use("anuvyklack/pretty-fold.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("numToStr/Comment.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lualine/lualine.nvim")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("ThePrimeagen/harpoon")
	use("eandrju/cellular-automaton.nvim")

	-- copilot
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

	-- cmp plugins
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- LSP
	use("stevearc/conform.nvim")
	use("MunifTanjim/prettier.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
	})
	use({
		"linrongbin16/lsp-progress.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lsp-progress").setup()
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Treesitter
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Git
	use("NeogitOrg/neogit")
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
