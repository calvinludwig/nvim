local common = require("plugins.lsp.common")
local util = require("lspconfig/util")

require("lspconfig").gopls.setup({
	on_attatch = common.on_attach,
	capabilities = common.capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})
