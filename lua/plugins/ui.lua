return {
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		enabled = true,
		event = "UIEnter",
		config = function()
			require("kanagawa").setup {
				transparent = false,
				dim_inactive = false,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			}
			vim.opt.background = "dark"
			require("kanagawa").load "wave" -- dragon lotus wave
		end,
	},
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		enabled = true,
		event = "UIEnter",
		config = function()
			require("fidget").setup {
				window = {
					blend = 0,
				},
			}
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		event = "VeryLazy",
		config = function()
			require("statuscol").setup {}
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					section_separators = { left = "█", right = "█" },
					component_separators = "|",
				},
				sections = {
					lualine_a = { "mode", "searchcount", "selectioncount" },
					lualine_b = {
						{
							"branch",
						},
						{
							"diff",
							symbols = {
								added = Icons.git.added,
								modified = Icons.git.modified,
								removed = Icons.git.removed,
							},
						},
						{
							"diagnostics",
							symbols = {
								error = Icons.diagnostics.Error,
								warn = Icons.diagnostics.Warn,
								info = Icons.diagnostics.Info,
								hint = Icons.diagnostics.Hint,
							},
						},
					},
					lualine_c = {
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = {
								left = 1,
								right = 0,
							},
						},
						{ "filename", path = 1, symbols = { modified = " ●", readonly = "", unnamed = "" } },
					},
					lualine_x = {},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load { plugins = { "dressing.nvim" } }
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load { plugins = { "dressing.nvim" } }
				return vim.ui.input(...)
			end
		end,
		opts = {
			input = {
				enabled = true,
				border = Icons.border,
			},
			select = {
				enabled = true,
				nui = {
					border = {
						style = Icons.border,
					},
				},
				builtin = {
					border = Icons.border,
				},
			},
		},
	},
}
