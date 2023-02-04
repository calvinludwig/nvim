local M = {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'jose-elias-alvarez/null-ls.nvim',
		'folke/neodev.nvim',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
}

function M.config()
	local servers = {
		'sumneko_lua',
		'rust_analyzer',
		'ruby_ls',
		'intelephense',
		'gopls',
		'tsserver',
		'taplo',
		'bashls',
		'jsonls',
		'tailwindcss',
		'cssls',
		'yamlls',
		'pyright',
		'marksman',
		'clangd',
		'cmake',
		'dockerls',
	}

	require('plugins.lsp.diagnostics').setup()
	require 'plugins.lsp.null-ls'

	require('mason').setup()
	require('mason-lspconfig').setup {
		ensure_installed = servers
	}

	local common = require 'plugins.lsp.common'
	local lspconfig = require 'lspconfig'

	for _, server in ipairs(servers) do
		local loaded, _ = pcall(require, 'plugins.lsp.' .. server)
		if not loaded then
			lspconfig[server].setup {
				on_attach = common.on_attach,
				capabilities = common.capabilities,
			}
		end
	end
end

return M
