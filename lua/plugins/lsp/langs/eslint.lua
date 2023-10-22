local common = require("plugins.lsp.common")

local on_attach = function(client, bufnr)
	common.on_attach(client, bufnr)
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = bufnr,
		command = "EslintFixAll",
	})
end

require("lspconfig").eslint.setup({
	on_attach = on_attach,
	capabilities = common.capabilities,
})
