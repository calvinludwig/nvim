local common = require "plugins.lsp.common"
local lsp = require "lspconfig"
lsp.ocamllsp.setup {
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
	on_attach = common.on_attach,
	capabilities = common.capabilities,
}
