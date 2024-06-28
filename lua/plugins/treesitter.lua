return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = vim.fn.argc(-1) == 0,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = {
					"php",
					"typescript",
					"tsx",
					"javascript",
					"lua",
					"fish",
					"go",
					"gomod",
					"html",
					"css",
					"xml",
					"rust",
					"toml",
					"yaml",
					"bash",
					"dockerfile",
					"sql",
					"json",
					"comment",
					"regex",
					"query",
					"markdown",
				},
				autotag = { enable = true },
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
