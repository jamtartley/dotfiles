local opts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

keymap("i", ";cl", "console.log()<left>", opts)

local function _get_eslint_executable()
	local mason_reg = require("mason-registry")
	local eslint_d_path = mason_reg.get_package("eslint_d"):get_install_path()
	local executable = eslint_d_path .. "/node_modules/.bin/eslint_d"

	if vim.fn.filereadable(executable) ~= 0 then
		return executable
	else
		P("Could not find eslint_d executable for makeprg, looked at: " .. executable)
		return
	end
end

local eslint_executable = _get_eslint_executable()
if eslint_executable ~= nil then
	vim.opt.makeprg = eslint_executable .. " --format unix %"
end
