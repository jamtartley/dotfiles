local grapple = require("grapple")
local keymap = vim.keymap.set

keymap("n", "m", function()
	grapple.toggle()
end)
keymap("n", "M", function()
	grapple.toggle_tags()
end)
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<CR>")
