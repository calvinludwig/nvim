local common = require("plugins.lsp.common")
require("lspconfig").volar.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
