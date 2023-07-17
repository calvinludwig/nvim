return {
	"freddiehaddad/feline.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local ctp_feline = require("catppuccin.groups.integrations.feline")
		require("feline").setup({
			components = ctp_feline.get(),
		})
	end,
}
