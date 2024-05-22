return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v2.x",
	keys = {
		{ "<C-e>", "<cmd>Neotree toggle<cr>", desc = "Neotree Explorer" },
		{ "<C-S-e>", "<cmd>Neotree buffers toggle<cr>", desc = "Neotree Buffers" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		local highlights = require("neo-tree.ui.highlights")
		return {
			close_if_last_window = true,
			popup_border_style = Icons.border,
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "float",
				mappings = {
					["o"] = "open",
				},
			},
			-- sort_function = function(a, b)
			-- 	if a.type == b.type then
			-- 		return a.path < b.path
			-- 	else
			-- 		return a.type > b.type
			-- 	end
			-- end,
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
					icon = function(config, node, _)
						local icon = config.default or " "
						local padding = config.padding or ""
						local highlight = config.highlight or highlights.FILE_ICON

						if node.type == "directory" then
							highlight = highlights.DIRECTORY_ICON
							if node:is_expanded() then
								icon = "󰁃"
							else
								icon = "󰁔"
							end
						elseif node.type == "file" then
							local success, web_devicons = pcall(require, "nvim-web-devicons")
							if success then
								local devicon, hl = web_devicons.get_icon(node.name, node.ext)
								icon = devicon or icon
								if string.find(node.name, ".test.ts") then
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
						local Marked = require("harpoon.mark")
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
}
