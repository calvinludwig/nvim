local M = {
    'akinsho/nvim-bufferline.lua',
    event = 'BufAdd',
}

function M.config()
    local signs = require('plugins.lsp.diagnostics').signs

    signs = {
        error = signs.Error,
        warning = signs.Warn,
        info = signs.Info,
        hint = signs.Hint,
    }

    local severities = {
        'error',
        'warning',
        -- "info",
        -- "hint",
    }
    local hl = require 'rose-pine.plugins.bufferline'

    require('bufferline').setup {
        highlights = hl,
        options = {
            show_close_icon = false,
            diagnostics = 'nvim_lsp',
            always_show_bufferline = false,
            separator_style = 'thick',
            diagnostics_indicator = function(_, _, diag)
                local s = {}
                for _, severity in ipairs(severities) do
                    if diag[severity] then
                        table.insert(s, signs[severity] .. diag[severity])
                    end
                end
                return table.concat(s, ' ')
            end,
        },
    }
end

return M
