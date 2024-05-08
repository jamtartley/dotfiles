local diffview = require("diffview")

diffview.setup({
	view = {
		merge_tool = {
			layout = "diff3_mixed",
		},
	},
})
