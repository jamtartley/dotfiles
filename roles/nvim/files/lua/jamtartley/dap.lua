vim.keymap.set("n", "<leader>d1", ":lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>d2", ":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>")
vim.keymap.set("n", "<leader>d3", ":lua require'dapui'.toggle()<cr>")
vim.keymap.set("n", "<leader>d4", ":lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>d5", ":lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>d6", ":lua require'dap'.step_into()<cr>")

local dap = require("dap")
local dap_go = require("dap-go")
local dap_ui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = dap_ui.open
dap.listeners.before.event_terminated["dapui_config"] = dap_ui.close
dap.listeners.before.event_exited["dapui_config"] = dap_ui.close

dap_go.setup({
	dap_configurations = {
		{
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
})

dap_ui.setup({
	expand_lines = false,
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.8,
				},
				{
					id = "watches",
					size = 0.2,
				},
			},
			position = "right",
			size = 0.4,
		},
	},
})
