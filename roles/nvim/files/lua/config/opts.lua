local opts = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	cursorline = true,
	expandtab = false,
	fileencoding = "utf-8",
	fillchars = {
		diff = "∙",
		eob = " ",
		fold = " ",
		vert = "┃",
	},
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	hlsearch = true,
	ignorecase = true,
	incsearch = true,
	list = true,
	listchars = {
		space = "•",
		tab = "➜ ",
	},
	mouse = "a",
	number = true,
	numberwidth = 1,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 8,
	shiftwidth = 2,
	showmode = false,
	showtabline = 0,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 300,
	winborder = "rounded",
	wrap = true,
	writebackup = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(opts) do
	vim.opt[k] = v
end

vim.cmd("colorscheme dracula")
vim.cmd("packadd cfilter")
