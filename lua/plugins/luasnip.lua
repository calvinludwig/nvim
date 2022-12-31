local M = {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
}

function M.config()
    require('luasnip.loaders.from_vscode').lazy_load()
    local luasnip = require('luasnip')

    luasnip.config.setup({
        history = true,
        enable_autosnippets = true,
        -- Update more often, :h events for more info.
        updateevents = 'TextChanged,TextChangedI',
    })
end

return M
