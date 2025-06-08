return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		'saghen/blink.cmp',
	},

	config = function()
		local blink = require('blink.cmp').get_lsp_capabilities()
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			blink
		);
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				-- "html",
				-- "bashls",
				-- "marksman",
				-- "gopls",
				-- "rust_analyzer",
				-- "jsonls",
				-- "ast_grep",
			},
			handlers = {
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
					}
				end,
			}
		});

		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = true,
		});

		vim.api.nvim_create_autocmd("lspattach", {
			group = vim.api.nvim_create_augroup("userlspconfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)
			end,
		})
	end,
}
