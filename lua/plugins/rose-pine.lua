local M = {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
}

function M.config()
    require('rose-pine').setup {
        dark_variant = 'moon',
        dim_nc_background = true,
        disable_float_background = true,
    }
    vim.o.background = 'dark'
    vim.cmd.colorscheme 'rose-pine'
end

return M
