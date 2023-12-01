return {
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPre",
		opts = {
			disable_diagnostics = true,
		},
	},
	{
		"sindrets/diffview.nvim",
		event = "BufReadPre",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
	},
}
