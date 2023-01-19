local M = {
	'ThePrimeagen/harpoon',
}

function M.config()
	local ui = require 'harpoon.ui'
	local mark = require 'harpoon.mark'
	require('harpoon').setup {
		menu = {
			borderchars = {
				Icons.border[2],
				Icons.border[4],
				Icons.border[6],
				Icons.border[8],
				Icons.border[1],
				Icons.border[3],
				Icons.border[5],
				Icons.border[7],
			},
		},
	}

	vim.keymap.set('n', '<leader>e', mark.add_file, { desc = 'Add file to Harpoon' })
	vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Open Harpoon menu' })

	for i = 1, 9, 1 do
		vim.keymap.set('n', '<leader>' .. i, function()
			ui.nav_file(i)
		end)
	end
end

return M
