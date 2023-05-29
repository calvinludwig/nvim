return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		lazy = false,
		config = function()
			local function getBorderChars()
				local border = Icons.border

				return {
					border[2],
					border[4],
					border[6],
					border[8],
					border[1],
					border[3],
					border[5],
					border[7],
				}
			end
			local telescope = require "telescope"
			local builtin = require "telescope.builtin"
			local actions = require "telescope.actions"

			local options = {
				defaults = {
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
						vertical = {
							mirror = false,
						},
					},
					borderchars = getBorderChars(),
					color_devicons = true,
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				},
				pickers = {
					find_files = {
						-- theme = 'ivy',
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					},
					file_browser = {
						theme = "ivy",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						borderchars = getBorderChars(),
					},
				},
			}
			telescope.setup(options)

			telescope.load_extension "fzf"
			telescope.load_extension "file_browser"
			telescope.load_extension "ui-select"
			telescope.load_extension "harpoon"

			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>fb", function()
				require("telescope").extensions.file_browser.file_browser { path = "%:p:h" }
			end, { desc = "[F]ile [B]rowser" })
			vim.keymap.set("n", "<leader>p", builtin.git_files, { desc = "Git files" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = "[/] Fuzzily search in current buffer]" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		config = function()
			local ui = require "harpoon.ui"
			local mark = require "harpoon.mark"
			require("harpoon").setup {
				menu = {
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
			}

			vim.keymap.set("n", "<C-h>", mark.add_file, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Open Harpoon menu" })

			for i = 1, 9, 1 do
				vim.keymap.set("n", "<leader>" .. i, function()
					ui.nav_file(i)
				end)
			end
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous { skip_groups = true, jump = true }
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next { skip_groups = true, jump = true }
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v2.x",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = function()
			local highlights = require "neo-tree.ui.highlights"
			local colors = require("catppuccin.palettes").get_palette()
			return {
				close_if_last_window = true,
				popup_border_style = Icons.border,
				enable_git_status = true,
				enable_diagnostics = true,
				window = {
					position = "right",
					mappings = {
						["o"] = "open",
					},
				},
				filesystem = {
					filtered_items = {
						visible = true, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							"node_modules",
						},
						hide_by_pattern = { -- uses glob style patterns
							--"*.meta",
							--"*/src/*/tsconfig.json",
						},
						always_show = { -- remains visible even if other settings would normally hide it
							--".gitignored",
						},
						never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
							--".DS_Store",
							--"thumbs.db"
						},
						never_show_by_pattern = { -- uses glob style patterns
							--".null-ls_*",
						},
					},
					follow_current_file = true,
					components = {
						icon = function(config, node, state)
							local icon = config.default or " "
							local padding = config.padding or " "
							local highlight = config.highlight or highlights.FILE_ICON

							if node.type == "directory" then
								highlight = highlights.DIRECTORY_ICON
								if node:is_expanded() then
									icon = "- " .. config.folder_open
								else
									icon = "+ " .. config.folder_closed
								end
							elseif node.type == "file" then
								local success, web_devicons = pcall(require, "nvim-web-devicons")
								if success then
									local devicon, hl = web_devicons.get_icon(node.name, node.ext)
									icon = devicon or icon
									if string.find(node.name, ".test.") then
										icon = "󰂓"
									end
									highlight = hl or highlight
								end
							end

							return {
								text = icon .. padding,
								highlight = highlight,
							}
						end,
						harpoon_index = function(config, node, _)
							local Marked = require "harpoon.mark"
							local path = node:get_id()
							local succuss, index = pcall(Marked.get_index_of, path)
							if succuss and index and index > 0 then
								return {
									text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
									highlight = config.highlight or "NeoTreeDirectoryIcon",
								}
							else
								return {}
							end
						end,
					},
					renderers = {
						file = {
							{ "icon" },
							{ "name", use_git_status_colors = true },
							{ "harpoon_index" }, --> This is what actually adds the component in where you want it
							{ "diagnostics" },
							{ "git_status", highlight = "NeoTreeDimText" },
						},
					},
				},
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
					indent = {
						indent_size = 4,
						padding = 0, -- extra padding on left hand side
						with_markers = false,
						highlight = "NeoTreeIndentMarker",
						with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_empty = Icons.misc.folder_empty,
						folder_closed = Icons.misc.folder_closed,
						folder_open = Icons.misc.folder_open,
						default = Icons.misc.file,
					},
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
						highlight = "NeoTreeFileName",
					},
					git_status = {
						symbols = Icons.git,
					},
				},
			}
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		event = "BufEnter",
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		},
		opts = {
			options = {
				-- stylua: ignore
				close_command = function(n) require("mini.bufremove").delete(n, false) end,
				-- stylua: ignore
				right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = Icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
		{
			"echasnovski/mini.bufremove",
			-- stylua: ignore
			keys = {
				{ "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
				{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
	},
}
