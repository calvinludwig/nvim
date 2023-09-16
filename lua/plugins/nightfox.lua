return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	enabled = false,
	-- event = "UIEnter",
	config = function()
		-- Default options
		require('nightfox').setup({
			options = {
				transparent = false, -- Disable setting background
				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false, -- Non focused panes set to alternative background
				module_default = true, -- Default enable value for modules
			},
			palettes = {},
			specs = {},
			groups = {},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("terafox")
	end,
}
