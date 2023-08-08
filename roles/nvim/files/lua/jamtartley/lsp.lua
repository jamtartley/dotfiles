local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

lsp.preset({})

lsp.ensure_installed({
	"ansiblels",
	"bashls",
	"cmake",
	"dockerls",
	"emmet_ls",
	'gopls',
	'lua_ls',
	'omnisharp',
	'prismals',
	'rust_analyzer',
	'terraformls',
	'tsserver',
})

lsp.on_attach(function()
	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", opts)
	vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>.", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)

	lsp.buffer_autoformat()
end)

lsp.setup()
