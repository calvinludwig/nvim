local common = require "plugins.lsp.common"

require("lspconfig").yamlls.setup {
	on_attatch = common.on_attach,
	capabilities = common.capabilities,
	cmd = { "yaml-language-server", "--stdio" },
}
