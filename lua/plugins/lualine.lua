local M = {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = {
        options = {
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            theme = 'rose-pine',
            globalstatus = true,
            disabled_filetypes = {
                statusline = { 'lazy', 'alpha' },
                winbar = { 'lazy', 'alpha' },
            },
        },
    },
}

return M
