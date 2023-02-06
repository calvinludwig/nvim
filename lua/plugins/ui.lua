return {
	{
		'shaunsingh/nord.nvim',
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = false
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true
			require('nord').set()
			vim.cmd.colorscheme 'nord'
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		enabled = true,
		event = 'UIEnter',
		config = function()
			require('lualine').setup {
				options = {
					theme = 'nord',
				},
			}
		end,
	},
	{
		'akinsho/bufferline.nvim',
		enabled = true,
		event = 'UIEnter',
		config = function()
			local highlights = require('nord').bufferline.highlights {
				fill = Nord.nord2_gui,
				indicator = Nord.nord9_gui,
				bg = Nord.nord1_gui,
				buffer_bg = Nord.nord1_gui,
				buffer_bg_selected = Nord.nord0_gui,
				italic = true,
				bold = true,
			}

			require('bufferline').setup {
				options = {
					separator_style = 'slant',
				},
				highlights = highlights,
			}
		end,
	},
	{
		'j-hui/fidget.nvim',
		enabled = true,
		event = 'UIEnter',
		config = function()
			require('fidget').setup {}
		end,
	},
}
