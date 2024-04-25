local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local telescope = require("telescope.builtin")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
})

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"ansiblels",
		"bashls",
		"cmake",
		"dockerls",
		"emmet_ls",
		"gopls",
		"jsonls",
		"lua_ls",
		"omnisharp",
		"prismals",
		"rust_analyzer",
		"templ",
		"terraformls",
		"tsserver",
	},
	handlers = {
		lsp.default_setup,
	},
})

lsp.on_attach(function()
	local opts = { noremap = true, silent = true }
	local setkey = vim.keymap.set

	setkey("n", "gd", telescope.lsp_definitions, opts)
	setkey("n", "<leader>ds", telescope.lsp_document_symbols, opts)
	setkey("n", "gr", telescope.lsp_references, opts)
	setkey("n", "K", vim.lsp.buf.hover, opts)
	setkey("n", "<leader>.", vim.lsp.buf.code_action, opts)
	setkey("n", "<leader>rn", vim.lsp.buf.rename, opts)
	setkey("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	setkey("n", "<leader>dn", vim.diagnostic.goto_next, opts)
	setkey("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
	setkey("n", "<leader>df", vim.diagnostic.open_float, opts)
end)
