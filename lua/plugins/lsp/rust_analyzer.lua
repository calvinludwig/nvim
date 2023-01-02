local common = require('plugins.lsp.common')
local use_rt = false

local settings = {
    ['rust-analyzer'] = {
        imports = {
            granularity = {
                group = 'module',
            },
            prefix = 'self',
        },
        cargo = {
            allFeatures = true,
            buildScripts = { enable = true },
        },
        checkOnSave = {
            command = 'clippy',
            extraArgs = {
                '--',
                '-W',
                'clippy::all',
                -- '-W', 'clippy::pedantic',
                -- '-W', 'clippy::nursery',
                '-W',
                'clippy::unwrap_used',
                '-W',
                'clippy::expect_used',
            },
        },
    },
}

if not use_rt then
    require('lspconfig').rust_analyzer.setup({
        on_attach = common.on_attach,
        capabilities = common.capabilities,
        settings = settings,
    })
    return
end

local rt = require('rust-tools')
rt.setup({
    server = {
        on_attach = function(client, bufnr)
            common.on_attach(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, opts)
            vim.keymap.set('n', '<leader>ca', rt.code_action_group.code_action_group, opts)
        end,
        capabilities = common.capabilities,
        settings = settings,
    },
})
