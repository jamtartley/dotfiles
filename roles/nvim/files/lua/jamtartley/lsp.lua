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

	setkey("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end, opts)
	setkey("n", "<leader>ds", function()
		require("telescope.builtin").lsp_document_symbols()
	end, opts)
	setkey("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end, opts)
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
	setkey("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	setkey("n", "<leader>dd", ":Telescope diagnostics<cr>", opts)
	setkey("n", "<leader>dn", function()
		vim.diagnostic.goto_next()
	end, opts)
	setkey("n", "<leader>dp", function()
		vim.diagnostic.goto_prev()
	end, opts)
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
		["hclfmt"] = { "hcl" },
		["gopls"] = { "go" },
		["null-ls"] = {
			"javascript",
			"javascriptreact",
			"lua",
			"typescript",
			"typescriptreact",
		},
		["omnisharp"] = { "cs" },
		["prismals"] = { "prisma" },
		["rust_analyzer"] = { "rust" },
		["templ"] = { "templ" },
	},
})

lsp.setup()
