return {
	"nvim-pack/nvim-spectre",
	event = "BufEnter",
	keys = {
		{
			"<leader>sr",
			function()
				require("spectre").open()
			end,
			desc = "Replace in files (Spectre)",
		},
	},
}
