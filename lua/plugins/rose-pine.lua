return {
	"rose-pine/nvim",
	name = "rose-pine",
	lazy = true,
	enabled = true,
	event = "UIEnter",
	config = function()
		require('rose-pine').setup({
			variant = 'moon'
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
