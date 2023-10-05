local common = require("plugins.lsp.common")
require("lspconfig").volar.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { 'vue' },
})
