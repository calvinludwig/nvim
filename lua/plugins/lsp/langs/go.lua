local common = require("plugins.lsp.common")
local util = require("lspconfig.util")
require("lspconfig").gopls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	cmd = { "gopls" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				unusedvariables = true,
				unusedwrite = true,
				nilness = true,
				useany = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})
