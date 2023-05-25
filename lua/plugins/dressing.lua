local M = {
	"stevearc/dressing.nvim",
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load { plugins = { "dressing.nvim" } }
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require("lazy").load { plugins = { "dressing.nvim" } }
			return vim.ui.input(...)
		end
	end,
}

function M.config()
	require("dressing").setup {
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
	}
end

return M
