return {
	'stevearc/conform.nvim',
	opts = {
		formatters = {
			prettier = {
				command = "prettier",
				args = {
					"--stdin-filepath", "$FILENAME",
				},
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			go = { "goimports", "gofmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			python = { "black" },
		},
	},
	config = function()
		local format_on_save_filetypes = {
			"lua",
			"rust",
			"go",
		}

		local group = vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = group,
			callback = function()
				local buf_ft = vim.bo.filetype
				if vim.tbl_contains(format_on_save_filetypes, buf_ft) then
					require('conform').format({ async = false, lsp_fallback = true })
				end
			end,
		})
	end,
}
