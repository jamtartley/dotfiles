local M = {}

local config = {
	keywords = {
		"BUG",
		"CLEANUP",
		"FIXME",
		"HACK",
		"REFACTOR",
		"TODO",
	},
}

local function notify(msg, level)
	vim.notify(msg, level or vim.log.levels.INFO, { title = "taggregator" })
end

local function escape_pattern(text)
	return text:gsub("([^%w])", "\\%1")
end

local function build_regex(keywords)
	local escaped = vim.tbl_map(escape_pattern, keywords)
	return "@(" .. table.concat(escaped, "|") .. ")\\b"
end

local function get_git_root()
	local cwd = vim.fn.expand("%:p:h")
	if cwd == "" then
		cwd = vim.loop.cwd()
	end

	local result = vim.system({ "git", "rev-parse", "--show-toplevel" }, { cwd = cwd, text = true }):wait()
	if result.code ~= 0 then
		return nil
	end

	return vim.trim(result.stdout)
end

local function scan(root, keywords)
	local result = vim.system({
		"rg",
		"--vimgrep",
		"--no-heading",
		build_regex(keywords),
		root,
	}, { text = true }):wait()

	if result.code ~= 0 and result.code ~= 1 then
		return nil, vim.trim(result.stderr)
	end

	local entries = {}
	for _, line in ipairs(vim.split(result.stdout or "", "\n", { trimempty = true })) do
		local file, row, col, text = line:match("^(.-):(%d+):(%d+):(.*)$")
		if file ~= nil then
			table.insert(entries, {
				filename = file,
				lnum = tonumber(row),
				col = tonumber(col),
				text = text,
			})
		end
	end

	return entries
end

function M.show(opts)
	opts = opts or {}
	local ok, fzf = pcall(require, "fzf-lua")
	if not ok then
		notify("fzf-lua is required", vim.log.levels.ERROR)
		return
	end

	if vim.fn.executable("git") ~= 1 then
		notify("git is required", vim.log.levels.ERROR)
		return
	end

	if vim.fn.executable("rg") ~= 1 then
		notify("ripgrep is required", vim.log.levels.ERROR)
		return
	end

	local root = get_git_root()
	if root == nil or root == "" then
		notify("not inside a git repository", vim.log.levels.WARN)
		return
	end

	local keywords = opts.keywords or config.keywords
	if #keywords == 0 then
		notify("no tag keywords configured", vim.log.levels.WARN)
		return
	end

	local entries, err = scan(root, keywords)
	if entries == nil then
		notify(err and err ~= "" and err or "scan failed", vim.log.levels.ERROR)
		return
	end

	vim.fn.setqflist({}, " ", {
		title = string.format("Project Tags (%s)", table.concat(keywords, ", ")),
		items = vim.tbl_map(function(entry)
			return {
				filename = entry.filename,
				lnum = entry.lnum,
				col = entry.col,
				text = entry.text,
			}
		end, entries),
	})

	fzf.quickfix({
		prompt = "Project Tags> ",
		cwd = root,
	})
end

function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})

	pcall(vim.api.nvim_del_user_command, "Taggregator")
	vim.api.nvim_create_user_command("Taggregator", function(command_opts)
		local keywords = nil
		if command_opts.args ~= "" then
			keywords = vim.tbl_map(vim.trim, vim.split(command_opts.args, ",", { trimempty = true }))
		end
		M.show({ keywords = keywords })
	end, {
		desc = "Show project tag comments in fzf-lua",
		nargs = "?",
	})
	return M
end

return M
