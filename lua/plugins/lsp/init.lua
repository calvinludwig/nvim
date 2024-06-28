return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		{ "folke/neodev.nvim",                   event = "BufEnter", ft = "lua" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
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
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
			severity_sort = false,
		},
	},
	config = function()
		local servers = {
			"lua_ls",
			"phpactor",
			"tsserver",
			"biome",
			"jsonls",
			"rust_analyzer",
			"taplo",
			"gopls",
			"yamlls",
			"bashls",
			"dockerls",
			"docker_compose_language_service",
		}
		require("mason").setup()
		require("mason-lspconfig").setup({ ensure_installed = servers })
		require("plugins.lsp.diagnostics").setup()

		local langs = {
			"lua",
			"typescript",
			"json",
			"rust",
			"toml",
			"go",
			"yaml",
			"bash",
			"docker",
			"php",
		}

		for _, lang in ipairs(langs) do
			require("plugins.lsp.langs." .. lang)
		end
	end,
}
