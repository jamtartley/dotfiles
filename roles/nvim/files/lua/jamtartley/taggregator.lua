local telescope_config = require("telescope.config")
local telescope_finders = require("telescope.finders")
local telescope_pickers = require("telescope.pickers")
local ivy = require("telescope.themes").get_ivy()

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

local function _tbl_slice(tbl, first, last, step)
	local sliced = {}

	for i = first or 1, last or #tbl, step or 1 do
		sliced[#sliced + 1] = tbl[i]
	end

	return sliced
end

local M = {}

M.tags = {
	"BUG",
	"CLEANUP",
	"FEATURE",
	"FIXME",
	"PERF",
	"REFACTOR",
	"SPEED",
	"TEMP",
	"TODO",
}

M.tag_marker = "@"

function M.run()
	local results = _get_tagged_lines(M.tags, M.tag_marker)

	if #results == 0 then
		print("No taggregator results found!")
		return
	end

	telescope_pickers
		.new(ivy, {
			prompt_title = "taggregator",
			finder = telescope_finders.new_table({
				results = results,
				entry_maker = function(entry)
					local parts = vim.split(entry, ":")
					local filename = parts[1]
					local lnum = tonumber(parts[2])
					local col = tonumber(parts[3])

					-- Reconstructing the line text from the remaining parts (in case it contains colons)
					-- This skips the first 3 parts which are filename, line number, and column number
					local line = table.concat(_tbl_slice(parts, 4), ":"):match("^%s*(.-)$")
					local display_filename = filename:match("([^/\\]+)$")

					return {
						value = line,
						display = display_filename .. ": " .. line,
						ordinal = line,
						filename = filename,
						lnum = lnum,
						col = col,
					}
				end,
			}),
			previewer = telescope_config.values.grep_previewer({}),
			sorter = telescope_config.values.file_sorter({}),
		})
		:find()
end

return M
