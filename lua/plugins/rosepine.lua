return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
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
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}
