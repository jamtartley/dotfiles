return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("neogit").setup({
			disable_commit_confirmation = true,
			disable_hint = true,
			disable_signs = true,
			highlight = {
				italic = true,
				bold = true,
				underline = true,
			},
			git_services = {
				["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
				["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
			},
			graph_style = "unicode",
			integrations = {
				diffview = true,
			},
			mappings = {
				status = {
					["Q"] = false,
				},
			},
			remember_settings = false,
		})
	end,
}
