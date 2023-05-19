local colorschemes = { 'github', 'gruvbox-material', 'gruvbox-baby', 'rose-pine', 'catppuccin' }

local colorscheme = colorschemes[1]

return {
	{
		'nvim-lualine/lualine.nvim',
		enabled = true,
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
		config = function()
			require('lualine').setup {}
		end,
	},
	{
		'projekt0n/github-nvim-theme',
		enabled = colorscheme == 'github',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup {}
			vim.cmd 'colorscheme github_light'
		end,
	},
	{
		'luisiacc/gruvbox-baby',
		enabled = colorscheme == 'gruvbox-baby',
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'gruvbox-baby'
		end,
	},
	{
		'sainnhe/gruvbox-material',
		enabled = colorscheme == 'gruvbox-material',
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'gruvbox-material'
		end,
	},
	{
		'olivercederborg/poimandres.nvim',
		enabled = colorscheme == 'poimandres',
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			require('poimandres').setup {
				bold_vert_split = false, -- use bold vertical separators
				dim_nc_background = false, -- dim 'non-current' window backgrounds
				disable_background = false, -- disable background
				disable_float_background = false, -- disable background for floats
				disable_italics = false, -- disable italics
			}
			vim.cmd.colorscheme 'poimandres'
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		enabled = colorscheme == 'rose-pine',
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			require('rose-pine').setup {
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = 'auto',
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = 'moon',
				bold_vert_split = false,
				dim_nc_background = true,
				disable_background = false,
				disable_float_background = true,
				disable_italics = false,
			}
			vim.cmd.colorscheme 'rose-pine'
		end,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		enabled = colorscheme == 'catppuccin',
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			require('catppuccin').setup {
				flavour = 'frappe',
				transparent_background = false,
				show_end_of_buffer = false,
				term_colors = true,
				dim_inactive = {
					enabled = false,
					shade = 'dark',
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
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { 'italic' },
							hints = { 'italic' },
							warnings = { 'italic' },
							information = { 'italic' },
						},
						underlines = {
							errors = { 'underline' },
							hints = { 'underline' },
							warnings = { 'underline' },
							information = { 'underline' },
						},
					},
				},
			}
			vim.cmd.colorscheme 'catppuccin'
		end,
	},
	{
		'j-hui/fidget.nvim',
		enabled = true,
		event = 'UIEnter',
		config = function()
			require('fidget').setup {
				window = {
					blend = 0,
				},
			}
		end,
	},
	{
		'utilyre/barbecue.nvim',
		enabled = true,
		name = 'barbecue',
		event = 'VeryLazy',
		version = '*',
		dependencies = {
			'SmiteshP/nvim-navic',
			'nvim-tree/nvim-web-devicons', -- optional dependency
		},
		opts = {
			theme = 'catppuccin',
			create_autocmd = true,
			show_modified = true,
		},
	},
	{
		'shortcuts/no-neck-pain.nvim',
		version = '*',
		enabled = true,
		event = 'UIEnter',
		config = function()
			require('no-neck-pain').setup {
				buffers = {
					right = {
						enabled = false,
					},
				},
			}
		end,
	},
}
