return {
	"navarasu/onedark.nvim",
	lazy = false,
	enabled = true,
	config = function()
		-- Lua
		require('onedark').setup {
			-- Main options --
			style = 'darker',    -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false, -- Show/hide background
			term_colors = true,  -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
			code_style = {
				comments = 'italic',
				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none'
			},

			lualine = {
				transparent = true, -- lualine center bar transparency
			},
		}
		require('onedark').load()
	end,
}
