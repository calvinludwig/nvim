local common = require("plugins.lsp.common")

require("utils").on_attatch(function(client, buffer)
	if client.name == "tsserver" then
		vim.keymap.set(
			"n",
			"<leader>co",
			"<cmd>TypescriptOrganizeImports<CR>",
			{ buffer = buffer, desc = "Organize Imports" }
		)
		vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
	end
end)

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = {
		-- pass options to lspconfig's setup method
		on_attatch = common.on_attach,
		capabilities = common.capabilities,
	},
	servers = {
		tsserver = {
			settings = {
				typescript = {
					format = {
						indentSize = vim.o.shiftwidth,
						convertTabsToSpaces = vim.o.expandtab,
						tabSize = vim.o.tabstop,
					},
				},
				javascript = {
					format = {
						indentSize = vim.o.shiftwidth,
						convertTabsToSpaces = vim.o.expandtab,
						tabSize = vim.o.tabstop,
					},
				},
				completions = {
					completeFunctionCalls = true,
				},
			},
		},
	},
})
