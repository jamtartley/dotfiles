return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				csharpier_jt = {
					command = "csharpier",
					args = {
						"format",
						"--write-stdout"
					},
					to_stdin = true
				}
			},
			formatters_by_ft = {
				cs = { "csharpier_jt" },
				csproj = { "csharpier_jt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
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
