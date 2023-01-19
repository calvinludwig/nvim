local common = require 'plugins.lsp.common'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('neodev').setup {}

require('lspconfig').sumneko_lua.setup {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			completion = {
				workspaceWord = true,
				callSnippet = 'Both',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = 'space',
					indent_size = '4',
					continuation_indent_size = '4',
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}
