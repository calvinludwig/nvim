return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	enabled = true,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			color_overrides = {
				macchiato = {
					text = "#f5f5f5",
					subtext1 = "#ebebeb",
					subtext0 = "#e0e0e0",
					overlay2 = "#cccccc",
					overlay1 = "#b3b3b3",
					overlay0 = "#999999",
					surface2 = "#424242",
					surface1 = "#3d3d3d",
					surface0 = "#383838",
					base = "#202020",
					mantle = "#262626",
					crust = "#2b2b2b",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
