return {
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		enabled = false,
		event = "UIEnter",
		config = function()
			require("kanagawa").setup {}
			require("kanagawa").load "wave"
		end,
	},
	{
		"catppuccin/nvim",
		enabled = true,
		name = "catppuccin",
		lazy = true,
		event = "UIEnter",
		priority = 1000,
		config = function()
			require("catppuccin").setup {
				flavour = "macchiato",
				transparent_background = false,
				show_end_of_buffer = false,
				term_colors = true,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					telescope = true,
					harpoon = true,
					fidget = true,
					mason = true,
					neotree = true,
					navic = {
						enabled = true,
						custom_bg = "#1e2030",
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
				},
			}
			vim.cmd.colorscheme "catppuccin"
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
		"karb94/neoscroll.nvim",
		lazy = false,
		opts = {},
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
		event = "VeryLazy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-navic").setup {
				highlight = true,
			}
			require("lualine").setup {
				options = {
					theme = "auto",
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
						-- stylua: ignore
						{
							function() return require("nvim-navic").get_location() end,
							cond = function()
								return package.loaded["nvim-navic"] and
									require("nvim-navic").is_available()
							end,
						},
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
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss { silent = true, pending = true }
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
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
