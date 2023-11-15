return {
	"yamatsum/nvim-nonicons",
	requres = { "nvim-tree/nvim-web-devicons" },
	event = "UiEnter",
	config = function()
		require("nvim-nonicons").setup()
	end,
}
