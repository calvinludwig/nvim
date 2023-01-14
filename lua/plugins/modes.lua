local M = {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    event = 'VeryLazy',
}

function M.config()
    require('modes').setup {
        colors = {
            copy = Kanagawa.winterGreen,
            delete = Kanagawa.winterRed,
            insert = Kanagawa.winterBlue,
            visual = Kanagawa.winterYellow,
        },

        -- Set opacity for cursorline and number background
        line_opacity = 1,

        -- Enable cursor highlights
        set_cursor = false,

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
