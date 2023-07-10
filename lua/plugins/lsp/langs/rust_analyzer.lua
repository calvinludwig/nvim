local common = require "plugins.lsp.common"
local rt = require('rust-tools')

local settings = {
	["rust-analyzer"] = {
		imports = {
			granularity = {
				group = "module",
			},
			prefix = "self",
		},
		cargo = {
			allFeatures = true,
			buildScripts = { enable = true },
		},
		checkOnSave = {
			command = "clippy",
			extraArgs = {
				"--",
				"-W",
				"clippy::all",
			},
		},
	},
}

rt.setup {
	server = {
		on_attach = function(client, bufnr)
			common.on_attach(client, bufnr)
			-- Hover actions
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>cag", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
		capabilities = common.capabilities,
		settings = settings,
	},
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	}
}

-- require("lspconfig").rust_analyzer.setup {
-- 	on_attach = common.on_attach,
-- 	capabilities = common.capabilities,
-- 	cmd = { "rustup", "run", "stable", "rust-analyzer" },
-- 	settings = settings,
-- }
