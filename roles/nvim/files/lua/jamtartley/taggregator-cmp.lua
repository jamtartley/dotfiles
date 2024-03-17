local taggregator = require("jamtartley.taggregator")

local M = {}

M.new = function()
	local self = setmetatable({}, { __index = M })
	return self
end

M.get_keyword_pattern = function()
	return taggregator.tag_marker .. "\\w*"
end

M.get_trigger_characters = function()
	return { taggregator.tag_marker }
end

M.complete = function(_, request, callback)
	local input = string.sub(request.context.cursor_before_line, request.offset)
	local items = {}

	for _, tag in ipairs(taggregator.tags) do
		local tag_with_prefix = taggregator.tag_marker .. tag

		if vim.startswith(tag_with_prefix, input) then
			table.insert(items, {
				label = tag,
				insertText = tag,
				filterText = tag_with_prefix,
				textEdit = {
					newText = tag_with_prefix .. ": ",
					range = {
						start = {
							line = request.context.cursor.row - 1,
							character = request.context.cursor.col - #input - 1,
						},
						["end"] = { line = request.context.cursor.row - 1, character = request.context.cursor.col - 1 },
					},
				},
			})
		end
	end

	callback({ items = items })
end

return M
