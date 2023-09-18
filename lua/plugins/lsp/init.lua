return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim" },
		"simrat39/rust-tools.nvim",
		{
			"saecki/crates.nvim",
			tag = "v0.3.0",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("crates").setup()
			end,
		},
	},
	opts = {
		-- options for vim.diagnostic.config()
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
				-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
				-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
				-- prefix = "icons",
			},
			severity_sort = false,
		},
	},
	config = function()
		require("plugins.lsp.diagnostics").setup()
		local langs = {
			"rust",
			"lua",
			"php",
			"ts",
			"toml",
			"yaml",
			"bash",
			"docker",
			"sql",
			"json",
		}

		for _, lang in ipairs(langs) do
			require("plugins.lsp.langs." .. lang)
		end
	end,
}
