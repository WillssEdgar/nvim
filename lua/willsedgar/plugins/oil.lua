return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			},
			float = {
				enable = true,   -- Enable floating window
				relative = "editor", -- Position relative to the editor
				width = 80,      -- Adjust width
				height = 40,     -- Adjust height
				border = "rounded", -- Change border style if needed
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", {})
	end,
}
