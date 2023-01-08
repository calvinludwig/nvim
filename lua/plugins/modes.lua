local M = {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    event = 'VeryLazy',
}

function M.config()
    require('modes').setup {
        colors = {
            copy = '#ebbcba',
            delete = '#eb6f92',
            insert = '#9ccfd8',
            visual = '#c4a7e7',
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.,

        -- Enable cursor highlights
        set_cursor = true,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,

        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree' },
    }
end

return M
