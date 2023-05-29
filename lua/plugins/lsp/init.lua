function loadServer(server)
	local common = require "plugins.lsp.common"
	local lspconfig = require "lspconfig"
	local loaded, _ = pcall(require, "plugins.lsp.langs." .. server)
	if not loaded then
		lspconfig[server].setup {
			on_attach = common.on_attach,
			capabilities = common.capabilities,
		}
	end
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{ "folke/neodev.nvim",  opts = {} },
		"jose-elias-alvarez/typescript.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
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
			severity_sort = true,
		},
	},
	config = function()
		require("plugins.lsp.diagnostics").setup()
		require "plugins.lsp.null-ls"
		require("mason").setup()

		local servers = {
			"lua_ls",
			"rust_analyzer",
			"ruby_ls",
			"intelephense",
			"volar",
			"gopls",
			"tsserver",
			"taplo",
			"bashls",
			"jsonls",
			"tailwindcss",
			"cssls",
			"yamlls",
			"pyright",
			"marksman",
			"clangd",
			"cmake",
			"dockerls",
			"prismals",
		}

		require("mason-lspconfig").setup {
			ensure_installed = servers,
		}

		for _, server in ipairs(servers) do
			loadServer(server)
		end
		loadServer "ocamllsp"
	end,
}
