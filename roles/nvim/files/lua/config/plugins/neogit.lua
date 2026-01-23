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
