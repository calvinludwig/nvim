local M = {
	enabled = true,
	'rebelot/heirline.nvim',
	event = 'UIEnter',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'neovim/nvim-lspconfig',
	},
}

function M.config()
	local heirline = require 'heirline'
	local conditions = require 'heirline.conditions'
	local utils = require 'heirline.utils'

	conditions.buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand '%:t') ~= 1
	end

	conditions.hide_in_width = function(size)
		return vim.api.nvim_get_option 'columns' > (size or 140)
	end

	local Align = { provider = '%=', hl = { bg = Kanagawa.sumiInk0 } }
	local Space = { provider = ' ' }

	local VIMODE_COLORS = {
		['n'] = Kanagawa.waveBlue2,
		['no'] = Kanagawa.sakuraPink,
		['nov'] = Kanagawa.sakuraPink,
		['noV'] = Kanagawa.sakuraPink,
		['no'] = Kanagawa.sakuraPink,
		['niI'] = Kanagawa.waveBlue2,
		['niR'] = Kanagawa.waveBlue2,
		['niV'] = Kanagawa.waveBlue2,
		['v'] = Kanagawa.oniViolet,
		['vs'] = Kanagawa.oniViolet,
		['V'] = Kanagawa.crystalBlue,
		['Vs'] = Kanagawa.crystalBlue,
		[''] = Kanagawa.autumnYellow,
		['s'] = Kanagawa.autumnYellow,
		['s'] = Kanagawa.waveAqua,
		['S'] = Kanagawa.waveAqua,
		[''] = Kanagawa.autumnYellow,
		['i'] = Kanagawa.autumnGreen,
		['ic'] = Kanagawa.autumnGreen,
		['ix'] = Kanagawa.autumnGreen,
		['R'] = Kanagawa.springViolet1,
		['Rc'] = Kanagawa.springViolet1,
		['Rv'] = Kanagawa.springViolet2,
		['Rx'] = Kanagawa.springViolet1,
		['c'] = Kanagawa.surimiOrange,
		['cv'] = Kanagawa.surimiOrange,
		['ce'] = Kanagawa.surimiOrange,
		['r'] = Kanagawa.waveAqua,
		['rm'] = Kanagawa.springBlue,
		['r?'] = Kanagawa.fujiGray,
		['!'] = Kanagawa.fujiGray,
		['t'] = Kanagawa.autumnRed,
		['nt'] = Kanagawa.autumnRed,
		['null'] = Kanagawa.sakuraPink,
	}

	local ViMode = {
		init = function(self)
			self.mode = vim.api.nvim_get_mode().mode
			if not self.once then
				vim.api.nvim_create_autocmd('ModeChanged', {
					pattern = '*:*o',
					command = 'redrawstatus',
				})
				self.once = true
			end
		end,
		static = {
			mode_names = {
				['n'] = 'NORMAL',
				['no'] = 'OP',
				['nov'] = 'OP',
				['noV'] = 'OP',
				['no'] = 'OP',
				['niI'] = 'NORMAL',
				['niR'] = 'NORMAL',
				['niV'] = 'NORMAL',
				['v'] = 'VISUAL',
				['vs'] = 'VISUAL',
				['V'] = 'LINES',
				['Vs'] = 'LINES',
				[''] = 'BLOCK',
				['s'] = 'BLOCK',
				['s'] = 'SELECT',
				['S'] = 'SELECT',
				[''] = 'BLOCK',
				['i'] = 'INSERT',
				['ic'] = 'INSERT',
				['ix'] = 'INSERT',
				['R'] = 'REPLACE',
				['Rc'] = 'REPLACE',
				['Rv'] = 'V-REPLACE',
				['Rx'] = 'REPLACE',
				['c'] = 'COMMAND',
				['cv'] = 'COMMAND',
				['ce'] = 'COMMAND',
				['r'] = 'ENTER',
				['rm'] = 'MORE',
				['r?'] = 'CONFIRM',
				['!'] = 'SHELL',
				['t'] = 'TERM',
				['nt'] = 'TERM',
				['null'] = 'NONE',
			},
		},
		provider = function(self)
			return string.format(' %s ', self.mode_names[self.mode])
		end,
		hl = function(self)
			local mode = self.mode:sub(1, 1)
			return { bg = VIMODE_COLORS[mode], fg = Kanagawa.sumiInk1b, bold = true }
		end,
		update = {
			'ModeChanged',
		},
	}

	local FileNameBlock = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
		condition = conditions.buffer_not_empty,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.oldWhite },
	}

	local FileIcon = {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ':e')
			self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(
				vim.fn.fnamemodify(filename, ':t'),
				extension,
				{ default = true }
			)
		end,
		provider = function(self)
			return self.icon and (' ' .. self.icon .. ' ')
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end,
	}

	local FileName = {
		provider = function(self)
			local filename = vim.fn.fnamemodify(self.filename, ':~:.')
			if filename == '' then
				return '[No Name]'
			end
			if not conditions.width_percent_below(#filename, 0.25) then
				filename = vim.fn.pathshorten(filename)
			end
			return filename
		end,
		hl = { fg = Kanagawa.oldWhite, bold = true },
	}

	local FileFlags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = ' ● ',
			hl = { fg = Kanagawa.crystalBlue },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = '',
			hl = { fg = Kanagawa.autumnRed },
		},
	}

	local FileNameModifer = {
		hl = function()
			if vim.bo.modified then
				return { fg = Kanagawa.fujiWhite, bold = true, force = true }
			end
		end,
	}

	FileNameBlock = utils.insert(
		FileNameBlock,
		FileIcon,
		utils.insert(FileNameModifer, FileName),
		unpack(FileFlags),
		{ provider = '%< ' }
	)

	local FileSize = {
		provider = function()
			local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
			local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
			fsize = (fsize < 0 and 0) or fsize
			if fsize < 1024 then
				return ' ' .. fsize .. suffix[1] .. ' '
			end
			local i = math.floor((math.log(fsize) / math.log(1024)))
			return string.format(' %.2g%s ', fsize / math.pow(1024, i), suffix[i + 1])
		end,
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width()
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.sumiInk3 },
	}

	local Ruler = {
		provider = ' %7(%l/%3L%):%2c %P ',
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width()
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.sakuraPink },
	}

	local LSPActive = {
		condition = function()
			return conditions.hide_in_width(120) and conditions.lsp_attached()
		end,
		update = { 'LspAttach', 'LspDetach' },
		provider = function()
			local names = {}
			for _, server in pairs(vim.lsp.get_active_clients()) do
				if server.name ~= 'null-ls' then
					table.insert(names, server.name)
				end
			end
			return '  ' .. table.concat(names, ' ') .. ' '
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.oldWhite, bold = true, italic = false },
	}

	local Diagnostics = {
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width() and conditions.has_diagnostics()
		end,
		static = {
			error_icon = vim.fn.sign_getdefined('DiagnosticSignError')[1].text,
			warn_icon = vim.fn.sign_getdefined('DiagnosticSignWarn')[1].text,
			info_icon = vim.fn.sign_getdefined('DiagnosticSignInfo')[1].text,
			hint_icon = vim.fn.sign_getdefined('DiagnosticSignHint')[1].text,
		},
		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,
		update = { 'DiagnosticChanged', 'BufEnter' },
		hl = { bg = Kanagawa.sumiInk0 },
		Space,
		{
			provider = function(self)
				return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
			end,
			hl = { fg = Kanagawa.autumnRed },
		},
		{
			provider = function(self)
				return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
			end,
			hl = { fg = Kanagawa.autumnYellow },
		},
		{
			provider = function(self)
				return self.info > 0 and (self.info_icon .. self.info .. ' ')
			end,
			hl = { fg = Kanagawa.crystalBlue },
		},
		{
			provider = function(self)
				return self.hints > 0 and (self.hint_icon .. self.hints)
			end,
			hl = { fg = Kanagawa.springBlue },
		},
		Space,
	}

	local head_cache = {}

	local function get_git_detached_head()
		local git_branches_file = io.popen('git branch -a --no-abbrev --contains', 'r')
		if not git_branches_file then
			return
		end
		local git_branches_data = git_branches_file:read '*l'
		io.close(git_branches_file)
		if not git_branches_data then
			return
		end

		local branch_name = git_branches_data:match '.*HEAD (detached %w+ [%w/-]+)'
		if branch_name and string.len(branch_name) > 0 then
			return branch_name
		end
	end

	local function parent_pathname(path)
		local i = path:find '[\\/:][^\\/:]*$'
		if not i then
			return
		end
		return path:sub(1, i - 1)
	end

	local function get_git_dir(path)
		local function has_git_dir(dir)
			local git_dir = dir .. '/.git'
			if vim.fn.isdirectory(git_dir) == 1 then
				return git_dir
			end
		end

		local function has_git_file(dir)
			local gitfile = io.open(dir .. '/.git')
			if gitfile ~= nil then
				local git_dir = gitfile:read():match 'gitdir: (.*)'
				gitfile:close()

				return git_dir
			end
		end

		local function is_path_absolute(dir)
			local patterns = {
				'^/',
				'^%a:[/\\]',
			}
			for _, pattern in ipairs(patterns) do
				if string.find(dir, pattern) then
					return true
				end
			end
			return false
		end

		if not path or path == '.' then
			path = vim.fn.getcwd()
		end

		local git_dir
		while path do
			git_dir = has_git_dir(path) or has_git_file(path)
			if git_dir ~= nil then
				break
			end
			path = parent_pathname(path)
		end

		if not git_dir then
			return
		end

		if is_path_absolute(git_dir) then
			return git_dir
		end
		return path .. '/' .. git_dir
	end

	local Git = {
		condition = function()
			return conditions.buffer_not_empty() and conditions.is_git_repo()
		end,
		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0
				or self.status_dict.removed ~= 0
				or self.status_dict.changed ~= 0
		end,
		hl = { bg = Kanagawa.sumiInk1b, fg = Kanagawa.oniViolet },
		Space,
		{
			provider = function()
				if vim.bo.filetype == 'help' then
					return
				end
				local current_file = vim.fn.expand '%:p'
				local current_dir

				if vim.fn.getftype(current_file) == 'link' then
					local real_file = vim.fn.resolve(current_file)
					current_dir = vim.fn.fnamemodify(real_file, ':h')
				else
					current_dir = vim.fn.expand '%:p:h'
				end

				local git_dir = get_git_dir(current_dir)
				if not git_dir then
					return
				end

				local git_root = git_dir:gsub('/.git/?$', '')
				local head_stat = vim.loop.fs_stat(git_dir .. '/HEAD')

				if head_stat and head_stat.mtime then
					if
						head_cache[git_root]
						and head_cache[git_root].mtime == head_stat.mtime.sec
						and head_cache[git_root].branch
					then
						return ' ' .. head_cache[git_root].branch
					else
						local head_file = vim.loop.fs_open(git_dir .. '/HEAD', 'r', 438)
						if not head_file then
							return
						end
						local head_data = vim.loop.fs_read(head_file, head_stat.size, 0)
						if not head_data then
							return
						end
						vim.loop.fs_close(head_file)

						head_cache[git_root] = {
							head = head_data,
							mtime = head_stat.mtime.sec,
						}
					end
				else
					return
				end

				local branch_name = head_cache[git_root].head:match 'ref: refs/heads/([^\n\r%s]+)'
				if not branch_name then
					branch_name = get_git_detached_head()
					if not branch_name then
						head_cache[git_root].branch = ''
						return
					end
				end

				head_cache[git_root].branch = branch_name
				return ' ' .. branch_name
			end,
			hl = { bold = true },
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ('  ' .. count)
			end,
			hl = { fg = Kanagawa.autumnGreen },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ('  ' .. count)
			end,
			hl = { fg = Kanagawa.autumnRed },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ('  ' .. count)
			end,
			hl = { fg = Kanagawa.surimiOrange },
		},
		Space,
	}

	local GitArrow = {
		provider = '',
		hl = { fg = Kanagawa.sumiInk1b, bg = Kanagawa.sumiInk0 },
		condition = function()
			return conditions.buffer_not_empty() and conditions.is_git_repo()
		end,
	}

	local FileEncoding = {
		provider = function()
			local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
			return ' ' .. enc:upper() .. ' '
		end,
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width()
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.sumiInk3 },
	}

	local FileFormat = {
		provider = function()
			local fmt = vim.bo.fileformat
			if fmt == 'unix' then
				return ' LF '
			elseif fmt == 'mac' then
				return ' CR '
			else
				return ' CRLF '
			end
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.sumiInk3 },
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width()
		end,
	}

	local IndentSizes = {
		provider = function()
			local indent_type = vim.api.nvim_buf_get_option(0, 'expandtab') and 'Spaces' or 'Tab Size'
			local indent_size = vim.api.nvim_buf_get_option(0, 'tabstop')
			return (' %s: %s '):format(indent_type, indent_size)
		end,
		hl = { bg = Kanagawa.sumiInk0, fg = Kanagawa.sumiInk3 },
		condition = function()
			return conditions.buffer_not_empty() and conditions.hide_in_width()
		end,
	}

	local StatusLine = {
		ViMode,
		FileNameBlock,
		FileSize,
		Ruler,
		Align,
		LSPActive,
		Diagnostics,
		FileEncoding,
		FileFormat,
		IndentSizes,
		GitArrow,
		Git,
	}

	heirline.setup {
		statusline = StatusLine,
	}
end

return M
