local common = require("plugins.lsp.common")
require("lspconfig").gopls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})
