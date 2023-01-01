local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "simrat39/rust-tools.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",
        "simrat39/rust-tools.nvim",
        "folke/neodev.nvim",
    },
}

function M.config()
    require("plugins.lsp.diagnostics").setup()
    require("plugins.lsp.null-ls")

    local common = require("plugins.lsp.common")
    local servers = {
        "sumneko_lua",
        "rust_analyzer",
        "intelephense",
        "gopls",
        "html",
        "tsserver",
        "taplo",
        "bashls",
        "jsonls",
        "tailwindcss",
        "cssls",
        "yamlls",
        "pyright",
        "marksman",
        "clangd",
        "cmake",
    }
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            border = "single",
        },
    })
    require("mason-lspconfig").setup({
        ensure_installed = servers,
    })
    local lspconfig = require("lspconfig")

    for _, server in ipairs(servers) do
        local loaded, _ = pcall(require, "plugins.lsp." .. server)
        if not loaded then
            lspconfig[server].setup({
                on_attach = common.on_attach,
                capabilities = common.capabilities,
            })
        end
    end
end

return M
