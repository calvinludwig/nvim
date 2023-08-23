local common = require("plugins.lsp.common")
require("lspconfig").tsserver.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
})
require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
		common.on_attach(client, bufnr)
	end,
	capabilities = common.capabilities,
})
