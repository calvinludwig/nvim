return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				section_separators = { left = "█", right = "█" },
				component_separators = "|",
			},
			sections = {
				lualine_a = { "mode", "searchcount", "selectioncount" },
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = {
							left = 1,
							right = 0,
						},
					},
					{ "filename", path = 1, symbols = { modified = " ●", readonly = "", unnamed = "" } },
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = Icons.diagnostics.Error,
							warn = Icons.diagnostics.Warn,
							info = Icons.diagnostics.Info,
							hint = Icons.diagnostics.Hint,
						},
					},
				},
				lualine_x = {
					{
						"diff",
						symbols = {
							added = Icons.git.added,
							modified = Icons.git.modified,
							removed = Icons.git.removed,
						},
					},
				},
				lualine_y = { "branch" },
				lualine_z = { "progress", "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
