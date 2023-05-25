local common = require "plugins.lsp.common"

require("lspconfig").gopls.setup {
	cmd = { "gopls" },
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},

			staticcheck = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
}
