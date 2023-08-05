local options = {
	backup         = false,
	clipboard      = "unnamedplus",
	cmdheight      = 1,
	completeopt    = { "menuone", "noselect" },
	conceallevel   = 0,
	cursorline     = true,
	expandtab      = false,
	fileencoding   = "utf-8",
	fillchars      = {
		diff = '∙',
		eob = ' ',
		fold = ' ',
		vert = '┃',
	},
	foldlevelstart = 99,
	foldmethod     = "indent",
	hlsearch       = true,
	ignorecase     = true,
	list           = true,
	listchars      = {
		space = '•',
		tab = '➜ '
	},
	mouse          = "a",
	number         = true,
	numberwidth    = 1,
	pumheight      = 10,
	relativenumber = true,
	scrolloff      = 8,
	shiftwidth     = 2,
	showmode       = false,
	showtabline    = 0,
	sidescrolloff  = 8,
	signcolumn     = "yes",
	smartcase      = true,
	smartindent    = true,
	splitbelow     = true,
	splitright     = true,
	swapfile       = false,
	tabstop        = 2,
	termguicolors  = true,
	timeoutlen     = 1000,
	undofile       = true,
	updatetime     = 300,
	wrap           = false,
	writebackup    = false,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
