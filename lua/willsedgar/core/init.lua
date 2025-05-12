require("willsedgar.core.options")
require("willsedgar.core.keymaps")
require("willsedgar.core.utils")
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1c1c1c", fg = "#d0d0d0" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#373f4a" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#51576D", })
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2e2e3e", fg = "#ffffff" })
	end,
})
vim.cmd("colorscheme habamax")
