return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	enabled = true,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
