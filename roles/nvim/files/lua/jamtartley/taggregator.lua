local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local function _build_search_terms(tags, tag_marker)
	if not tags or #tags == 0 then
		return ""
	end

	local separator = " -e "
	local tag_string = ""

	for i, tag in ipairs(tags) do
		if i > 1 then
			tag_string = tag_string .. separator
		end
		tag_string = tag_string .. tag_marker .. tag
	end

	return separator .. tag_string
end

local function _get_tagged_lines(tags, tag_marker)
	local search_terms = _build_search_terms(tags, tag_marker)
	local root = vim.fn.getcwd()
	local command = "rg --column --no-heading --line-number --color=never " .. search_terms .. " " .. root
	local _, result = pcall(vim.fn.systemlist, command)

	return result
end

local M = {}

function M.run()
	local opts = {
		tag_marker = "@",
		tags = {
			"BUG",
			"CLEANUP",
			"FEATURE",
			"HACK",
			"NOCHECKIN",
			"REFACTOR",
			"ROBUSTNESS",
			"SPEED",
			"TODO",
			"TYPE",
		},
	}

	local results = _get_tagged_lines(opts.tags, opts.tag_marker)

	pickers
		.new({}, {
			prompt_title = "taggregator",
			finder = finders.new_table({
				results = results,
				entry_maker = function(entry)
					local split = vim.split(entry, ":")
					local filename = split[1]
					local lnum = tonumber(split[2])
					local col = tonumber(split[3])
					local line = split[4]

					return {
						value = line,
						display = vim.fn.expand(filename) .. ": " .. line,
						ordinal = line,
						filename = filename,
						lnum = lnum,
						col = col,
					}
				end,
			}),
			previewer = conf.qflist_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

return M
