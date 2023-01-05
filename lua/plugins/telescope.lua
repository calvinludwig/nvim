local M = {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    lazy = false,
}

function M.config()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local options = {
        defaults = {
            sorting_strategy = 'ascending',
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                },
                vertical = {
                    mirror = false,
                },
            },
            borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
            color_devicons = true,
            file_sorter = require('telescope.sorters').get_fuzzy_file,
            generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        },
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown {},
            },
            file_browser = {
                theme = 'ivy',
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
            },
        },
    }
    telescope.setup(options)

    telescope.load_extension 'fzf'
    telescope.load_extension 'file_browser'
    telescope.load_extension 'ui-select'
    telescope.load_extension 'harpoon'

    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>fb', function()
        require('telescope').extensions.file_browser.file_browser { path = '%:p:h' }
    end, { desc = '[F]ile [B]rowser' })
    vim.keymap.set('n', '<leader>p', builtin.git_files, { desc = 'Git files' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, { desc = '[/] Fuzzily search in current buffer]' })
end

return M
