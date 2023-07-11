return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = true,
	enabled = true,
	event = "UIEnter",
	config = function()
		require("catppuccin").setup {
			flavour = "latte",
			term_colors = true,
			color_overrides = {
				latte = {
					base = "#FFFFFF",
					mantle = "#EFF1F5",
					crust = "#E6E9EF",
				},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				notify = true,
				telescope = true,
				alpha = true,
				harpoon = true,
				mason = true,
				neotree = true,
				treesitter_context = true,
				which_key = true,
				illuminate = true,
			},
		}
		vim.cmd.colorscheme "catppuccin"
	end,
}
