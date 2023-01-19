local common = require 'plugins.lsp.common'

require('lspconfig').tsserver.setup {
	on_attatch = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
	cmd = { 'typescript-language-server', '--stdio' },
}
