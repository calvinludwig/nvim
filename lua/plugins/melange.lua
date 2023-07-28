return {
	"savq/melange-nvim",
	lazy = true,
	enabled = true,
	event = "UIEnter",
	config = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("melange")
		vim.wo.fillchars = "eob: "
	end,
}
