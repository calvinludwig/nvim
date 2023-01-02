local M = {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
        'simrat39/rust-tools.nvim',
        'jose-elias-alvarez/null-ls.nvim',
        'simrat39/rust-tools.nvim',
        'folke/neodev.nvim',
    },
}

function M.config()
    require('plugins.lsp.diagnostics').setup()
    require('plugins.lsp.null-ls')
    local common = require('plugins.lsp.common')
    local lspconfig = require('lspconfig')

    local servers = {
        'sumneko_lua',
        'rust_analyzer',
        'intelephense',
        'gopls',
        'tsserver',
        'taplo',
        'bashls',
        'jsonls',
        'tailwindcss',
        'cssls',
        'yamlls',
        'pyright',
        'marksman',
        'clangd',
        'cmake',
    }

    for _, server in ipairs(servers) do
        local loaded, _ = pcall(require, 'plugins.lsp.' .. server)
        if not loaded then
            lspconfig[server].setup({
                on_attach = common.on_attach,
                capabilities = common.capabilities,
            })
        end
    end
end

return M
