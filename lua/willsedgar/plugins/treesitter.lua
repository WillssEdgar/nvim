return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,       -- Automatically jump forward to textobj
						keymaps = {
							["af"] = "@function.outer", -- Select a function
							["if"] = "@function.inner", -- Select inner function
							["as"] = "@statement.outer", -- Select a statement
							["is"] = "@statement.inner", -- Select inner statement
						},
					},
				},
			})

			vim.opt.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldlevelstart = 99

			-- Custom parser configuration for xquery
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.xquery = {
				install_info = {
					url = "~/tree-sitter-xquery",
					files = { "src/parser.c" },
					branch = "main",
				},
				-- filetype = "xq",
			}

			require("nvim-ts-autotag").setup({
				enable = true,
				filetypes = { "html", "xml", "vue", "jsx", "tsx" },
				per_filetype = {
					html = {
						enable_close = true,
					},
				},
			})
		end
	}
}
