return {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'folke/twilight.nvim',
    'ThePrimeagen/refactoring.nvim',
    {
        'simrat39/symbols-outline.nvim',
        keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } },
        config = true,
    },
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle', 'Trouble' },
        config = {
            mode = 'document_diagnostics',
            auto_open = false,
            auto_close = true,
            use_diagnostic_signs = true, -- en
        },
    },
    'jwalton512/vim-blade',
    'styled-components/vim-styled-components',
    'kovetskiy/sxhkd-vim',
}
