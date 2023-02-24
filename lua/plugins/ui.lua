return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		enabled = true,
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
		'nvim-lualine/lualine.nvim',
		enabled = true,
		event = 'VeryLazy',
		config = function()
			require('lualine').setup {
				options = {
					theme = 'catppuccin',
				},
			}
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
}
