return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	event = "BufEnter",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		require("barbecue").setup({
			theme = "catppuccin-latte",
		})
	end,
}
