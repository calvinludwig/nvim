local common = require("plugins.lsp.common")

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

require("lspconfig").tsserver.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

require 'lspconfig'.biome.setup {}
