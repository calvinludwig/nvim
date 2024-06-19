local common = require("plugins.lsp.common")
require("neodev").setup({})
require("lspconfig").lua_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "Icons" },
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				checkThirdParty = false,
			},
		},
	},
})
