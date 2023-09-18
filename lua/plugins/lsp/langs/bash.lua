local common = require("plugins.lsp.common")
require("lspconfig").bashls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "sh", "bash", "zsh" },
})
