local undotree = require("undotree")

undotree.setup({
	position = "right",
	window = {
		winblend = 0,
	},
})

vim.keymap.set("n", "<leader>u", undotree.toggle, { noremap = true, silent = true })
