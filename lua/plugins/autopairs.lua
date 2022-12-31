local M = {
    'windwp/nvim-autopairs',
}

function M.config()
    local autopairs = require('nvim-autopairs')
    autopairs.setup({
        check_ts = true,
    })

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
