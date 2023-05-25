return {
	"luukvbaal/statuscol.nvim",
	event = "VeryLazy",
	opts = function()
		local builtin = require "statuscol.builtin"
		return {
			setopt = true,
			segments = {
				{
					sign = {
						name = {
							"Dap",
							"neotest", --[[ "Diagnostic" ]]
						},
						maxwidth = 1,
						colwidth = 2,
						auto = false,
					},
					click = "v:lua.ScSa",
				},
				{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
				{
					sign = {
						name = { "GitSigns" },
						maxwidth = 1,
						colwidth = 1,
						auto = false,
					},
					click = "v:lua.ScSa",
				},
			},
			ft_ignore = { "help", "vim", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "toggleterm" },
		}
	end,
}
