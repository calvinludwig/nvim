local M = {}

M.signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

M.border_chars = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' }

function M.setup()
    vim.diagnostic.config {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = '●' },
        severity_sort = true,
        float = { border = M.border_chars },
    }

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = M.border_chars })
    vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = M.border_chars })

    for type, icon in pairs(M.signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
end

return M
