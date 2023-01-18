local common = require 'plugins.lsp.common'

require('lspconfig').cssls.setup {
    on_attatch = common.on_attach,
    capabilities = common.capabilities,
    cmd = { 'css-languageserver', '--stdio' },
}
