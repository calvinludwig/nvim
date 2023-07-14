local null_ls = require("null-ls")

local common = require("plugins.lsp.common")

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

require("mason-null-ls").setup({
	ensure_installed = { "eslint_d", "eslint" },
})

null_ls.setup({
	on_attach = common.on_attach,
	sources = {
		code_actions.refactoring,
		-- lua
		formatting.stylua,
		-- php
		diagnostics.php,
		formatting.pint.with({
			command = "pint",
		}),
		-- go
		diagnostics.golangci_lint,
		diagnostics.staticcheck,
		formatting.gofmt,
		formatting.goimports_reviser,
		formatting.golines,
		-- rust
		formatting.rustfmt,
		-- ts tsx
		require("typescript.extensions.null-ls.code-actions"),
		code_actions.eslint,
		diagnostics.eslint,
		diagnostics.tsc,
		formatting.eslint_d,
	},
})
