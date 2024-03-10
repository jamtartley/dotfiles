local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local taggregator = require("jamtartley.taggregator")

local taggregator_cmp = {}

taggregator_cmp.new = function()
	local self = setmetatable({}, { __index = taggregator_cmp })
	return self
end

taggregator_cmp.get_keyword_pattern = function()
	return taggregator.tag_marker .. "\\w*"
end

taggregator_cmp.get_trigger_characters = function()
	return { taggregator.tag_marker }
end

taggregator_cmp.complete = function(_, request, callback)
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

cmp.setup({
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sources = {
		{ name = "taggregator" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path", keyword_length = 5 },
		{ name = "buffer" },
		{ name = "copilot" },
	},
	view = {
		entries = "custom",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

cmp.register_source("taggregator", taggregator_cmp.new())
