local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local M = {}

local function _get_lines(tags)
	tags = tags
		or {
			"@BUG",
			"@CLEANUP",
			"@FEATURE",
			"@HACK",
			"@NOCHECKIN",
			"@REFACTOR",
			"@ROBUSTNESS",
			"@SPEED",
			"@TODO",
		}

	local searches = vim.fn.join(tags, " -e ")
	local command = "rg -i --no-heading --line-number --color=never -e " .. searches .. vim.fn.getcwd()
	local _, result = pcall(vim.fn.systemlist, command)

	return result
end

function M.run(opts)
	opts = opts or {}

	local results = _get_lines(opts.tags)

	pickers
		.new(opts, {
			prompt_title = "taggregator",
			finder = finders.new_table({
				results = results,
				entry_maker = function(entry)
					local split = vim.split(entry, ":")

					return {
						value = entry,
						display = entry,
						ordinal = entry,
						filename = split[1],
						lnum = tonumber(split[2]),
						col = 0,
					}
				end,
			}),
			previewer = conf.qflist_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return M
