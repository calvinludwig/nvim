local M = {
    'ThePrimeagen/harpoon',
}

function M.config()
    local ui = require 'harpoon.ui'
    local mark = require 'harpoon.mark'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add file to Harpoon' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'Open Harpoon menu' })

    for i = 1, 9, 1 do
        vim.keymap.set('n', '<leader>' .. i, function()
            ui.nav_file(i)
        end)
    end
end

return M
