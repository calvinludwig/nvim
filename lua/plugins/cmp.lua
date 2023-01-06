local M = {
    event = 'InsertEnter',
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-cmdline' },
        { 'dmitmel/cmp-cmdline-history' },
        'hrsh7th/cmp-buffer',
        'petertriho/cmp-git',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'saecki/crates.nvim',
        'hrsh7th/cmp-calc',
        'octaltree/cmp-look',
    },
}

function M.config()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('crates').setup()

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end
    cmp.setup {
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources = cmp.config.sources {
            {
                name = 'nvim_lsp',
                entry_filter = function(entry, context)
                    local kind = entry:get_kind()
                    local line = context.cursor_line
                    local col = context.cursor.col
                    local char_before_cursor = string.sub(line, col - 1, col - 1)

                    if char_before_cursor == '.' then
                        return kind == 2 or kind == 5
                    end

                    if string.match(line, '^%s*%w*$') then
                        return kind == 2 or kind == 5
                    end

                    return true
                end,
            },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lsp_document_symbol' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
        },
        {
            { name = 'look' },
            { name = 'buffer', keyword_length = 3 },
            { name = 'path' },
            { name = 'crates' },
            { name = 'calc' },
        },
        window = {
            completion = cmp.config.window.bordered {
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            },
            documentation = cmp.config.window.bordered {
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            },
        },
        formatting = {
            format = require('plugins.lsp.kind').cmp_format(),
        },
        experimental = {
            ghost_text = true,
        },
    }
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } },
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
    })

    require('cmp_git').setup()

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({ { name = 'cmp_git' } }, { { name = 'buffer' } }),
    })
end

return M
