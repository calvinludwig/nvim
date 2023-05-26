local common = require "plugins.lsp.common"

local settings = {
	["rust-analyzer"] = {
		imports = {
			granularity = {
				group = "module",
			},
			prefix = "self",
		},
		cargo = {
			allFeatures = true,
			buildScripts = { enable = true },
		},
		checkOnSave = {
			command = "clippy",
			extraArgs = {
				"--",
				"-W",
				"clippy::all",
			},
		},
	},
}

require("lspconfig").rust_analyzer.setup {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
	settings = settings,
}
