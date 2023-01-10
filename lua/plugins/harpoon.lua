local M = {
    'ThePrimeagen/harpoon',
}

function M.config()
    local ui = require 'harpoon.ui'
    local mark = require 'harpoon.mark'
    local border_chars = require('plugins.lsp.diagnostics').border_chars
    require('harpoon').setup {
        menu = {
            borderchars = {
                border_chars[2],
                border_chars[4],
                border_chars[6],
                border_chars[8],
                border_chars[1],
                border_chars[3],
                border_chars[5],
                border_chars[7],
            },
        },
    }

    vim.keymap.set('n', '<leader>e', mark.add_file, { desc = 'Add file to Harpoon' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Open Harpoon menu' })

    for i = 1, 9, 1 do
        vim.keymap.set('n', '<leader>' .. i, function()
            ui.nav_file(i)
        end)
    end
end

return M
