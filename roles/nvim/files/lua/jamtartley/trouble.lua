local trouble = require("trouble")

trouble.setup({
	auto_close = true,
})

vim.keymap.set("n", "<leader>dd", trouble.toggle)
