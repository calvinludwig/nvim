local M = {
	enabled = true,
	'EdenEast/nightfox.nvim',
	lazy = false,
}

function M.config()
	require('nightfox').setup {
		palettes = {
			carbonfox = {
				black = { base = Colors.Neutral[800], bright = Colors.Neutral[700], dim = Colors.Neutral[500] },
				red = { base = Colors.Red[400], bright = Colors.Red[300], dim = Colors.Red[500] },
				green = { base = Colors.Green[400], bright = Colors.Green[300], dim = Colors.Green[500] },
				yellow = { base = Colors.Yellow[200], bright = Colors.Yellow[100], dim = Colors.Yellow[300] },
				blue = { base = Colors.Blue[400], bright = Colors.Blue[300], dim = Colors.Blue[500] },
				magenta = { base = Colors.Purple[400], bright = Colors.Purple[300], dim = Colors.Purple[500] },
				cyan = { base = Colors.Cyan[400], bright = Colors.Cyan[300], dim = Colors.Cyan[500] },
				orange = { base = Colors.Orange[300], bright = Colors.Orange[200], dim = Colors.Orange[400] },
				pink = { base = Colors.Pink[400], bright = Colors.Pink[300], dim = Colors.Pink[500] },
				white = { base = Colors.Neutral[100], bright = Colors.Neutral[50], dim = Colors.Neutral[200] },
				bg0 = Colors.Neutral[950],
				bg1 = Colors.Neutral[900],
				bg2 = Colors.Neutral[800],
				comment = Colors.Neutral[800],
				bg3 = Colors.Neutral[700],
				bg4 = Colors.Green[600],
				sel1 = Colors.Blue[800],
				sel0 = Colors.Blue[900],
				fg3 = Colors.Neutral[300],
				fg2 = Colors.Neutral[200],
				fg1 = Colors.Neutral[100],
				fg0 = Colors.Neutral[50],
			},
		},
		specs = {
			carbonfox = {
				diagnostic = {
					error = Colors.diagnostic.error,
					warn = Colors.diagnostic.warn,
					info = Colors.diagnostic.info,
					hint = Colors.diagnostic.hint,
				},
				git = {
					changed = Colors.git.change,
					add = Colors.git.add,
					removed = Colors.git.delete,
				},
			},
		},
		groups = {
			carbonfox = {
				Whitespace = { fg = Colors.Neutral[800] },
				CursorLine = { bg = Colors.Neutral[950] },
				CursorLineNr = { bg = Colors.Neutral[950] },
				CursorLineFold = { bg = Colors.Neutral[950] },
				CursorLineSign = { bg = Colors.Neutral[950] },
			},
		},
	}

	vim.cmd.colorscheme 'carbonfox'
end

return M
