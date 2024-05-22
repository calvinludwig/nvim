local common = require("plugins.lsp.common")
local csharpls_extended = require("csharpls_extended")

require("lspconfig").csharp_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	handlers = {
		["textDocument/definition"] = csharpls_extended.handler,
		["textDocument/typeDefinition"] = csharpls_extended.handler,
	},
})
