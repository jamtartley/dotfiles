local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.prettierd.with({
			command = "node_modules/.bin/prettier"
		}),
		null_ls.builtins.code_actions.eslint_d.with({
			command = "node_modules/.bin/eslint",
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			command = "node_modules/.bin/eslint",
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
					vim.api.nvim_command("write")
				end
			})
		end
	end
})
