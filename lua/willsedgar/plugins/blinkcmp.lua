return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	opts = {
		keymap = {
			preset = 'none',
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },
			['<Enter>'] = { 'accept', 'fallback' },
			-- ['<C-i>'] = { "show", "show_documentation", "hide_documentation" },
		},

		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = { documentation = { auto_show = false } },
		fuzzy = { implementation = "lua" }
	},
}
