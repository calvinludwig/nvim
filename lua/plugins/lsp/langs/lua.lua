local common = require("plugins.lsp.common")
require("lspconfig").lua_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
