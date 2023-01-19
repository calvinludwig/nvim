return {
	{
		'b0o/incline.nvim',
		event = 'BufReadPre',
		config = function()
			require('incline').setup {
				window = { margin = { vertical = 0, horizontal = 1 } },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					local icon, color = require('nvim-web-devicons').get_icon_color(filename)
					return { { icon, guifg = color }, { ' ' }, { filename } }
				end,
			}
		end,
	},
	{
		'petertriho/nvim-scrollbar',
		event = 'BufReadPost',
		config = function()
			local scrollbar = require 'scrollbar'
			scrollbar.setup {
				excluded_filetypes = { 'prompt', 'TelescopePrompt', 'noice', 'notify' },
				marks = {},
			}
		end,
	},
}
