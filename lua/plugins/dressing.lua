local M = {
    'stevearc/dressing.nvim',
    init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
            require('lazy').load { plugins = { 'dressing.nvim' } }
            return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
            require('lazy').load { plugins = { 'dressing.nvim' } }
            return vim.ui.input(...)
        end
    end,
}

function M.config()
    local border_chars = require('ui.border').chars
    require('dressing').setup {
        input = {
            enabled = true,
            border = border_chars,
        },
        select = {
            enabled = true,
            nui = {
                border = {
                    style = border_chars,
                },
            },
            builtin = {
                border = border_chars,
            },
        },
    }
end

return M
