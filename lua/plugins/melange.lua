return {
	"savq/melange-nvim",
	lazy = true,
	enabled = false,
	event = "UIEnter",
	config = function()
		vim.o.background = "light"
		vim.cmd.colorscheme("melange")
	end,
}
