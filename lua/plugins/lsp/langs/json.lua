local common = require("plugins.lsp.common")
require("lspconfig").jsonls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
})
