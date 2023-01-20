return {
	'nvim-neo-tree/neo-tree.nvim',
	cmd = 'Neotree',
	branch = 'v2.x',
	keys = {
		{ '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'Neotree' },
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = {
		close_if_last_window = true,
		popup_border_style = Icons.border,
		enable_git_status = true,
		enable_diagnostics = true,
		window = {
			position = 'right',
			mappings = {
				['o'] = 'open',
			},
		},
		filesystem = {
			follow_current_file = true,
			components = {
				harpoon_index = function(config, node, state)
					local Marked = require 'harpoon.mark'
					local path = node:get_id()
					local succuss, index = pcall(Marked.get_index_of, path)
					if succuss and index and index > 0 then
						return {
							text = string.format(' ⥤ %d', index), -- <-- Add your favorite harpoon like arrow here
							highlight = config.highlight or 'NeoTreeDirectoryIcon',
						}
					else
						return {}
					end
				end,
			},
			renderers = {
				file = {
					{ 'icon' },
					{ 'name', use_git_status_colors = true },
					{ 'harpoon_index' }, --> This is what actually adds the component in where you want it
					{ 'diagnostics' },
					{ 'git_status', highlight = 'NeoTreeDimText' },
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
				highlight = 'NeoTreeIndentMarker',
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = '',
				expander_expanded = '',
				expander_highlight = 'NeoTreeExpander',
			},
			icon = {
				folder_empty = Icons.misc.folder_empty,
				folder_closed = Icons.misc.folder_closed,
				folder_open = Icons.misc.folder_open,
				default = Icons.misc.file,
			},
			modified = {
				symbol = '[+]',
				highlight = 'NeoTreeModified',
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = 'NeoTreeFileName',
			},
			git_status = {
				symbols = Icons.git,
			},
		},
	},
}
