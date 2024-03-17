local conform = require("conform")

conform.setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		cs = { "omnisharp" },
		go = { "gopls" },
		hcl = { "hclfmt" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		prisma = { "prismals" },
		python = { "isort", "black" },
		rust = { "rust_analyzer" },
		sh = { "beautysh" },
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
