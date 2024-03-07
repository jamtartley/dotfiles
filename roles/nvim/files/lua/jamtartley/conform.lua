local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

conform.setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		cs = { "omnisharp" },
		go = { "gopls" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		prisma = { "prismals" },
		python = { "isort", "black" },
		rust = { "rust_analyzer" },
		templ = { "templ" },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})
