return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<leader>go"] = { name = "+go" },
			},
		},
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		event = "BufRead",
		opts = {},
		build = function()
			vim.cmd([[ silent! GoInstallDeps ]])
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>goe", "<cmd>GoIfErr <CR>", desc = "GoIfErr (Generate check err condition)" },
			{ "<leader>goj", "<cmd>GoTagAdd json <CR>", desc = "GoTagAdd json (Add json struct tags)" },
			{ "<leader>goy", "<cmd>GoTagAdd yaml <CR>", desc = "GoTagAdd yaml (Add yaml struct tags)" },
		},
	},
}
