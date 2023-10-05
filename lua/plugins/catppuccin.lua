return {
	name = "catppuccin",
	"catppuccin/nvim",
	lazy = false,
	enabled = true,
	config = function()
		require("catppuccin").setup {
			flavour = "macchiato",
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				treesitter = true,
				mini = true,
				fidget = false,
				harpoon = true,
				neotree = true,
				which_key = true,
			}
		}
		vim.cmd.colorscheme "catppuccin"
	end,
}
