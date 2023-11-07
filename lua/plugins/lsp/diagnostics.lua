local M = {}

M.signs = {
	Error = Icons.diagnostics.ERROR,
	Warn = Icons.diagnostics.WARNING,
	Hint = Icons.diagnostics.HINT,
	Info = Icons.diagnostics.INFO,
}

function M.setup()
	vim.diagnostic.config({
		underline = true,
		update_in_insert = false,
		virtual_text = { spacing = 4, prefix = "● " },
		severity_sort = true,
		float = { border = Icons.border },
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = Icons.border,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = Icons.border,
	})
	vim.lsp.handlers["textDocument/codeAction"] = vim.lsp.with(vim.lsp.handlers.code_action, {
		border = Icons.border,
	})

	for type, icon in pairs(M.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
