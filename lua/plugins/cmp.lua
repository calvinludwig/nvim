return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
		{
			"zbirenbaum/copilot-cmp",
			dependencies = "copilot.lua",
			opts = {},
			config = function(_, opts)
				local copilot_cmp = require("copilot_cmp")
				copilot_cmp.setup(opts)
				-- attach cmp source whenever copilot attaches
				-- fixes lazy-loading issues with the copilot cmp source
				require("utils").on_attach(function(client)
					if client.name == "copilot" then
						copilot_cmp._on_insert_enter({})
					end
				end)
			end,
		},
	},
	opts = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = Icons.border,
				}),
				documentation = cmp.config.window.bordered({
					border = Icons.border,
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-l>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", group_index = 1 },
				{ name = "copilot",  group_index = 1 },
				{ name = "luasnip",  group_index = 1 },
				{ name = "buffer",   group_index = 2 },
				{ name = "path",     group_index = 2 },
				{ name = "crates",   group_index = 2 },
			}),
			formatting = {
				format = function(_, item)
					local icons = Icons.cmp
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end

					item.abbr = string.sub(item.abbr, 1, 50)
					item.menu = ""
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "LspCodeLens",
				},
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					require("copilot_cmp.comparators").prioritize,

					-- Below is the default comparitor list and order for nvim-cmp
					cmp.config.compare.offset,
					-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		}
	end,
}
