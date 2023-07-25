return {
	"Canop/nvim-bacon",
	lazy = false,
	config = function()
		require("bacon").setup({
			enabled = true,
			event_trigger = true,
		})
	end
}
