local Util = require("utils")

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	cmd = { "Telescope" },
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	event = "VimEnter",
	keys = {
		{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
		{
			"<leader>/",
			Util.telescope("live_grep"),
			desc = "Grep (root dir)",
		},
		{
			"<leader>:",
			"<cmd>Telescope command_history<cr>",
			desc = "Command History",
		},
		{
			"<leader><space>",
			Util.telescope("files"),
			desc = "Find Files (root dir)",
		},
		-- find
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{
			"<leader>ff",
			Util.telescope("files"),
			desc = "Find Files (root dir)",
		},
		{
			"<leader>fF",
			Util.telescope("files", { cwd = false }),
			desc = "Find Files (cwd)",
		},
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
		-- file browser
		{
			"<leader>fe",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			desc = "File Browser (cwd)",
		},
		{ "<leader>fE", "<cmd>Telescope file_browser<cr>", desc = "File Browser (root)" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
		-- search
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{
			"<leader>sc",
			"<cmd>Telescope command_history<cr>",
			desc = "Command History",
		},
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{
			"<leader>sd",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Document diagnostics",
		},
		{
			"<leader>sD",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace diagnostics",
		},
		{
			"<leader>sg",
			Util.telescope("live_grep"),
			desc = "Grep (root dir)",
		},
		{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{
			"<leader>sH",
			"<cmd>Telescope highlights<cr>",
			desc = "Search Highlight Groups",
		},
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
		{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
		{
			"<leader>uC",
			Util.telescope("colorscheme", { enable_preview = true }),
			desc = "Colorscheme with preview",
		},
		{
			"<leader>ss",
			Util.telescope("lsp_document_symbols", {
				symbols = {
					"Class",
					"Function",
					"Method",
					"Constructor",
					"Interface",
					"Module",
					"Struct",
					"Trait",
					"Field",
					"Property",
				},
			}),
			desc = "Goto Symbol",
		},
		{
			"<leader>sS",
			Util.telescope("lsp_dynamic_workspace_symbols", {
				symbols = {
					"Class",
					"Function",
					"Method",
					"Constructor",
					"Interface",
					"Module",
					"Struct",
					"Trait",
					"Field",
					"Property",
				},
			}),
			desc = "Goto Symbol (Workspace)",
		},
	},
	config = function()
		local telescope = require("telescope")
		local opts = {
			defaults = {
				selection_caret = " ❯ ",
				entry_prefix = "   ",
				mappings = {
					i = {
						["<c-t>"] = function(...)
							return require("trouble.sources.telescope").open()
						end,
						["<a-t>"] = function(...)
							return require("trouble.providers.telescope").open_selected_with_trouble(...)
						end,
						["<a-i>"] = function()
							local action_state = require("telescope.actions.state")
							local line = action_state.get_current_line()
							Util.telescope("find_files", { no_ignore = true, default_text = line })()
						end,
						["<a-h>"] = function()
							local action_state = require("telescope.actions.state")
							local line = action_state.get_current_line()
							Util.telescope("find_files", { hidden = true, default_text = line })()
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
						["<C-f>"] = function(...)
							return require("telescope.actions").preview_scrolling_down(...)
						end,
						["<C-b>"] = function(...)
							return require("telescope.actions").preview_scrolling_up(...)
						end,
					},
					n = {
						["q"] = function(...)
							return require("telescope.actions").close(...)
						end,
					},
				},
				borderchars = {
					Icons.border[2],
					Icons.border[4],
					Icons.border[6],
					Icons.border[8],
					Icons.border[1],
					Icons.border[3],
					Icons.border[5],
					Icons.border[7],
				},
				color_devicons = true,
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					horizontal = { preview_width = 0.65 },
					vertical = { mirror = true, preview_cutoff = 25 },
					width = 0.87,
					height = 0.80,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					borderchars = {
						Icons.border[2],
						Icons.border[4],
						Icons.border[6],
						Icons.border[8],
						Icons.border[1],
						Icons.border[3],
						Icons.border[5],
						Icons.border[7],
					},
				},
			},
		}
		telescope.setup(opts)

		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,
}
