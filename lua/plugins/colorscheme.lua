return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		enabled = true,
		config = function()
			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "macchiato",
				},
				color_overrides = {
					macchiato = {
						text = "#ffffff",
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
					latte = {
						text = "#444444",
						subtext1 = "#555555",
						subtext0 = "#666666",
						overlay2 = "#777777",
						overlay1 = "#888888",
						overlay0 = "#999999",
						surface2 = "#aaaaaa",
						surface1 = "#bbbbbb",
						surface0 = "#cccccc",
						base = "#ffffff",
						mantle = "#eeeeee",
						crust = "#dddddd",
					},
				},
				integrations = {
					telescope = {
						enabled = true,
						style = "nvchad",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		enabled = true,
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		config = function()
			local auto_dark_mode = require("auto-dark-mode")
			auto_dark_mode.setup({
				update_interval = 99999,
				set_dark_mode = function()
					vim.api.nvim_set_option("background", "dark")
					vim.cmd.colorscheme("catppuccin")
				end,
				set_light_mode = function()
					vim.api.nvim_set_option("background", "light")
					vim.cmd.colorscheme("catppuccin")
				end,
			})
			auto_dark_mode.disable()
		end,
	},
}
