return {
	"luukvbaal/statuscol.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function()
		require("statuscol").setup({})
	end,
}
