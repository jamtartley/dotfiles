return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				-- Finish ESLint fixes before Prettier formats the resulting text.
				for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })) do
					local result, err = client:request_sync("workspace/executeCommand", {
						command = "eslint.applyAllFixes",
						arguments = {
							{
								uri = vim.uri_from_bufnr(bufnr),
								version = vim.lsp.util.buf_versions[bufnr],
							},
						},
					}, 1000, bufnr)
					if not result or result.err then
						vim.notify("ESLint fixes failed: " .. vim.inspect(err or (result and result.err)), vim.log.levels.WARN)
					end
				end
				return { timeout_ms = vim.bo[bufnr].filetype == "cs" and 2000 or 500, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
		})
	end,
}
