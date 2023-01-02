return {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "folke/twilight.nvim",
    {
        "SmiteshP/nvim-navic",
        config = function()
            vim.g.navic_silence = false
            require("nvim-navic").setup({
                separator = " > ",
                highlight = true,
                depth_limit = 5,
                depth_limit_indicator = "..",
                safe_output = true,
            })
        end,
    },
    "ThePrimeagen/refactoring.nvim",
    {
        "stevearc/dressing.nvim",
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        config = {
            mode = "document_diagnostics",
            auto_open = false,
            auto_close = true,
            use_diagnostic_signs = true, -- en
        },
    },
    "jwalton512/vim-blade",
}
