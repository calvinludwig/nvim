return {
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		enabled = true,
		lazy = true,
		event = 'UIEnter',
		priority = 1000,
		config = function()
			require('rose-pine').setup {
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = 'auto',
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = 'main',
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
		enabled = false,
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
					theme = 'rose-pine',
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
