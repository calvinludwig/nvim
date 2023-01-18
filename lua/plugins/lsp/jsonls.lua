local common = require 'plugins.lsp.common'

require('lspconfig').jsonls.setup {
    on_attatch = common.on_attach,
    capabilities = common.capabilities,
    cmd = { 'vscode-json-languageserver', '--stdio' },
}
