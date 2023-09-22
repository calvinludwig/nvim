return {
	name = "catppuccin",
	"catppuccin/nvim",
	lazy = false,
	enabled = true,
	config = function()
		require("catppuccin").setup {
			flavour = "macchiato",
		}
		vim.cmd.colorscheme "catppuccin"
	end,
}
