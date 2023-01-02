local M = {
    'feline-nvim/feline.nvim',
    lazy = false,
}

function M.config()
    local feline = require('feline')
    local ctp_feline = require('catppuccin.groups.integrations.feline')

    ctp_feline.setup({
        assets = {
            left_separator = '',
            right_separator = '',
            bar = '',
            mode_icon = ' ',
        },
    })

    feline.setup({
        components = ctp_feline.get(),
    })

    local navic = require('nvim-navic')

    local components = {
        active = {},
        inactive = {},
    }
    -- Insert three sections (left, mid and right) for the active statusline
    table.insert(components.active, {})
    table.insert(components.active, {})
    table.insert(components.active, {})

    -- Insert two sections (left and right) for the inactive statusline
    table.insert(components.inactive, {})
    table.insert(components.inactive, {})
    table.insert(components.active[1], {
        provider = function()
            return navic.get_location()
        end,
        enabled = function()
            return navic.is_available()
        end,
    })
    feline.winbar.setup({ components = components })
end

return M
