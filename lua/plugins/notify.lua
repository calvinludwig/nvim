return {
	"rcarriga/nvim-notify",
	event = "VimEnter",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = "#000000",
		})
		vim.notify = notify
	end,
}
