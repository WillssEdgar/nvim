return {
	{
		'sindrets/diffview.nvim',
		cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewClose' },
		keys = {
			{ '<leader>hf', '<cmd>DiffviewFileHistory %<cr>', desc = 'View git history for current file' },
			{ '<leader>hh', '<cmd>DiffviewFileHistory<cr>',   desc = 'View git history for repo' },
			{ '<leader>hv', '<cmd>DiffviewOpen<cr>',          desc = 'View modified files' },
			{ '<leader>hc', '<cmd>DiffviewClose<cr>',         desc = 'Close Diffview' },
		},
		opts = {
			enhanced_diff_hl = true,
			use_icons = true,
			view = {
				default = {
					layout = 'diff2_horizontal',
				},
			},
		},
		config = function(_, opts)
			require('diffview').setup(opts)

			local function set_diff_highlights()
				local is_dark = vim.o.background == 'dark'

				if is_dark then
					vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'none', bg = '#2e4b2e', bold = true })
					vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'none', bg = '#4c1e15', bold = true })
					vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'none', bg = '#45565c', bold = true })
					vim.api.nvim_set_hl(0, 'DiffText', { fg = 'none', bg = '#996d74', bold = true })
				else
					vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'none', bg = 'palegreen', bold = true })
					vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'none', bg = 'tomato', bold = true })
					vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'none', bg = 'lightblue', bold = true })
					vim.api.nvim_set_hl(0, 'DiffText', { fg = 'none', bg = 'lightpink', bold = true })
				end
			end

			set_diff_highlights()

			vim.api.nvim_create_autocmd('ColorScheme', {
				group = vim.api.nvim_create_augroup('DiffColors', { clear = true }),
				callback = set_diff_highlights
			})
		end
		-- end
	},
	{
		'lewis6991/gitsigns.nvim', -- See `:help gitsigns.txt`
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '[[', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'previous hunk' })
				vim.keymap.set('n', ']]', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'next hunk' })
				vim.keymap.set('n', '<leader>hs', require('gitsigns').toggle_current_line_blame,
					{ buffer = bufnr, desc = 'blame' })
			end,
		},
	},
	{
		-- Git commands in nvim
		"tpope/vim-fugitive",
		dependencies = {
			-- GitHub integration
			"tpope/vim-rhubarb",
		},
		event = "VeryLazy",
		config = function()
			-- Set up keymaps
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
			vim.keymap.set("v", "<leader>gb", "<cmd>GBrowse<CR>", { desc = "Open selection in GitHub" })

			-- Autocmds for Fugitive buffers
			local fugitiveGroup = vim.api.nvim_create_augroup("FugitiveConfig", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = fugitiveGroup,
				pattern = "fugitive",
				callback = function()
					-- Navigate to different sections in fugitive-status buffer
					vim.keymap.set("n", "gj", "<cmd>lua require('gitsigns').next_hunk()<CR>",
						{ buffer = true, desc = "Next git hunk" })
					vim.keymap.set("n", "gk", "<cmd>lua require('gitsigns').prev_hunk()<CR>",
						{ buffer = true, desc = "Previous git hunk" })
					-- Local keymaps when viewing git status
					vim.keymap.set("n", "cc", "<cmd>Git commit<CR>", { buffer = true, desc = "Create commit" })
					vim.keymap.set("n", "ca", "<cmd>Git commit --amend<CR>", { buffer = true, desc = "Amend commit" })
				end,
			})
		end,
	}
}
