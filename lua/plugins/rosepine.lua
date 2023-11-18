return {
	"rose-pine/neovim",
	name = "rose-pine",
	event = "VimEnter",
	enabled = true,
	config = function()
		require("rose-pine").setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = "auto",
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = "moon",
			bold_vert_split = false,
			dim_nc_background = false,
			disable_background = true,
			disable_float_background = true,
			disable_italics = false,
			groups = {
				error = "love",
				hint = "iris",
				info = "foam",
				warn = "gold",
				punctuation = "muted",
			},
			highlight_groups = {
				Comment = { fg = "love", bold = true, italic = true },
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}
