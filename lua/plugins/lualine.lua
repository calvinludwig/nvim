return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-navic").setup {
			highlight = true,
		}
		require("lualine").setup {
			options = {
				theme = "catppuccin",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				section_separators = { left = "█", right = "█" },
				component_separators = "|",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
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
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = {
							left = 1,
							right = 0,
						},
					},
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					-- stylua: ignore
					{
						function() return require("nvim-navic").get_location() end,
						cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
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
				lualine_y = {
					{ "progress", separator = " ",                  padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return "  " .. os.date "%R"
					end,
				},
			},
			extensions = { "neo-tree", "lazy" },
		}
	end,
}
