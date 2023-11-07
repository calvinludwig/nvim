local common = require("plugins.lsp.common")
require("lspconfig").phpactor.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = true,
	},
	filetypes = { "php" },
})
