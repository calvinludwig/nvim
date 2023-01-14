return {
    'akinsho/bufferline.nvim',
    event = 'BufCreate',
    dependencies = {
        { 'roobert/bufferline-cycle-windowless.nvim', opts = { default_enabled = true } },
    },
    opts = {
        options = {
            numbers = function(opts)
                local success, index = pcall(require('harpoon.mark').get_index_of, vim.api.nvim_buf_get_name(opts.id))
                if success and index and index > 0 then
                    return opts.raise(index)
                else
                    return ''
                end
            end,
            separator_style = 'thick',
            themable = false,
            diagnostics = false,
            custom_filter = function(buf, _)
                if
                    vim.bo[buf].buflisted
                    and not vim.bo[buf].mod
                    and vim.api.nvim_buf_get_name(buf) == ''
                    and vim.fn.bufwinnr(buf) < 0
                then
                    return false
                else
                    return true
                end
            end,
            close_command = function()
                require('mini.bufremove').delete()
            end,
            diagnostics_indicator = function(_, level)
                return ' ' .. Icons.diagnostics[string.upper(level)]
            end,
            name_formatter = function(buffer)
                return ' ' .. buffer.name
            end,
        },
    },
}
