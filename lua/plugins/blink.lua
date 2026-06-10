return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",

	opts = {
		keymap = {
			preset = "enter",
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono"
		},
	}
}
