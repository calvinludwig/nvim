local M = {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}

function M.config()
    if not package.loaded.trouble then
        package.preload.trouble = function()
            return true
        end
    end
    require('gitsigns').setup {
        current_line_blame_formatter = '<author>:<author_time:%Y-%m-%d> - <summary>',
        signs = {
            add = { hl = 'GitSignsAdd', text = '▍', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change = { hl = 'GitSignsChange', text = '▍', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete = { hl = 'GitSignsDelete', text = '▁', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '▔',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '▁',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
            untracked = { hl = 'GitSignsAdd', text = '▍', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        },
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'right_align',
            delay = 10,
            ignore_whitespace = false,
        },
    }
end

return M
