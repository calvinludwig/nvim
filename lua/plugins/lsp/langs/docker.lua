local common = require("plugins.lsp.common")
require("lspconfig").dockerls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
})

