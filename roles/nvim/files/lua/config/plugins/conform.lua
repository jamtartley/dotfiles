return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				cs = { "omnisharp" },
				go = { "gopls" },
				hcl = { "hclfmt" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				lua = { "stylua" },
				prisma = { "prismals" },
				python = { "isort", "black" },
				rust = { "rust_analyzer" },
				sh = { "beautysh" },
				templ = { "templ" },
				terraform = { "terraform_ls" },
				toml = { "taplo" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				yaml = { "prettierd" },
			},
			stop_after_first = true,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
