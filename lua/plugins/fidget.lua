return {
	enabled = true,
	"j-hui/fidget.nvim",
	event = "UIEnter",
	config = function()
		require("fidget").setup({ notification = { window = { winblend = 0 } } })
	end,
}
