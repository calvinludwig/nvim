return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		enabled = true,
		event = "UIEnter",
		config = function()
			require("rose-pine").setup {
				variant = "moon",
				dim_nc_background = true,
			}
			vim.cmd "colorscheme rose-pine"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		enabled = false,
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
				overrides = function(colors)
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
				end,
			}
			require("kanagawa").load "wave" -- dragon lotus wave
		end,
	},
	{
		"j-hui/fidget.nvim",
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
		"tamton-aquib/staline.nvim",
		event = "VeryLazy",
		enabled = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("staline").setup {
				sections = {
					left = { "  ", "mode", " ", "branch", " ", "lsp" },
					mid = {},
					right = { "file_name", "line_column" },
				},
				mode_colors = {
					i = "#c4b28a",
					n = "#8ea4a2",
					c = "#87a987",
					v = "#b6927b",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = "  ",
				},
			}
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
					theme = "rose-pine",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					section_separators = { left = "█", right = "█" },
					component_separators = "|",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = Icons.diagnostics.Error,
								warn = Icons.diagnostics.Warn,
								info = Icons.diagnostics.Info,
								hint = Icons.diagnostics.Hint,
							},
						},
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
					lualine_x = {
						{
							"diff",
							symbols = {
								added = Icons.git.added,
								modified = Icons.git.modified,
								removed = Icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return "  " .. os.date "%R"
						end,
					},
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
