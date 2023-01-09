local M = {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
}

function M.config()
    require('rose-pine').setup {
        dark_variant = 'main',
    }
    vim.o.background = 'dark'
    vim.cmd.colorscheme 'rose-pine'
end

return M
