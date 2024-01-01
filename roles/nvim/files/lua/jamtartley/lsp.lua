local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

lsp.preset({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.htmx.setup({
	filetypes = { "templ" },
})

lsp.ensure_installed({
	"ansiblels",
	"bashls",
	"cmake",
	"dockerls",
	"emmet_ls",
	"gopls",
	"htmx",
	"lua_ls",
	"omnisharp",
	"prismals",
	"rust_analyzer",
	"templ",
	"terraformls",
	"tsserver",
})

lsp.on_attach(function()
	local opts = { noremap = true, silent = true }
	local setkey = vim.keymap.set

	setkey("n", "gd", ":Telescope lsp_definitions<CR>", opts)
	setkey("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", opts)
	setkey("n", "gr", ":Telescope lsp_references<CR>", opts)
	setkey("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	setkey("n", "<leader>.", function()
		vim.lsp.buf.code_action()
	end, opts)
	setkey("n", "<leader>f", function()
		vim.lsp.buf.format()
	end, opts)
	setkey("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	setkey("n", "<leader>dd", ":Telescope diagnostics<cr>", opts)
	setkey("n", "<leader>df", function()
		vim.diagnostic.open_float()
	end, opts)
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["gopls"] = { "go" },
		["null-ls"] = {
			"javascript",
			"javascriptreact",
			"lua",
			"typescript",
			"typescriptreact",
		},
		["rust_analyzer"] = { "rust" },
		["templ"] = { "templ" },
	},
})

lsp.setup()
