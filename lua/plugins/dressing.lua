return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.input(...)
		end
	end,
	opts = {
		input = {
			enabled = true,
			border = Icons.border,
		},
		select = {
			enabled = true,
			nui = {
				border = {
					style = Icons.border,
				},
			},
			builtin = {
				border = Icons.border,
			},
		},
	},
}
