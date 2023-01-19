local M = {
	'numToStr/Comment.nvim',
	event = 'BufEnter',
}

function M.config()
	require('Comment').setup {
		padding = true,
		sticky = true,
		toggler = {
			line = 'gcc',
			block = 'gbc',
		},
		opleader = {
			line = 'gc',
			block = 'gb',
		},
		extra = {
			above = 'gcO',
			below = 'gco',
			eol = 'gcA',
		},
		mappings = {
			basic = true,
			extra = true,
		},
	}
end

return M
