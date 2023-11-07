return {
	"numToStr/Comment.nvim",
	event = "BufEnter",
	opts = {
		padding = true,
		sticky = true,
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		opleader = {
			line = "gc",
			block = "gb",
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		},
		mappings = {
			basic = true,
			extra = true,
		},
	},
}
