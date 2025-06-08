return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						['<C-u>'] = false,
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					}
				}
			},
			pickers = {
				oldfiles = {
					cwd_only = true,
				}
			},
		})
		local keymap = vim.keymap -- for conciseness
		local builtin = require('telescope.builtin')
		local themes = require('telescope.themes')
		local ivy = themes.get_ivy()

		-- Corrected key mappings with functions and proper syntax
		keymap.set("n", "<leader>ff", function()
			builtin.find_files(ivy)
		end, { desc = "Fuzzy find files" })

		keymap.set("n", "<leader>fr", function()
			builtin.oldfiles(ivy)
		end, { desc = "Fuzzy find recent files" })

		keymap.set("n", "<leader>fs", function()
			builtin.live_grep(ivy)
		end, { desc = "Find string" })

		keymap.set("n", "<leader>fm", function()
			builtin.marks()
		end, { desc = "Fuzzy Find Marks" })

	end,
}
