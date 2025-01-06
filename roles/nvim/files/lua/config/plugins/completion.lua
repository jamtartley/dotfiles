return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
	version = "v0.*",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { window = { border = "single" } },
			menu = { border = "single" },
		},
		keymap = {
			preset = "enter",
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
		},
		signature = { enabled = true, window = { border = "single" } },
		sources = {
			cmdline = {},
			default = { "lsp", "path", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
	},
}
