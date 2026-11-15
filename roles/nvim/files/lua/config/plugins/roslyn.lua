return {
	"seblyng/roslyn.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("roslyn").setup({
			-- Search ancestors for Unity's .sln/.slnx without scanning Library/.
			broad_search = false,
		})
		local default_root_dir = vim.lsp.config.roslyn.root_dir
		vim.lsp.config("roslyn", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, function(name, path)
					return name == "ProjectSettings"
						and vim.uv.fs_stat(vim.fs.joinpath(path, name, "ProjectVersion.txt")) ~= nil
				end)
				if root then
					local solutions = vim.fs.find(function(name)
						return name:match("%.sln$") or name:match("%.slnx$")
					end, { path = root, type = "file", limit = math.huge, depth = 1 })
					if #solutions == 1 then
						-- Unity leaves stale .csproj files behind. Do not let an arbitrary
						-- one exclude the solution and load every project in the directory.
						require("roslyn.target").remember({
							kind = "solution",
							root_dir = root,
							target = solutions[1],
						})
						on_dir(root)
						return
					end
				end
				default_root_dir(bufnr, on_dir)
			end,
			settings = {
				["csharp|completion"] = {
					dotnet_show_completion_items_from_unimported_namespaces = true,
				},
				["csharp|background_analysis"] = {
					["background_analysis.dotnet_analyzer_diagnostics_scope"] = "openFiles",
					["background_analysis.dotnet_compiler_diagnostics_scope"] = "openFiles",
				},
			},
		})
	end,
}
