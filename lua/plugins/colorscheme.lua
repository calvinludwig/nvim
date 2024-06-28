return {
	{
		enabled = true,
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				default_integrations = true,
				integrations = {
					barbecue = {
						dim_dirname = true, -- directory name is dimmed by default
						bold_basename = true,
						dim_context = false,
						alt_background = false,
					},
					colorful_winsep = {
						enabled = true,
						color = "rosewater",
					},
					fidget = true,
					harpoon = true,
					mason = true,
					neotree = true,
					gitsigns = true,
					nvimtree = false,
					treesitter = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
					lsp_trouble = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme "catppuccin"
		end
	},
	{
		enabled = false,
		'projekt0n/github-nvim-theme',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup({
				-- ...
			})

			vim.cmd.colorscheme('github_dark_default')
		end,
	}
}
