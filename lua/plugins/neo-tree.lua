return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    branch = 'v2.x',
    keys = {
        { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'Neotree' },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
        {
            's1n7ax/nvim-window-picker',
            branch = 'v1.*',
            config = {
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                    bo = {
                        filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
                        buftype = { 'terminal', 'quickfix' },
                    },
                },
            },
        },
    },
    config = {
        close_if_last_window = true,
        popup_border_style = require('ui.border').chars,
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
            position = 'right',
            width = 60,
            mappings = {
                ['o'] = 'open',
            },
        },
        filesystem = {
            follow_current_file = true,
            components = {
                harpoon_index = function(config, node, state)
                    local Marked = require 'harpoon.mark'
                    local path = node:get_id()
                    local succuss, index = pcall(Marked.get_index_of, path)
                    if succuss and index and index > 0 then
                        return {
                            text = string.format(' ⥤ %d', index), -- <-- Add your favorite harpoon like arrow here
                            highlight = config.highlight or 'NeoTreeDirectoryIcon',
                        }
                    else
                        return {}
                    end
                end,
            },
            renderers = {
                file = {
                    { 'icon' },
                    { 'name', use_git_status_colors = true },
                    { 'harpoon_index' }, --> This is what actually adds the component in where you want it
                    { 'diagnostics' },
                    { 'git_status', highlight = 'NeoTreeDimText' },
                },
            },
        },
        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                indent_size = 4,
                padding = 0, -- extra padding on left hand side
                with_markers = false,
                highlight = 'NeoTreeIndentMarker',
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = '',
                expander_expanded = '',
                expander_highlight = 'NeoTreeExpander',
            },
            icon = {
                folder_closed = '',
                folder_open = '',
                folder_empty = 'ﰊ',
                default = '*',
                highlight = 'NeoTreeFileIcon',
            },
            modified = {
                symbol = '[+]',
                highlight = 'NeoTreeModified',
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = 'NeoTreeFileName',
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = '✖', -- this can only be used in the git_status source
                    renamed = '', -- this can only be used in the git_status source
                    -- Status type
                    untracked = '',
                    ignored = '',
                    unstaged = '',
                    staged = '',
                    conflict = '',
                },
            },
        },
    },
}
